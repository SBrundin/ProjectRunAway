
function Pulse = filterFunc(ECGData) %,signalNameArray,signalFormatArray,signalUnitArray)


fs = 512;
SensorMacros = SetEnabledSensorsMacrosClass;
firsttime = true;
NO_SAMPLES_IN_PLOT = 10000;                                                         % Delay (in seconds) between data read operations
numSamples = 0;
plotData = [];
timeStamp = [];
filteredplotData = [];
Result = [];
Pulse = [];
count = 0;                                                                 % To count how many times the Shimemr has tried to start streaming
ECGDataFiltered = [];
%filter settings
fm = 50;                                                                   % mains frequency [Hz]
fchp = 0.5;                                                                % corner frequency highpassfilter [Hz]; Shimmer recommends 0.5Hz for monitoring applications, 0.05Hz for diagnostic settings
nPoles = 4;                                                                % number of poles (HPF, LPF)
pbRipple = 0.5;                                                            % pass band ripple (%)

HPF = true;                                                                % enable (true) or disable (false) highpass filter
LPF = true;                                                                % enable (true) or disable (false) lowpass filter
BSF = true;

if (HPF)
    hpfexg1ch1 = FilterClass(FilterClass.HPF,fs,fchp,nPoles,pbRipple);
end
% lowpass filters for ExG channels
if (LPF)
    lpfexg1ch1 = FilterClass(FilterClass.LPF,fs,fs/2-1,nPoles,pbRipple);
    
end
% bandstop filters for ExG channels;
% cornerfrequencies at +1Hz and -1Hz from mains frequency
if (BSF)
    bsfexg1ch1 = FilterClass(FilterClass.LPF,fs,[fm-1,fm+1],nPoles,pbRipple);
end


                                                   % TRUE if the shimmer starts streamin  
                 % Pause for this period of time on each iteration to allow data to arrive in the buffer
       
         % Read the latest data from shimmer data buffer, signalFormatArray defines the format of the data and signalUnitArray the unit
        
        if ~isempty(ECGData)                                           % TRUE if new data has arrived
           
%             chIndex(1) = find(ismember(signalNameArray, 'ECG LL-RA'));
%             chIndex(2) = find(ismember(signalNameArray, 'ECG LA-RA'));
%             chIndex(3) = find(ismember(signalNameArray, 'ECG Vx-RL'));
%             chIndex(4) = find(ismember(signalNameArray, 'ECG RESP'));
            
           
            
            %Subtract secondary lead from primary to reduce noise
            %ECGDataFiltered = ECGData(:,1) - ECGData(:,4);
            %for i = 1:1:length(ECGData)
            %ECGDataFiltered = ECGDataFiltered + ECGData(i);
           ECGDataFiltered = ECGData;
            
            
            % filter the data
%             if HPF % filter newData with highpassfilter to remove DC-offset
%                 ECGDataFiltered = hpfexg1ch1.filterData(ECGDataFiltered);
%             end
%             
%             if BSF % filter highpassfiltered data with bandstopfilter to suppress mains interference
%                 ECGDataFiltered = bsfexg1ch1.filterData(ECGDataFiltered);
%             end
%             
%             if LPF % filter bandstopfiltered data with lowpassfilter to avoid aliasing
%                 ECGDataFiltered = lpfexg1ch1.filterData(ECGDataFiltered);
%             end
            %%
            %%DERIVATA FILTER
            if fs ~= 200
                int_c = (5-1)/(fs*1/40);
                b = interp1(1:5,[1 2 0 -2 -1].*(1/8)*fs,1:int_c:5);
            else
                b = [1 2 0 -2 -1].*(1/8)*fs;
            end
            %%
            %BANDPASSFILTER
            if size(ECGDataFiltered, 1)>36
                [d,c] = butter(4,[0.01, 0.15], 'bandpass');
                ECGData_filt = filtfilt(d,c,ECGDataFiltered);
                plotData = [plotData; ECGData_filt];  % Update the plotData buffer with the new filtered ECG data
                ecg_d = filtfilt(b,1,plotData); %derivative filter
                ecg_d = ecg_d/max(ecg_d);
            else
                plotData = [plotData; ECGDataFiltered];  % Update the plotData buffer with the new ECG data
                ecg_d = ECGDataFiltered;
            end
            %%
            
            numPlotSamples = size(plotData,1);
            numSamples = numSamples + size(ECGData,1);
            timeStampNew = ECGData;                                   % get timestamps
            timeStamp = [timeStamp; timeStampNew];
            
            
            %% ========== Squaring nonlinearly enhance the dominant peaks ========== %%
            ecg_s = ecg_d.^2; %filtered twice and squared
            ecg_r = sqrt(ecg_s);

            sampleNumber = 0:numSamples-1;
       
            
            
            %end
      
  

Y= prctile(ecg_s, 99, 'all')*0.21;

ecg_max = 0.2*(max(ecg_s));

[qrs, locs] = findpeaks(ecg_s, sampleNumber, 'MinPeakHeight', ecg_max, ...
    'MinPeakDistance', 150, 'MinPeakProminence', Y );
Result = locs;
   value = [];
   extrabeat = 1;
        
        for pos = 1:1:(length(Result) - 2)
            Interval1 = (Result(pos + 1) - Result(pos));        %%Fixa så "missade" slag inte påverkar HRV
            Interval2 = (Result(pos + 2) -Result(pos + 1));
            average = ((Interval1 + Interval2)/2);

            if (Interval1 > (average + 100)) && (Interval1 ~= average + 100)
                extrabeat = extrabeat + floor(Interval1/(average + 1));
            else
                difOfIntervals = (Interval2 - Interval1)^2;
                value = [value; difOfIntervals];
            end
                   RMSSD = sqrt(sum(value)/length(value))  %Ta roten ur MEDELVÄRDET av intervallsskillnaden
         Pulse = (length(Result)+ extrabeat) * 60/captureDuration ;
        end
        
   else
            Pulse = 0;
          
        end
    
end