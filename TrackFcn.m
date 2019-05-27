%function [Y] = TrackFcn()
Y = [];
t=0:1:2000;
array2 = sin(t./30);
init = array2;
%axes(handles.maxes1); %make ax1 the current axes
    imaqreset;
%create color and depth kinect videoinput objects
%colorVid = videoinput('kinect', 1);
%preview(colorVid);
depthVid = videoinput('kinect', 2);
triggerconfig (depthVid,'manual');
%triggerconfig (colorVid,'immediate');
framesPerTrig = 1;
depthVid.FramesPerTrigger=framesPerTrig;
depthVid.TriggerRepeat=inf;
src = getselectedsource(depthVid);
src.EnableBodyTracking = 'on';  
start([depthVid]);
%himg = figure;

redThresh = 0.25; % Threshold for red detection
vidDevice = imaq.VideoDevice('kinect', 1);
%viDevice.ReturnedColorspace = 'rgb';
vidInfo = imaqhwinfo(vidDevice); % Acquire input video property
hblob = vision.BlobAnalysis('AreaOutputPort', false, ... % Set blob analysis handling
                                'CentroidOutputPort', true, ... 
                                'BoundingBoxOutputPort', true', ...
                                'MinimumBlobArea', 100, ...
                                'MaximumBlobArea', 3000, ...
                                'MaximumCount', 10);
hshapeinsRedBox = vision.ShapeInserter('BorderColor', 'Custom', ... % Set Red box handling
                                        'CustomBorderColor', [1 0 0], ...
                                        'Fill', true, ...
                                        'FillColor', 'Custom', ...
                                        'CustomFillColor', [1 0 0], ...
                                        'Opacity', 0.4);
% htextins = vision.insertText('Text', 'Number of Red Object: %2d', ... % Set text for number of blobs
%                                     'Location',  [7 2], ...
%                                     'Color', [1 0 0], ... // red color
%                                     'FontSize', 12);
% htextinsCent = vision.insterText('Text', '+      X:%4d, Y:%4d', ... % set text for centroid
%                                     'LocationSource', 'Input port', ...
%                                     'Color', [1 1 0], ... // yellow color
%                                     'FontSize', 14);
hVideoIn = vision.VideoPlayer('Name', 'Final Video', ... % Output video player
                                'Position', [100 100 vidInfo.MaxWidth-20 vidInfo.MaxHeight-30]);

   
tic
for i = 1:1000
   % while true == true
%x= true;
%while (x == true)%ishandle(plotGraph1)
[depthMap, depthMetaData] = getsnapshot(depthVid);

anyBodiesTracked = any(depthMetaData.IsBodyTracked ~= 0);
trackedBodies = find(depthMetaData.IsBodyTracked);
nBodies = length(trackedBodies);

 if  sum(depthMetaData.IsBodyTracked) >0
%  skeletonJoints = depthMetaData.DepthJointIndices (:,:,depthMetaData.IsBodyTracked);
%  for i = 1:24
%  for body = 1:nBodies
%  X1 = [skeletonJoints(SkeletonConnectionMap(i,1),1,body); skeletonJoints(SkeletonConnectionMap(i,2),1,body)];
%  Y1 = [skeletonJoints(SkeletonConnectionMap(i,1),2,body), skeletonJoints(SkeletonConnectionMap(i,2),2,body)];
neckKoord=depthMetaData.JointPositions(3,1:2, trackedBodies);
spineBaseKoord=depthMetaData.JointPositions(1,1:2, trackedBodies);
hipKoord =depthMetaData.DepthJointIndices(6,1:2, trackedBodies);
rightKneeKoord=depthMetaData.JointPositions(14,1:2, trackedBodies);
rightShoulderKoord=depthMetaData.JointPositions(9,1:2, trackedBodies);
rightHand =depthMetaData.JointPositions(12,1:2, trackedBodies);
%RhandKoord =depthMetaData.JointPositions(1, 1:2, trackedBodies);
%x = [(neckKoord(1) - spineBaseKoord(1)) (neckKoord(2) - spineBaseKoord(2))]
%y = neckKoord(2) - hipKoord(2)
xDiff = (neckKoord(1) - spineBaseKoord(1));
yDiff = (neckKoord(2) - spineBaseKoord(2));
 xDiff2 = (rightKneeKoord(1) - spineBaseKoord(1));
 yDiff2 = (rightKneeKoord(2) - spineBaseKoord(2));
