
function angle = bodyTracker()
 imaqreset;

depthVid = videoinput('kinect', 2);
triggerconfig (depthVid,'manual');
framesPerTrig = 1;
depthVid.FramesPerTrigger=framesPerTrig;
depthVid.TriggerRepeat=inf;
src = getselectedsource(depthVid);
src.EnableBodyTracking = 'on';  
start([depthVid]);

%for i = 1:100
%x= true;
%while (x == true)%ishandle(plotGraph1)
[depthMap, depthMetaData] = getsnapshot(depthVid);
trackedBodies = find(depthMetaData.IsBodyTracked);

if  sum(depthMetaData.IsBodyTracked) >0
    neckKoord=depthMetaData.JointPositions(3,1:2, trackedBodies);
    spineBaseKoord=depthMetaData.JointPositions(1,1:2, trackedBodies);
    hipKoord =depthMetaData.DepthJointIndices(6,1:2, trackedBodies);
    rightKneeKoord=depthMetaData.JointPositions(14,1:2, trackedBodies);
    rightShoulderKoord=depthMetaData.JointPositions(9,1:2, trackedBodies);
    rightHand =depthMetaData.JointPositions(12,1:2, trackedBodies);

    xDiff = (neckKoord(1) - spineBaseKoord(1));
    yDiff = (neckKoord(2) - spineBaseKoord(2));
    xDiff2 = (rightKneeKoord(1) - spineBaseKoord(1));
    yDiff2 = (rightKneeKoord(2) - spineBaseKoord(2));
    xDiff3 = (rightShoulderKoord(1) - rightHand(1));
    yDiff3 = (rightShoulderKoord(2) - rightHand(2));
    bodyAngle = atan((yDiff)/(xDiff)) * 180/pi;
    armAngle = atan((yDiff3)/(xDiff3)) * 180/pi;
    angle = bodyAngle;
    
else armAngle = 10;
     bodyAngle = -19;
     angle = 20;
 end
end
%end
