function varargout = anotherpage(varargin)
% ANOTHERPAGE MATLAB code for anotherpage.fig
%      ANOTHERPAGE, by itself, creates a new ANOTHERPAGE or raises the existing
%      singleton*.
%
%      H = ANOTHERPAGE returns the handle to a new ANOTHERPAGE or the handle to
%      the existing singleton*.
%
%      ANOTHERPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANOTHERPAGE.M with the given input arguments.
%
%      ANOTHERPAGE('Property','Value',...) creates a new ANOTHERPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before anotherpage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to anotherpage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help anotherpage

% Last Modified by GUIDE v2.5 02-May-2019 17:13:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @anotherpage_OpeningFcn, ...
                   'gui_OutputFcn',  @anotherpage_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before anotherpage is made visible.
function anotherpage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to anotherpage (see VARARGIN)

% Choose default command line output for anotherpage
handles.output = hObject;



handles.bodyAngle= 1;
handles.armAngle= 2;
handles.kneeAngle = 3;
handles.noAngle = 4;
% Set the current data value.
handles.current_data = handles.bodyAngle;
handles.myTime = 1;
guidata(hObject, handles);
% Update handles structure



% UIWAIT makes anotherpage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Executes on selection change in myPopUp.
function myPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to myPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns myPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from myPopUp

str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val}
case 'Ryggvinkel' % User selects peaks.
   handles.current_data = handles.bodyAngle;
case 'Armvinkel' % User selects membrane.
   handles.current_data = handles.armAngle;
case 'Benvinkel' % User selects sinc.
   handles.current_data = handles.kneeAngle;
case 'Ingen' % User selects sinc.
   handles.current_data = handles.noAngle;
end
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function myPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to myPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

time = str2double(get(hObject,'String'));
handles.myTime = time;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

UserID = get(hObject,'String');
handles.userid = UserID;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

velocity =(get(hObject,'String'));
handles.hastighet = velocity;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

angle =(get(hObject,'String'));
handles.incline = angle;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Outputs from this function are returned to the command line.
function varargout = anotherpage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles) %"Tillbaka"-knapp
% % hObject    handle to togglebutton1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton1
% 
% % hObject    handle to togglebutton1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % Hint: get(hObject,'Value') returns toggle state of togglebutton1

mainMenu;
closereq;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%TrackFcn(hObject, eventdata, handles);
imaqreset;


% % --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles) %Parallell calculations

%Initializes the color camera
imaqreset; %Restarts the camera
s = gcp(); % Get the current parallel pool
redThresh = 0.25; % Threshold for red detection
vidDevice = imaq.VideoDevice('kinect', 1);
vidInfo = imaqhwinfo(vidDevice); % Acquire input video property
hVideoIn = vision.VideoPlayer('Name', 'RunAway', ... % Output video player
                                     'Position', [350 300 vidInfo.MaxWidth.*0.5 vidInfo.MaxHeight.*0.5]);
                                  
%Create a depthcam object from the kinect and enable bodytracking
depthVid = videoinput('kinect', 2);
triggerconfig (depthVid,'manual');
framesPerTrig = 1;
depthVid.FramesPerTrigger=framesPerTrig;
depthVid.TriggerRepeat=inf;
src = getselectedsource(depthVid);
src.EnableBodyTracking = 'on';  
start(depthVid);

%Initializes values for upcomming calculations
armAngle = 0;
bodyAngle = 0;
kneeAngle = 0;

%%ECG code
stopTime = handles.myTime * 60
shimmer = ShimmerHandleClass('3');
fs = 512;
SensorMacros = SetEnabledSensorsMacrosClass;
captureDuration = 10;
RMSSD = 0;
firstTime = 0;
plotTime = 0;

%Restarts the shimmer until it connects
while (not(shimmer.connect))
    shimmer.connect
end
    shimmer.setsamplingrate(fs);                                           % Select sampling rate
    shimmer.setinternalboard('ECG');                                       % Select internal expansion board; select 'ECG' to enable both SENSOR_EXG1 and SENSOR_EXG2
    shimmer.disableallsensors;                                             % Disable other sensors
    shimmer.setenabledsensors(SensorMacros.ECG,1)
    
    %Shimmer data collection
    if(shimmer.start)        
    pulseTest =[];   
    
 while (stopTime > 0)
    stopTime = stopTime - captureDuration;

