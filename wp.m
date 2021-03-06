function varargout = wp(varargin)
% WP MATLAB code for wp.fig
%      WP, by itself, creates a new WP or raises the existing
%      singleton*.
%
%      H = WP returns the handle to a new WP or the handle to
%      the existing singleton*.
%
%      WP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WP.M with the given input arguments.
%
%      WP('Property','Value',...) creates a new WP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wp

% Last Modified by GUIDE v2.5 18-May-2022 13:49:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wp_OpeningFcn, ...
                   'gui_OutputFcn',  @wp_OutputFcn, ...
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


% --- Executes just before wp is made visible.
function wp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wp (see VARARGIN)

% Choose default command line output for wp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wp_OutputFcn(hObject, eventdata, handles) 
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
%data = detectImportOptions('Dataset Hostel Jepang.xlsx','DataRange','B2:P51');
%data1=readtable('Dataset Hostel Jepang.xlsx',data);
%set(handles.uitable1,data,data1);
data = readmatrix('Dataset Hostel Jepang.xlsx');
set(handles.uitable1,'data',data);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = detectImportOptions('Dataset Hostel Jepang.xlsx','DataRange','K2:N51');
data1=readmatrix('Dataset Hostel Jepang.xlsx',data);
k = [0 1 1 1];
w = [1 4 2 3];

[m n] = size(data1);
w = w./sum(w);
for j=1:n
    if k(j)==0, w(j)= -1*w(j);
    end
end
for i=1:m
    S(i) = prod(data(i,:).^w;
end
V= S/sum(S);
[rank,rowRank] = sort(V,'descend');
baris = lenght(rank);
dataTable = cell(baris,2);
for row = 1:baris
    dataTable{row,1} = rowRank(row);
    dataTable{row,2} = rank(row);
end
set(handles.uitable2,'Data',data1);
