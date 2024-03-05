function varargout = gui1(varargin)
% GUI1 MATLAB code for gui1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui1

% Last Modified by GUIDE v2.5 28-Apr-2021 23:13:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
global img_name;
img_name = inputname(1);
disp(img_name);
%guidata(hObject, handles);
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_OutputFcn, ...
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


% --- Executes just before gui1 is made visible.
function gui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui1 (see VARARGIN)
background = importdata('scene.jpg');
axes(handles.axes2);
image(background);
axis off;
global img_name;
disp("fun");
disp(img_name);
% Choose default command line output for gui1
handles.img = varargin{1};
handles.img_name = img_name;
handles.scale = 1;
handles.window = 800;
handles.window_temp = 800;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles) 
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
AxesBg = axes('units','pixels','pos',[0,0,1000,1000]);
uistack(AxesBg,'down');
axes(AxesBg);
%axes(handles.axes1);
image = imread('screen.png');

imshow(image);
%set(AxesBg, 'visible','off');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window_greater = handles.window_temp;
window_greater = window_greater * 1.2;
img = handles.img;
resize_imtool1(img, window_greater,handles.img_name);
handles.window_temp = window_greater;
% [m,n,l] = size(img);
% handles.window = window_greater;
% if m >= n
%     m1 = window_greater;
%     n1 = n/m * window_greater;
% else 
%     n1 = window_greater;
%     m1 = m/n * window_greater;
% end
% img1 = imresize(img,[m1 n1]);
% imtool(img1);
guidata(hObject, handles);





% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
window_less = handles.window_temp;   
window_less = window_less * 0.8;
img = handles.img;
resize_imtool1(img, window_less,handles.img_name);
handles.window_temp = window_less;
guidata(hObject, handles);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
window = handles.window;  %660
% = imread('points.jpg');
handles.window_temp = handles.window; 
img = handles.img;
[m,n,l] = size(img);
if m >= n
    m1 = window;
    n1 = n/m * window;
    scale = window/m;
else 
    n1 = window;
    m1 = m/n * window;
end
scale_per = round(scale *100);
%img_name = inputname(1);
%img_name = handles.img_name;
disp('œ‘ æ√˚≥∆');
%global img_name;
%disp(img_name);
img_name_gui = handles.img_name;
display = sprintf("%s %d%s",img_name_gui,scale_per,'%');
img1 = imresize(img,[m1 n1]);
hfigure = imtool(img1);
%img_name1 = get(hfigure,'name');
%str =  img_name + scale_per + "%";
set(hfigure,'name',display,'NumberTitle','on');


% --- Executes on button press in pushbutton5.



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
val = get(hObject, 'value');
disp(val);
window_val = handles.window_temp;   
window_val = window_val * (1 + val);
img = handles.img;
resize_imtool1(img, window_val,handles.img_name);
%handles.window_temp = window_val;
guidata(hObject, handles);


% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool(handles.img);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