bodyTest = [];                                                            

tic %used to get graph rolling 
elapsedTime = 0;

% %preallocated arrays to store acquired values                          
bodyValues = [];
armValues = [];
legValues = [];
pulseValues = [];
HRVValues = [];

startStr = sprintf('Nu kör vi!');
set(handles.text50, 'String', startStr);

    while (elapsedTime < captureDuration)        

%Kinect-data collects and calculates during elapsedTime, repeats until
%stopTime reaches 0.

[~, depthMetaData] = getsnapshot(depthVid);
trackedBodies = find(depthMetaData.IsBodyTracked); %locates kinects "bodyslot"
 if  sum(depthMetaData.IsBodyTracked) >0
     neckKoord=depthMetaData.JointPositions(3,1:2, trackedBodies);
     spineBaseKoord=depthMetaData.JointPositions(1,1:2, trackedBodies);
     rightKneeKoord=depthMetaData.JointPositions(14,1:2, trackedBodies);
    rightShoulderKoord=depthMetaData.JointPositions(9,1:2, trackedBodies);
    rightHand =depthMetaData.JointPositions(12,1:2, trackedBodies);
   
    %Angle calculations
     xDiff = (neckKoord(1) - spineBaseKoord(1));
     yDiff = (neckKoord(2) - spineBaseKoord(2));
     xDiff2 = (rightKneeKoord(1) - spineBaseKoord(1));
     yDiff2 = (rightKneeKoord(2) - spineBaseKoord(2));
     xDiff3 = (rightShoulderKoord(1) - rightHand(1));
     yDiff3 = (rightShoulderKoord(2) - rightHand(2));
     bodyAngle = atan((yDiff)/(xDiff)) * 180/pi;
     
     %Adjust the angle so it fits in the graph
     if(bodyAngle >= 0)
    bodyAngle = bodyAngle - 90;
    else
    bodyAngle = bodyAngle + 90;
    end
     armAngle = atan((yDiff3)/(xDiff3)) * 180/pi;
    if(armAngle >= 0)
    armAngle = armAngle - 90;
    else
    armAngle = armAngle + 90;
    end
     kneeAngle = atan((yDiff2)/(xDiff2)) * 180/pi;
     if(kneeAngle >= 0)
    kneeAngle = kneeAngle - 90;
    else
    kneeAngle = kneeAngle + 90;
     end
    
     %Arrays with all the calculated angles
     bodyValues = [bodyValues bodyAngle];
     armValues = [armValues armAngle];
     legValues = [legValues kneeAngle];
 end
 
 %Color-camera calculations
  rgbFrame = step(vidDevice); % Acquire single RGBframe
  rgbFrame2 = imresize(rgbFrame, 0.50); %Scales the image
  step(hVideoIn, rgbFrame2); % Output video stream
    

%Graph information
 if (handles.current_data ~= 4)
 time = plotTime;
 data1 = 0;

xxLabel = 'time(s)';
yyLabel = 'data(signal)';

plotGrid1 = 'on';
yMin = -100;
yMax = 100;
minRed = 0;
maxRed = 200;
scrollwidth1 = 10;
count1 = 0;

