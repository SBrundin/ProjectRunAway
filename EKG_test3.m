function Result = EKG_test3(shimmer, captureDuration)

%addpath('./Resources/')
%captureDuration = 10;
DELAY_PERIOD = 0.2;
elapsedTime = 0;
fs = 512;
SensorMacros = SetEnabledSensorsMacrosClass;
firsttime = true;
NO_SAMPLES_IN_PLOT = 10000;                                                         % Delay (in seconds) between data read operations
numSamples = 0;
plotData = [];
timeStamp = [];
filteredplotData = [];
Result = [];
count = 0;                                                                 % To count how many times the Shimemr has tried to start streaming

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

%Started = shimmer.start;

tic;
%if(shimmer.start)
%if (Started)                                                     % TRUE if the shimmer starts streaming

while (elapsedTime < captureDuration)
    pause(DELAY_PERIOD);                                           % Pause for this period of time on each iteration to allow data to arrive in the buffer
    
    [newData,signalNameArray,signalFormatArray,signalUnitArray] = shimmer.getdata('c');   % Read the latest data from shimmer data buffer, signalFormatArray defines the format of the data and signalUnitArray the unit
    
    if ~isempty(newData)                                           % TRUE if new data has arrived
        
        chIndex(1) = find(ismember(signalNameArray, 'ECG LL-RA'));
        chIndex(2) = find(ismember(signalNameArray, 'ECG LA-RA'));
        chIndex(3) = find(ismember(signalNameArray, 'ECG Vx-RL'));
        chIndex(4) = find(ismember(signalNameArray, 'ECG RESP'));
        
        ECGData = newData(:,chIndex);
        
        %Subtract secondary lead from primary to reduce noise
        %ECGDataFiltered = ECGData(:,1) - ECGData(:,2);
        ECGDataFiltered = ECGData(:,1);
        
        
        % filter the data
        if HPF % filter newData with highpassfilter to remove DC-offset
            ECGDataFiltered = hpfexg1ch1.filterData(ECGDataFiltered);
        end
        
        if BSF % filter highpassfiltered data with bandstopfilter to suppress mains interference
            ECGDataFiltered = bsfexg1ch1.filterData(ECGDataFiltered);
        end
        
        if LPF % filter bandstopfiltered data with lowpassfilter to avoid aliasing
            ECGDataFiltered = lpfexg1ch1.filterData(ECGDataFiltered);
        end
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
        numSamples = numSamples + size(newData,1);
        timeStampNew = newData(:,1);                                   % get timestamps
        timeStamp = [timeStamp; timeStampNew];
        
        
        %% ========== Squaring nonlinearly enhance the dominant peaks ========== %%
        ecg_s = ecg_d.^2; %filtered twice and squared
        ecg_r = sqrt(ecg_s);
        
        figure(1)
        subplot(2,2,1)
        plot(ecg_s);
        axis tight;
        title('Squared');
        
        subplot(2,2,2)
        plot(ecg_d);
        axis tight;
        title ('Derivate');
        
        subplot(2,2,3)
        plot(ecg_r); %Borde inte detta bli samma som ecg_d?
        axis tight;
        title ('Square root');
        
        %Oklart om vi behöver denna, kanske senare
        %if numSamples > NO_SAMPLES_IN_PLOT
        % ecg_s = ecg_s(numPlotSamples-NO_SAMPLES_IN_PLOT+1:end,:);
        %filteredplotData = filteredplotData(numPlotSamples-NO_SAMPLES_IN_PLOT+1:end,:);
        % end
        
        %sampleNumber = max(numSamples-NO_SAMPLES_IN_PLOT+1,1):numSamples;
        sampleNumber = 0:numSamples-1;
        
        
    end
    elapsedTime = elapsedTime + toc;
    tic;
end
elapsedTime = elapsedTime + toc;
%shimmer.stop;
%end
Y= prctile(ecg_s, 99)*0.21;

ecg_max = 0.2*(max(ecg_s));

[qrs, locs] = findpeaks(ecg_s, sampleNumber, 'MinPeakHeight', ecg_max, ...
    'MinPeakDistance', 150, 'MinPeakProminence', Y );
Result = locs;
figure(3)
plot(sampleNumber, ecg_s)
hold on
plot(locs, qrs, 'ro')
hold off

end
