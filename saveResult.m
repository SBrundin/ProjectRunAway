function user1 = saveResult(userid1,Pulse,HRV,bodymean,armmean,legmean,hast,vinkel)

if (isfile('userstruct.mat')==1)
    load userstruct.mat;
    sz = size(user,2) + 1;
else
    sz=1;
end
    
user1 = 'user1';
hrvmax = max(HRV);
hrvmin = min(HRV);
hrvavrg = mean(HRV);
pulsmax = max(Pulse);
pulsmin = min(Pulse);
pulsavrg = mean(Pulse);
meanBody = bodymean;
meanLeg = legmean;
meanArm = armmean;
d = datetime('now');

user(sz).UserID = userid1;
user(sz).DateTime = d
user(sz).HRV_max = hrvmax;
user(sz).HRV_min = hrvmin;
user(sz).HRV_avrg = hrvavrg;
user(sz).Puls_max= pulsmax;
user(sz).Puls_min = pulsmin;
user(sz).Puls_avrg = pulsavrg;
user(sz).Body_avrg = meanBody;
user(sz).Leg_avrg = meanLeg;
user(sz).Arm_avrg = meanArm;
user(sz).Hastighet = hast;
user(sz).Vinkel = vinkel;

    
save ('userstruct.mat', 'user');
user1;
clear;

end