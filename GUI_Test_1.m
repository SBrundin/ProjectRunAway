function varargout = GUI_Test_1(varargin)
% GUI_TEST_1 MATLAB code for GUI_Test_1.fig
%      GUI_TEST_1, by itself, creates a new GUI_TEST_1 or raises the existing
%      singleton*.
%
%      H = GUI_TEST_1 returns the handle to a new GUI_TEST_1 or the handle to
%      the existing singleton*.
%
%      GUI_TEST_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEST_1.M with the given input arguments.
%
%      GUI_TEST_1('Property','Value',...) creates a new GUI_TEST_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Test_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Test_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Test_1

% Last Modified by GUIDE v2.5 14-Mar-2019 14:37:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Test_1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Test_1_OutputFcn, ...
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


% --- Executes just before GUI_Test_1 is made visible.
function GUI_Test_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Test_1 (see VARARGIN)
% 
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Test_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Test_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% num = str2double(get(handles.edit1,'string'));
% x=0:0.01:2*pi;
% y=num*cos(x);
% plot(x,y)
% axis([0 2*pi -num num])
% Hint: get(hObject,'Value') returns toggle state of togglebutton1


t=0:1:2000;
array2 = sin(t./30);
init = array2;
% 
% 
%serialPort = 'COMX'; %detta �r input signal yo
danielGrafik = 'TEST:Logger Data Serial';
xxLabel = 'time(s)';
yyLabel = 'data(signal)';
plotGrid = 'on';
min = -100;
max = 100;
scrollwidth = 10;
delay = .01;

% %initializerar variabler
 time = 0;
 data = 0;
 count = 0;
% 
% %f�rbereder grafiken
plotGraph = plot(time,data,'-o',...
    'LineWidth',1,...
    'MarkerSize',3,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','r');

title(danielGrafik,'FontSize',15);
xlabel(xxLabel,'FontSize',12);
ylabel(yyLabel,'FontSize',12);
axis([0 10 min max]);
grid(plotGrid) %aktiverar grid


    imaqreset;
%create color and depth kinect videoinput objects
colorVid = videoinput('kinect', 1);
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

tic
while ishandle(plotGraph)
[depthMap, depthMetaData] = getsnapshot(depthVid);

trackedBodies = find(depthMetaData.IsBodyTracked);

 if  sum(depthMetaData.IsBodyTracked) >0
 
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
% if(kneeAngle >= 0)
%     kneeAngle = kneeAngle - 90;
% else
%     kneeAngle = kneeAngle + 90;
% end
%  else
%      kneeAngle = 10;
 
if(armAngle >= 0)
    armAngle = armAngle - 90;
else
    armAngle = armAngle + 90;
end
 else
     armAngle = 10;
 
end
%end
%stop(depthVid);


%�ppna kommunikation via SENSOR
%  s = serial(serialPort);
% disp('St�ng f�nstret f�r att avsluta loggning');
% fopen(s)

   %aktiverar timesdetektering
%while ishandle(plotGraph)   %loopar den aktiva plotten
    
  %inputvalue = fscanf(array2,'%f');  %l�ser data i floatformat
   inputvalue = (armAngle.*t./t);%array2; %sin(t./30).*80;
  
  %Ser till att mottagen data �r korrekt
  if(~isempty(inputvalue)) %ej tom och ej float
       
      %disp('1.1 isamptyy')
      count=count+1;
      time(count) = toc;  %tar tiden
      data(count) = inputvalue(count);%tar datan
      
      %ange axrl enligt scrollwidth
      if(scrollwidth > 0)
          %disp('2.1 if scroll')
          set(plotGraph,'XData',time(time > time(count)-scrollwidth),...
              'YData',data(time > time(count)-scrollwidth));
          axis([time(count)-scrollwidth time(count) min max]);
      else
          %disp('2.2 ELSE LOL')
          set(plotGraph,'XData',time,'YData',data);
          axis([0 time(count) min max]);
      end
      
      %Tid f�r grafen att uppdatera sig
      %pause(delay);
     
  end
end

%fclose(s);
clear all;
disp('THE END')


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%closes the current figure
closereq;
%call the new script
newpage1();
% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on key press with focus on togglebutton2 and none of its controls.
function togglebutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
anotherpage();
