function varargout = andvandning(varargin)
%ANDVANDNING MATLAB code file for andvandning.fig
%      ANDVANDNING, by itself, creates a new ANDVANDNING or raises the existing
%      singleton*.
%
%      H = ANDVANDNING returns the handle to a new ANDVANDNING or the handle to
%      the existing singleton*.
%
%      ANDVANDNING('Property','Value',...) creates a new ANDVANDNING using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to andvandning_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ANDVANDNING('CALLBACK') and ANDVANDNING('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ANDVANDNING.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help andvandning

% Last Modified by GUIDE v2.5 17-Apr-2019 11:49:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @andvandning_OpeningFcn, ...
                   'gui_OutputFcn',  @andvandning_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before andvandning is made visible.
function andvandning_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for andvandning
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes andvandning wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = andvandning_OutputFcn(hObject, eventdata, handles)
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
