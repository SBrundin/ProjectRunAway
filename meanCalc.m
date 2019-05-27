% function res = meanCalc(x)
% res = mean(x)
% end

function Y = meanCalc(rCoord, lCoord)
 xDiff3 = (rCoord(1) - lCoord(1));
    yDiff3 = (rCoord(2) - lCoord(2));
    %bodyAngle = atan((yDiff)/(xDiff)) * 180/pi;
     Y = atan((yDiff3)/(xDiff3)) * 180/pi;
end