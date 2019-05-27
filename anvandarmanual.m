function varargout = anvandarmanual(varargin)
% ANVANDARMANUAL MATLAB code for anvandarmanual.fig
%      ANVANDARMANUAL, by itself, creates a new ANVANDARMANUAL or raises the existing
%      singleton*.
%
%      H = ANVANDARMANUAL returns the handle to a new ANVANDARMANUAL or the handle to
%      the existing singleton*.
%
%      ANVANDARMANUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANVANDARMANUAL.M with the given input arguments.
%
%      ANVANDARMANUAL('Property','Value',...) creates a new ANVANDARMANUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before anvandarmanual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to anvandarmanual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help anvandarmanual

% Last Modified by GUIDE v2.5 17-Apr-2019 10:23:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @anvandarmanual_OpeningFcn, ...
                   'gui_OutputFcn',  @anvandarmanual_OutputFcn, ...
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


% --- Executes just before anvandarmanual is made visible.
function anvandarmanual_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to anvandarmanual (see VARARGIN)

% Choose default command line output for anvandarmanual
handles.output = hObject;
axes(handles.axes1);
imshow('logogif.gif');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes anvandarmanual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = anvandarmanual_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mainMenu;
closereq;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Utrustning
utrustning;
closereq;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Uppkoppling
uppkoppling;
closereq;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Användning
andvandning;
closereq;