xDiff3 = (rightShoulderKoord(1) - rightHand(1));
yDiff3 = (rightShoulderKoord(2) - rightHand(2));
bodyAngle = atan((yDiff)/(xDiff)) * 180/pi;
armAngle = atan((yDiff3)/(xDiff3)) * 180/pi;
kneeAngle = atan((yDiff2)/(xDiff2)) * 180/pi;
Y = kneeAngle;
%Y = armAngle;

 else armAngle = 10;
     kneeAngle = -19;
   
 end 
 
 rgbFrame = step(vidDevice); % Acquire single frame
   % rgbFrame = flipdim(rgbFrame,2); % obtain the mirror image for displaying
    diffFrame = imsubtract(rgbFrame(:,:,3), rgb2gray(rgbFrame)); % Get red component of the image
    diffFrame = medfilt2(diffFrame, [3 3]); % Filter out the noise by using median filter
    binFrame = imbinarize(diffFrame, redThresh); % Convert the image into binary image with the red objects as white
    [centroid, bbox] = step(hblob, binFrame); % Get the centroids and bounding boxes of the blobs
    centroid = uint16(centroid); % Convert the centroids into Integer for further steps 
    rgbFrame(1:20,1:165,:) = 0; % put a black region on the output stream
    vidIn = step(hshapeinsRedBox, rgbFrame, bbox); % Instert the red box
%     for object = 1:1:length(bbox(:,1)) % Write the corresponding centroids
%         centX = centroid(object,1); centY = centroid(object,2);
%         vidIn = step(htextinsCent, vidIn, [centX centY], [centX-6 centY-9]); 
%     end
    %vidIn = step(htextins, vidIn, uint8(length(bbox(:,1)))); % Count the number of blobs
    step(hVideoIn, vidIn); % Output video stream
    Y;
 
end

%  % %initializerar variabler
%   time = 0;
%  data1 = 0;
%  data2 = 0;
%  data3 = 0;
%  count = 0;
%  
% xxLabel = 'time(s)';
% yyLabel = 'data(signal)';
% 
% 
% axes(handles.maxes1)
% %Graf_1 maxes1: grafikdel av beräkningar
% %konstanter
% 
% plotGrid1 = 'on';
% min1 = -100;
% max1 = 100;
% scrollwidth1 = 10;
% delay1 = .001;
% count1 = 0;
% 
% %Grafikdetaljer
% plotGraph0 = plot(time,data1,'-o',...
%     'LineWidth',1,...
%     'MarkerSize',3,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','r');
% hold on;
% 
% %Grafikspecifikationer
% title('Graf 1','FontSize',15);
% xlabel(xxLabel,'FontSize',12);
% ylabel(yyLabel,'FontSize',12);
% axis([0 10 min1 max1]);
% grid(plotGrid1) %aktiverar grid
% 
% %funktion of death
% inputvalue0 = (armAngle.*toc./toc); %(bodyAngle.*t./t);
% if(~isempty(inputvalue0)) %ej tom och ej float
%       %disp('1.1 isamptyy')
%       count1=count1+1;
%       time(count1) = toc;  %tar tiden
%       data1(count1) = inputvalue0(count1);%tar datan
%       if(scrollwidth1 > 0)
%           %disp('2.1 if scroll')
%           set(plotGraph0,'XData',time(time > time(count1)-scrollwidth1),...
%               'YData',data1(time > time(count1)-scrollwidth1));
%           axis([time(count1)-scrollwidth1 time(count1) min1 max1]);
%           
%           
%       else
%           %disp('2.2 ELSE LOL')
%           set(plotGraph0,'XData',time,'YData',data1);
%           axis([0 time(count1) min1 max1]);
%       end
%       %pause(delay1);
% end
% 
% % 
% 
% 
% axes(handles.maxes2)
% %Graf_2 maxes2: grafikdel av beräkningar
% %konstanter
% 
% plotGrid2 = 'on';
% min2 = -100;
% max2 = 100;
% scrollwidth2 = 10;
% delay2 = .001;
% 
% %Grafikdetaljer
% plotGraph2 = plot(time,data2,'-o',...
%     'LineWidth',1,...
%     'MarkerSize',3,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','r');
% hold on;
% 
% %Grafikspecifikationer
% title('Graf 2','FontSize',15);
% xlabel(xxLabel,'FontSize',12);
% ylabel(yyLabel,'FontSize',12);
% axis([0 10 min2 max2]);
% grid(plotGrid2) %aktiverar grid
% 
% %funktion of death
% inputvalue2 = (2.*toc);
% if(~isempty(inputvalue2)) %ej tom och ej float
%       %disp('1.1 isamptyy')
%       count=count+1;
%       
%       time(count) = toc;  %tar tiden
%       data2(count) = inputvalue2(count);%tar datan
%       if(scrollwidth2 > 0)
%           %disp('2.1 if scroll')
%           set(plotGraph2,'XData',time(time > time(count)-scrollwidth2),...
%               'YData',data2(time > time(count)-scrollwidth2));
%           axis([time(count)-scrollwidth2 time(count) min2 max2]);
%           
%           
%       else
%           %disp('2.2 ELSE LOL')
%           set(plotGraph2,'XData',time,'YData',data2);
%           axis([0 time(count) min2 max2]);
%       end
%       %pause(delay2);
% end
% end
% 
% %fclose(s);
% %clear all;
% disp('THE END')
% Y
