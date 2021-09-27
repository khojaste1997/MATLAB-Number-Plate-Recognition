
function varargout = PlakGUI(varargin)
% PLAKGUI MATLAB code for PlakGUI.fig
%      PLAKGUI, by itself, creates a new PLAKGUI or raises the existing
%      singleton*.
%
%      H = PLAKGUI returns the handle to a new PLAKGUI or the handle to
%      the existing singleton*.
%
%      PLAKGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAKGUI.M with the given input arguments.
%
%      PLAKGUI('Property','Value',...) creates a new PLAKGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlakGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlakGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlakGUI

% Last Modified by GUIDE v2.5 24-Aug-2019 21:19:10

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlakGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PlakGUI_OutputFcn, ...
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

% --- Executes just before PlakGUI is made visible.
function PlakGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PlakGUI (see VARARGIN)

% Choose default command line output for PlakGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PlakGUI wait for user response (see UIRESUME)
% uiwait(handles.plaktag);


% --- Outputs from this function are returned to the command line.
function varargout = PlakGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in starttag.
function starttag_Callback(hObject, eventdata, handles)

set(handles.edit1,'String','START');
num = plakyabi();
if(num==0) 
    set(handles.edit1,'String','WARNING!!!');
    
else 
    set(handles.edit1,'String','OK :)');
    DoorOpen();%%open door
end
pic= PlakImage();
axes(handles.axes1);
imshow(pic);

%%namayesh plak

% hObject    handle to starttag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in okbutton.
% function okbutton_Callback(hObject, eventdata, handles)
% 
% % hObject    handle to okbutton (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 

% --- Executes on button press in gheiremojaz.
function gheiremojaz_Callback(hObject, eventdata, handles)
WarningIOT();
DoorNotOpen();
%arduinoCode(0);
set(handles.edit1,'String','Send mail for admin!!!');
% if(yesORno=='false')
%     disp("warning");
%     
% end
% hObject    handle to gheiremojaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mehman.
function mehman_Callback(hObject, eventdata, handles)
set(handles.edit1,'String','Ok! mashin vared shavad.');
DoorOpen();
% ard=arduino('COM4','uno');
% %arduinoCode(1);
% disp('on');
% writeDigitalPin(ard, 'D13', '1');
% puase(3000);
% if(yesORno=='false')
%     disp("no problem");
% end
% hObject    handle to mehman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
