totalTime = 60;

shimmer = ShimmerHandleClass('3');
fs = 512;
SensorMacros = SetEnabledSensorsMacrosClass;
captureDuration = 20;
RMSSD = 0;
count = 0;
isConnected = shimmer.connect
runTime = 0;
Result = [];
Result1 = [];
Puls = [];
RMSSD = [];

if (isfile('user.mat')==1)
    load user.mat;
else
    user = struct;
end



while (not(isConnected) && count <= 6)
    shimmer.connect
    count = count + 1;
end

if (count >= 6)
    fprintf('Shimmer unable to connect \n')
else
    shimmer.setsamplingrate(fs);                                           % Select sampling rate
    shimmer.setinternalboard('ECG');                                       % Select internal expansion board; select 'ECG' to enable both SENSOR_EXG1 and SENSOR_EXG2
    shimmer.disableallsensors;                                             % Disable other sensors
    shimmer.setenabledsensors(SensorMacros.ECG,1)                          % Enable SENSOR_EXG1 and SENSOR_EXG2
    started = shimmer.start
    
    Result = EKG_test3(shimmer, captureDuration);
    
   
        while (runTime < totalTime )
            Result = EKG_test3(shimmer, captureDuration);
            Result1 = [Result1, Result];            %lägg till data först i resultat-arrayen
            %totalTime = totalTime - captureDuration;
            runTime = runTime + captureDuration;
            extrabeat = 1;
    
            if(runTime < 5*60)
                value = [];
                for pos = 1:1:(length(Result1) - 2)                             %Beräkna intilliggande intervall för RMSSD
                    Interval1 = (Result1(pos + 1) - Result1(pos));
                    Interval2 = (Result1(pos + 2) -Result1(pos + 1));
                    average = ((Interval1 + Interval2)/2);
    
                    if (Interval1 > (average + 100)) && (Interval1 ~= average + 100) %Ta bort intervall med missade slag
                        extrabeat = extrabeat + floor(Interval1/(average + 1));
                    else
                        difOfIntervals = (Interval2 - Interval1)^2;
                        value = [value; difOfIntervals];
                    end
                end
                RMSSD = [RMSSD,(sqrt(sum(value)/length(value)))]                         %Ta roten ur MEDELVÄRDET av intervallsskillnaden
            end
            Pulse = [Puls,(length(Result)+ extrabeat) * 60/captureDuration]
        end
    
    if(not(started))
        load gong
        sound(y, Fs)
    end
    shimmer.stop
    shimmer.disconnect;
    clear shimmer;
    
   % load train;
   % sound(y, Fs)
    
    userid = 'HEJHEJ'

    saveResult(user,userid,RMSSD,Pulse);
end