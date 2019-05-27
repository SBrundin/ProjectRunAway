function varargout = utrustning(varargin)
% UTRUSTNING MATLAB code for utrustning.fig
%      UTRUSTNING, by itself, creates a new UTRUSTNING or raises the existing
%      singleton*.
%
%      H = UTRUSTNING returns the handle to a new UTRUSTNING or the handle to
%      the existing singleton*.
%
%      UTRUSTNING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTRUSTNING.M with the given input arguments.
%
%      UTRUSTNING('Property','Value',...) creates a new UTRUSTNING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before utrustning_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to utrustning_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help utrustning

% Last Modified by GUIDE v2.5 17-Apr-2019 10:23:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @utrustning_OpeningFcn, ...
                   'gui_OutputFcn',  @utrustning_OutputFcn, ...
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


% --- Executes just before utrustning is made visible.
function utrustning_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to utrustning (see VARARGIN)

% Choose default command line output for utrustning
handles.output = hObject;

axes(handles.axes1);
imshow('lopbandgif.gif');

axes(handles.axes2);
imshow('kinectgif.gif');

axes(handles.axes3);
imshow('shimmergif.gif');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes utrustning wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = utrustning_OutputFcn(hObject, eventdata, handles) 
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
anvandarmanual;
closereq;
