function varargout = newpage1(varargin)
% NEWPAGE1 MATLAB code for newpage1.fig
%      NEWPAGE1, by itself, creates a new NEWPAGE1 or raises the existing
%      singleton*.
%
%      H = NEWPAGE1 returns the handle to a new NEWPAGE1 or the handle to
%      the existing singleton*.
%
%      NEWPAGE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWPAGE1.M with the given input arguments.
%
%      NEWPAGE1('Property','Value',...) creates a new NEWPAGE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newpage1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newpage1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newpage1

% Last Modified by GUIDE v2.5 12-Mar-2019 17:36:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newpage1_OpeningFcn, ...
                   'gui_OutputFcn',  @newpage1_OutputFcn, ...
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


% --- Executes just before newpage1 is made visible.
function newpage1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newpage1 (see VARARGIN)

% Choose default command line output for newpage1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newpage1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newpage1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%closereq;
% Hint: get(hObject,'Value') returns toggle state of togglebutton1



p = gcp(); % Get the current parallel pool
f = parfeval(p,@colorTracker,1);
value = fetchOutputs(f) % Block until f completes


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
% axes(handles.axes1)
% %Graf_1 maxes1: grafikdel av beräkningar
% %konstanter
% 
% plotGrid1 = 'on';
% min1 = -100;
% max1 = 100;
% minRed = 0;
% maxRed = 2000;
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
% axis([0 10 minRed maxRed]);
% grid(plotGrid1) %aktiverar grid
% 
% %funktion of death
% 
%         
% inputvalue0 = angle1; %(bodyAngle.*t./t);
% %if(~isempty(inputvalue0)) %ej tom och ej float
%       %disp('1.1 isamptyy')
%       count1=count1+1;
%       time(count1) = toc;  %tar tiden
%       data1(count1) = inputvalue0(count1);%tar datan
%       if(scrollwidth1 > 0)
%           %disp('2.1 if scroll')
%           set(plotGraph0,'XData',time(time > time(count1)-scrollwidth1),...
%               'YData',data1(time > time(count1)-scrollwidth1));
%           axis([time(count1)-scrollwidth1 time(count1) minRed maxRed]);
%           
%           
%       else
%           %disp('2.2 ELSE LOL')
%           set(plotGraph0,'XData',time,'YData',data1);
%           axis([0 time(count1) minRed maxRed]);
%       end
% 
% axes(handles.axes2)
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
% inputvalue2 = (colorCoord);
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
