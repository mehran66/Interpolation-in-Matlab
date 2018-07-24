function varargout = main(varargin)
% MAIN M-file for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 02-Jan-2011 23:04:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Determenistic_Callback(hObject, eventdata, handles)
% hObject    handle to Determenistic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Stochastic_Callback(hObject, eventdata, handles)
% hObject    handle to Stochastic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Kriging_Callback(hObject, eventdata, handles)
% hObject    handle to Kriging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Global_Callback(hObject, eventdata, handles)
% hObject    handle to Global (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Local_Callback(hObject, eventdata, handles)
% hObject    handle to Local (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Irregular_Callback(hObject, eventdata, handles)
% hObject    handle to Irregular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.btnregular,'enable','off')
set(handles.btnirregular,'enable','on')

% --------------------------------------------------------------------
function Regular_Callback(hObject, eventdata, handles)
% hObject    handle to Regular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat check
set(handles.btnregular,'enable','on')
set(handles.btnirregular,'enable','off')


% --------------------------------------------------------------------
function Polynomial_Callback(hObject, eventdata, handles)
% hObject    handle to Polynomial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=1;
mat=[];
check=[];
cla
set(handles.title,'string','Polynomial Method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','on')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','on')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','on')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.btnregular,'enable','on')
set(handles.btnirregular,'enable','on')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);

