function varargout = sudoku(varargin)
% SUDOKU MATLAB code for sudoku.fig
%      SUDOKU, by itself, creates a new SUDOKU or raises the existing
%      singleton*.
%
%      H = SUDOKU returns the handle to a new SUDOKU or the handle to
%      the existing singleton*.
%
%      SUDOKU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUDOKU.M with the given input arguments.
%
%      SUDOKU('Property','Value',...) creates a new SUDOKU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sudoku_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sudoku_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sudoku

% Last Modified by GUIDE v2.5 05-Apr-2017 17:30:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sudoku_OpeningFcn, ...
                   'gui_OutputFcn',  @sudoku_OutputFcn, ...
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


% --- Executes just before sudoku is made visible.
function sudoku_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sudoku (see VARARGIN)

% Choose default command line output for sudoku
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sudoku wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sudoku_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status,'String','Status');
for row = 'a':'i'
    for col = '1':'9'
        z = strcat(row,col);
        h = findobj('Tag',z);
        set(h,'String','');
    end
end

% --- Executes on button press in solve.
function solve_Callback(hObject, eventdata, handles)
% hObject    handle to solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status,'String','Processing....');
a=[];
i = 1;
j = 1;
for row = 'a':'i'
    j=1;
    for col = '1':'9'
        z = strcat(row,col);
        h = findobj('Tag',z);
        x = get(h,'String');
        if ~isempty(x)
            a(i,j)=str2num(x);
        else
            a(i,j)=0;
        end
        j = j+1;
    end
    i=i+1;
end
[c a] = SolveSudoku(a);
if c==1
    set(handles.status,'String','The Suduoku is Succesfully solved');
else
    set(handles.status,'String','invalid input or no solution exists');
end