%Grafikdetaljer
plotGraph0 = plot(time,data1,'-o',...
    'LineWidth',1,...
    'MarkerSize',3,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','r');
hold on;

%Graphic specifications
title('Vinkelgraf','FontSize',15);
xlabel(xxLabel,'FontSize',12);
ylabel(yyLabel,'FontSize',12);
axis([0 10 minRed maxRed]);
grid(plotGrid1) %aktivates the grid

%Decides what angle should be plotted in the graph
if (handles.current_data == 1)
    inputval = bodyAngle;
else
    if (handles.current_data == 2)
    inputval = armAngle;
    else
        inputval = kneeAngle;  
    end
end

%Chosen angle plots in the "rolling" graph
inputvalue0 = (inputval.*toc./toc); %(bodyAngle.*t./t);
        time(1) = plotTime + toc;
        data1(1) = inputvalue0;        
      if(scrollwidth1 > 0)
          set(plotGraph0,'XData',time(time > time(1)-scrollwidth1),...
              'YData',data1(time > time(1)-scrollwidth1));
          axis([time(1)-scrollwidth1 time(1) yMin yMax]);                   
      else
          set(plotGraph0,'XData',time,'YData',data1);
          axis([0 time(1) yMin yMax]);
      end     
 end
 
elapsedTime = toc;
    end
    
bodyTest = [bodyTest bodyValues]; 
plotTime = plotTime + captureDuration;   

%Mean, max and min values from calculated angles
%Leg calculations
meanLeg = floor(mean(legValues));
maxLeg = floor(max(legValues));
minLeg = floor(min(legValues));
legDiff = (maxLeg - minLeg);
legValues;

%Arm calculations
meanArm = floor(mean(armValues));
maxArm = floor(max(armValues));
minArm = floor(min(armValues));
armDiff = (maxArm - minArm);
armValues;

%Back calculations
bodyMean = floor(mean(bodyValues));
backMax = floor(max(bodyValues));
backMin = floor(min(bodyValues));
backDiff = (backMax - backMin);
bodyValues;
    
%Ifall det är första gången vi samlat in schimmer-data skickar vi bara iväg
%den till myFilterFunc. I de andra fallen hämtas resultaten från
%filterFunc efter nya skickas iväg
    if(firstTime ~= 0)
    [myResult, myRMSSD] =  fetchOutputs(parallellFunc); %Calculated values from the parallell core gets collected
    pulseValues = [pulseValues myResult];
    HRVValues = [HRVValues myRMSSD];
    [newData,signalNameArray,signalFormatArray,signalUnitArray] = shimmer.getdata('c'); %Collected shimmer data
    parallellFunc = parfeval(s,@myFilterFunc,2,newData,signalNameArray,signalFormatArray,signalUnitArray); %data gets sent to a parallell core
          myPulse = sprintf('%d',myResult);
    set(handles.text13, 'String', myPulse);
    pulseTest = [pulseTest myResult];
    myHRV = sprintf('%d',floor(myRMSSD));
    set(handles.text14, 'String', myHRV);
    else
        [newData,signalNameArray,signalFormatArray,signalUnitArray] = shimmer.getdata('c'); %Samlar in data från shimmer. Lagras i newData
        length(newData);
       parallellFunc = parfeval(s,@myFilterFunc,2,newData,signalNameArray,signalFormatArray,signalUnitArray);
       firstTime = 1;
    end
    
    %Results gets printed in the GUI
    %Back values
    myBackMean = sprintf('%d', bodyMean);
    set(handles.backMean, 'String', myBackMean);
    
     myBackMax = sprintf('%d', backMax);
    set(handles.backMax, 'String', myBackMax);
    
     myBackMin = sprintf('%d', backMin);
    set(handles.backMin, 'String', myBackMin);
    
    myBackDiff = sprintf('%d', backDiff);
    set(handles.text17, 'String', myBackDiff);
    
    %Arm values
       myArmMean = sprintf('%d', meanArm);
    set(handles.text32, 'String', myArmMean);
    
     myArmMax = sprintf('%d', maxArm);
    set(handles.text33, 'String', myArmMax);
    
     myArmMin = sprintf('%d', floor(minArm));
    set(handles.text34, 'String', myArmMin);
    
    myArmDiff = sprintf('%d', armDiff);
    set(handles.text35, 'String', myArmDiff);
    
    %Leg values
     myLegMean = sprintf('%d', meanLeg);
    set(handles.text40, 'String', myLegMean);
    
     myLegMax = sprintf('%d', maxLeg);
    set(handles.text41, 'String', myLegMax);
    
     myLegMin = sprintf('%d',minLeg);
    set(handles.text42, 'String', myLegMin);    
    
     myLegDiff = sprintf('%d', legDiff);
    set(handles.text43, 'String', myLegDiff);
    
 end

%Personal information inserted in the GUI
ID = handles.userid;
hast = handles.hastighet;
incl = handles.incline;

%Saves the result in the history
saveResult(ID,pulseTest,HRVValues,bodyMean,meanArm,meanLeg,hast,incl)

    end
    shimmer.disconnect;
    clear shimmer;
