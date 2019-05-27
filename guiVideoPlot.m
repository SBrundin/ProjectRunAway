function varargout = guiVideoPlot(varargin)
% GUIVIDEOPLOT MATLAB code for guiVideoPlot.fig
%      GUIVIDEOPLOT, by itself, creates a new GUIVIDEOPLOT or raises the existing
%      singleton*.
%
%      H = GUIVIDEOPLOT returns the handle to a new GUIVIDEOPLOT or the handle to
%      the existing singleton*.
%
%      GUIVIDEOPLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIVIDEOPLOT.M with the given input arguments.
%
%      GUIVIDEOPLOT('Property','Value',...) creates a new GUIVIDEOPLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiVideoPlot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiVideoPlot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiVideoPlot

% Last Modified by GUIDE v2.5 26-Mar-2019 15:57:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiVideoPlot_OpeningFcn, ...
                   'gui_OutputFcn',  @guiVideoPlot_OutputFcn, ...
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


% --- Executes just before guiVideoPlot is made visible.
function guiVideoPlot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiVideoPlot (see VARARGIN)

% Choose default command line output for guiVideoPlot
handles.output = hObject;
axes(handles.axes1);
vid = videoinput('kinect', 1);
showFrameOnAxis(handles.axes1, vid);
% showFrameOnAxis(handles.axes1, frame);
% colorVid = videoinput('kinect', 1);
% preview(colorVid, handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiVideoPlot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiVideoPlot_OutputFcn(hObject, eventdata, handles) 
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