% --------------------------------------------------------------------
function Nearest_neighbor_Callback(hObject, eventdata, handles)
% hObject    handle to Nearest_neighbor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=4;
mat=[];
check=[];
cla
set(handles.title,'string','Nearest Neighbor method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);

% --------------------------------------------------------------------
function Linear2_Callback(hObject, eventdata, handles)
% hObject    handle to Linear2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=5;
mat=[];
check=[];
cla
set(handles.title,'string','Linear(Regular) method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);

% --------------------------------------------------------------------
function Bilinear_Callback(hObject, eventdata, handles)
% hObject    handle to Bilinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=6;
mat=[];
check=[];
cla
set(handles.title,'string','Bilinear method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);


% --------------------------------------------------------------------
function Bicubic_Callback(hObject, eventdata, handles)
% hObject    handle to Bicubic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=7;
mat=[];
check=[];
cla
set(handles.title,'string','Bicubic method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);


% --------------------------------------------------------------------
function IDW2_Callback(hObject, eventdata, handles)
% hObject    handle to IDW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=8;
mat=[];
check=[];
cla
set(handles.title,'string','Inverse Distance Weighting(Regular) method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','on')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);


% --------------------------------------------------------------------
function TPS_Callback(hObject, eventdata, handles)
% hObject    handle to TPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=9;
mat=[];
check=[];
cla
set(handles.title,'string','Thin Plate Spline Method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','on')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','on')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);

% --------------------------------------------------------------------
function Linear1_Callback(hObject, eventdata, handles)
% hObject    handle to Linear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=2;
mat=[];
check=[];
cla
set(handles.title,'string','Linear (Irregular) Method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);


% --------------------------------------------------------------------
function Second_exact_fit_Callback(hObject, eventdata, handles)
% hObject    handle to Second_exact_fit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=3;
mat=[];
check=[];
cla
set(handles.title,'string','Second Exact Fit Method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);

function IDW1_Callback(hObject, eventdata, handles)
% hObject    handle to IDW1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=2.5;
mat=[];
check=[];
cla
set(handles.title,'string','Inverse Distance Weighting(Irregular) method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','on')
set(handles.uipanel8,'visible','off')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','on')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);

% --- Executes on button press in btnregular.
function btnregular_Callback(hObject, eventdata, handles)
% hObject    handle to btnregular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat
inputfile=uigetfile('*.txt');
reg=load(inputfile);
set(handles.table,'data',reg);
set(handles.btnapply,'enable','on');
mat=reg;
[rr,cc]=size(mat);
cla;
plot(mat(:,2),mat(:,3),'o','MarkerEdgeColor','k','MarkerSize',2);
for i=1:rr
    a=num2str(mat(i,4));
    text(mat(i,2)+1,mat(i,3)+1,a,'fontsize',7,'color','b');
end


% --- Executes on button press in btnirregular.
function btnirregular_Callback(hObject, eventdata, handles)
% hObject    handle to btnirregular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat
inputfile=uigetfile('*.txt');
ireg=load(inputfile);
set(handles.table,'data',ireg)
set(handles.btnapply,'enable','on');
mat=ireg;
[rr,cc]=size(mat);
cla;
plot(mat(:,2),mat(:,3),'o','MarkerEdgeColor','k','MarkerSize',2);
for i=1:rr
    a=num2str(mat(i,4));
    text(mat(i,2)+3,mat(i,3)+3,a,'fontsize',7,'color','b');
end

% --------------------------------------------------------------------
function Simple_Callback(hObject, eventdata, handles)
% hObject    handle to Simple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=10;
mat=[];
check=[];
cla
set(handles.title,'string','Simple Kriging Method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','on')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.btnregular,'enable','on')
set(handles.btnirregular,'enable','on')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);


% --------------------------------------------------------------------
function Ordinary_Callback(hObject, eventdata, handles)
% hObject    handle to Ordinary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global counter mat check
counter=11;
mat=[];
check=[];
cla
set(handles.title,'string','Ordinary Kriging Method')
set(handles.uipanel1,'visible','on')
set(handles.uipanel2,'visible','off')
set(handles.uipanel3,'visible','on')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','on')
set(handles.btnapply,'visible','on','enable','off')
set(handles.poppoly,'visible','off')
set(handles.popIDW,'visible','off')
set(handles.axes1,'visible','on')
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.lblResult,'string','')
set(handles.btnregular,'enable','on')
set(handles.btnirregular,'enable','on')
set(handles.table,'data',mat);
set(handles.table2,'data',check);
set(handles.table3,'data',[]);
set(handles.table4,'data',[]);



% --- Executes on button press in btncheck.
function btncheck_Callback(hObject, eventdata, handles)
% hObject    handle to btncheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global check
inputfile=uigetfile('*.txt');
check=load(inputfile);
set(handles.table2,'data',check);


% --- Executes on button press in btnapply.
function btnapply_Callback(hObject, eventdata, handles)
% hObject    handle to btnapply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat check counter iner_IDW
if size(check)==[0,0]
    check=1;
end
xx=str2num(get(handles.edit1,'string'));
yy=str2num(get(handles.edit2,'string'));
if isempty(xx) | isempty(yy)
    h=msgbox('please enter appropriate value.','vacant field','error');
else
    hold on
    plot(xx,yy,'p','MarkerEdgeColor','r','MarkerSize',2);
switch counter
    case 1
        %polynomial method
        Degree=get(handles.poppoly,'value')-1;
        if Degree==0
            msgbox('please select a degree to continue the process.','Unselected field','error');
        else
            [Za,RMSE_control,max_error_control,min_error_control,RMSE_check,max_error_check,min_error_check]=Polynomial(xx,yy,mat,check,Degree);
            set(handles.lblResult,'string',Za);
            d1=[RMSE_control,max_error_control,min_error_control];
            d2={RMSE_check,max_error_check,min_error_check};
            set(handles.table3,'data',d1);
            set(handles.table4,'data',d2);
        end
    case 2
        %linear irregular method
        [Za,RMSE_control,max_error_control,min_error_control]=Linear_main_FNC(xx,yy,mat);
        set(handles.lblResult,'string',Za);
        d1=[RMSE_control,max_error_control,min_error_control];
        set(handles.table3,'data',d1);
    case 2.5
        %IDW Irregular
         method=get(handles.popIDW,'value');
         if get(handles.radiobutton1,'value')==1
         Za=IDW_6Points(xx,yy,mat,method);
         elseif get(handles.radiobutton2,'value')==1
         Za=IDW_3Points(xx,yy,mat,method);
         end
         set(handles.lblResult,'string',Za);
         d1=[0,0,0];
         set(handles.table3,'data',d1);
    case 3
        %second exact fit method
        [Za,RMSE_control,max_error_control,min_error_control]=SecondExactFit_main_FNC(xx,yy,mat);
        set(handles.lblResult,'string',Za);
        d1=[RMSE_control,max_error_control,min_error_control];
        set(handles.table3,'data',d1);
    case 4
        %nearest neighbor method
        Za=NN(xx,yy,mat);
        set(handles.lblResult,'string',Za);
        d1=[0,0,0];
        set(handles.table3,'data',d1);
    case 5
        %linear regular method
        Za=Linear_Regular_Fn(xx,yy,mat);
        set(handles.lblResult,'string',Za);
        d1=[0,0,0];
        set(handles.table3,'data',d1);
    case 6
        %Bilinear method
        Za=Linear_Regular_Fn(xx,yy,mat);
        set(handles.lblResult,'string',Za);
        d1=[0,0,0];
        set(handles.table3,'data',d1);
    case 7
        %biqubic method
        Za=Biqubic(xx,yy,mat);
        set(handles.lblResult,'string',Za);
        d1=[0,0,0];
        set(handles.table3,'data',d1);
    case 8
        %IDW regular method
        method=get(handles.popIDW,'value');
        Za=IDW_Grid(xx,yy,mat,method);
        set(handles.lblResult,'string',Za);
        d1=[0,0,0];
        set(handles.table3,'data',d1);
        
    case 9
        %TPS method
        [Za,RMSE_control,max_error_control,min_error_control,RMSE_check,max_error_check,min_error_check]=TPS(xx,yy,mat,check);
        set(handles.lblResult,'string',Za);
        d1=[RMSE_control,max_error_control,min_error_control];
        d2={RMSE_check,max_error_check,min_error_check};
        set(handles.table3,'data',d1);
        set(handles.table4,'data',d2);
    case 10
        %Simple kriging method
        [Za,D]=Kriging_simple_Fnc(mat,xx,yy);
        set(handles.lblResult,'string',Za);
        set(handles.text11,'string',D);
    case 11
        %ordinary kriging method
        [Za,D]=Kriging_ordinary_Fnc(mat,xx,yy);
        set(handles.lblResult,'string',Za);
        set(handles.text11,'string',D);   
end
a=num2str(Za);
text(xx+3,yy+3,a,'fontsize',7,'color','r');
end


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in poppoly.
function poppoly_Callback(hObject, eventdata, handles)
% hObject    handle to poppoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns poppoly contents as cell array
%        contents{get(hObject,'Value')} returns selected item from poppoly


% --- Executes during object creation, after setting all properties.
function poppoly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to poppoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popIDW.
function popIDW_Callback(hObject, eventdata, handles)
% hObject    handle to popIDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popIDW contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popIDW


% --- Executes during object creation, after setting all properties.
function popIDW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popIDW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'value',0)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton2,'value',0)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,y] = ginput(1);
c1=num2str(x);
c2=num2str(y);
set(handles.edit1,'string',c1);
set(handles.edit2,'string',c2);
set(handles.lblResult,'string','');