function varargout = FTA_Trainer_32(varargin)
    % FTA_TRAINER_32 MATLAB code for FTA_Trainer_32.fig
    %      FTA_TRAINER_32, by itself, creates a new FTA_TRAINER_32 or raises the existing
    %      singleton*.
    %
    %      H = FTA_TRAINER_32 returns the handle to a new FTA_TRAINER_32 or the handle to
    %      the existing singleton*.
    %
    %      FTA_TRAINER_32('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in FTA_TRAINER_32.M with the given input arguments.
    %
    %      FTA_TRAINER_32('Property','Value',...) creates a new FTA_TRAINER_32 or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before FTA_Trainer_32_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to FTA_Trainer_32_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help FTA_Trainer_32
    
    % Last Modified by GUIDE v2.5 20-Oct-2020 20:36:33
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @FTA_Trainer_32_OpeningFcn, ...
                       'gui_OutputFcn',  @FTA_Trainer_32_OutputFcn, ...
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
    
    
    % --- Executes just before FTA_Trainer_32 is made visible.
    function FTA_Trainer_32_OpeningFcn(hObject, eventdata, handles, varargin)
    global imgName %name of last run image
%     imgName = 'none'; %no previous image
    try
        imshow(imread('star.tif')) %show star.tif as image on main GUI (Graphic User Interface)
        set(handles.done_running,'ForegroundColor','green'); %set done text to green (can run program) 
        set(handles.screen_calibration,'Visible','off'); %turn visibility of screen calibration off 
    catch exception
       msgbox('no stra.tif image found');
       disp(exception) %write error message
    end
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to FTA_Trainer_32 (see VARARGIN)
    
    % Choose default command line output for FTA_Trainer_32
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes FTA_Trainer_32 wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
    function varargout = FTA_Trainer_32_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    
    
    
    function B2_Callback(hObject, eventdata, handles)
    % hObject    handle to B2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of B2 as text
    %        str2double(get(hObject,'String')) returns contents of B2 as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function B2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to B2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in Star.
    function Star_Callback(hObject, eventdata, handles)
    % hObject    handle to Star (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global add_star_counter %number of times 'Add Star' button got pressed after 'RUN' button got pressed
    global last_star %counter for how many stars were added
    global Sum_D_Star % sum of stars diameters
    global Sum_M_Star % sum of stars mass
    global Sum_M_Star_F % sum of stars mass of the fission material
    Sum_D_Star = 0; %reset counter for sum of star diameters
    Sum_M_Star = 0; %reset counter for sum of star 
    Sum_M_Star_F = 0; %reset counter for sum of star 
    add_star_counter = 0; %reset counter for number of times "Add Star" was clicked in a row
    last_star = 0; %reset counter for the last star made
    

    
         set(handles.Star,'Enable','off'); % once the button is pressed the "RUN" button is disabled until the end of the run 
         set(handles.Add_Star,'Enable','off'); % once the button is pressed the "Add Star" button is disabled until the end of the run
         set(handles.done_running,'String','RUNNING','ForegroundColor','red'); % the program is running so we change the text to "RUNNING" in red until the run is done
         pause(1); % wait for 1 second (in order to disable )
         set(handles.Sum_D_Star,'String',num2str(Sum_D_Star)); % write sum of stars diameters on GUI
         set(handles.Sum_M_Star,'String',num2str(Sum_M_Star)); % write sum of stars mass on GUI
         set(handles.Sum_M_Star_F,'String',num2str(Sum_M_Star_F)); % write sum of stars mass on GUI
         Brightness =str2double(get(handles.B2,'String')); % get brightness from GUI
         ns =str2double(get(handles.ns,'String'));% get number of stars from GUI
         Length_max = str2double(get(handles.Length_max,'String'));% get max length of leaf from GUI
         Length_min = str2double(get(handles.Length_min,'String'));% get min length of leaf from GUI
         Delta = str2double(get(handles.delta,'String'));% get Delta from GUI (distance from center)
         number_of_calculations=str2double(get(handles.number_of_calculations,'String'));% get number of cycles from GUI
         Line_Width_Slider = get(handles.slider1,'Value');% get the line width from slider
         Line_Distance = str2double(get(handles.w,'String'));% get leaf distance from ceter from star from GUI
         enrichment = str2double(get(handles.enrichment,'String'));% get star enrichment from GUI
         flux = str2double(get(handles.flux,'String'));% get flux value from GUI
         Sigma = str2double(get(handles.Sigma,'String'));% get Sigma value from GUI
         time = str2double(get(handles.time,'String'));% get time value from GUI
         eff = str2double(get(handles.eff,'String'));% get efficiency value from GUI
         dark_slider = get(handles.slider2,'Value');% get shade of leaf from slider
         Fixedplace = handles.Fixedplace.Value();% check if Fixedplace checkbox is checked
         Fixed_intensity = handles.Fixed_intensity.Value();% check if Fixed_intensity checkbox is checked
         starCenter = handles.StarCenter.Value();% check if StarCenter checkbox is checked
         FixedBG = handles.FixedBG.Value();% check if FixedBG checkbox is checked
         star_selection_name  = get(handles.star_selection,'SelectedObject');%check which bullet in 'Particles size' is chosen
         star_selection = get(star_selection_name,'String');% get name of chosen bullet
         close_all = handles.close_all.Value();% check if close_all checkbox is checked
         activate(Brightness,number_of_calculations,ns,Length_min,Length_max,Delta,Line_Distance,Line_Width_Slider,enrichment,flux,Sigma,time,eff,dark_slider,Fixedplace,Fixed_intensity,starCenter,FixedBG,star_selection,0); %call the function that makes the calculations and files
         set(handles.Sum_D_Star,'String',num2str(Sum_D_Star)); % write sum of stars diameters on GUI
         set(handles.Sum_M_Star,'String',num2str(Sum_M_Star)); % write sum of stars mass on GUI
         set(handles.Sum_M_Star_F,'String',num2str(Sum_M_Star_F)); % write sum of stars mass on GUI
     
         
         if close_all % if close_all checkbox is checked
             close ([1:100]); % close all figures except main figure
         end
         msgbox('Operation Completed');
         set(handles.done_running,'String','DONE','ForegroundColor','green'); % the program is done running so we change the text to "DONE" in green to show user he can run again
         set(handles.Star,'Enable','on'); % at the end of the run (now) the "RUN" button is enabled to enable running the program
         set(handles.Add_Star,'Enable','on'); % at the end of the run (now) the "Add Star" button is enabled to enable running the program
         
         'END' % write 'END' when program is done
        
    
    
    
    
    
    function activate(Brightness,number_of_calculations,ns,Length_min,Length_max,Delta,Line_Distance,Line_Width_Slider,enrichment,flux,Sigma,time,eff,dark_slider,Fixedplace,Fixed_intensity,starCenter,FixedBG,star_selection,Particle_Diameter)
        global imgName % name of last image
        global mouse_x % x coordinate of place to add star if 'Add Star' was pushed
        global mouse_y % y coordinate of place to add star if 'Add Star' was pushed
        global add_star_counter %number of times 'Add Star' button got pressed after 'RUN' button got pressed
        global last_star %counter for how many stars were added
        global Sum_D_Star % sum of stars diameters
        global Sum_M_Star % sum of stars mass
        global Sum_M_Star_F % sum of stars mass of the fission material
        global mouse_x % x coordinate of place to add star if 'Add Star' was pushed
        global mouse_y % y coordinate of place to add star if 'Add Star' was pushed

        add_star = strcmp(star_selection,'adding one star'); % check if program was called from 'Add Star' button
        tic; % start timer (to check how long the pragram runs in seconds)
        results = []; % reset the result array
        ns_star=[]; % reset the ns_star array (array of stars where each cell is the number of leafs in each star)
        w_star=[]; % reset the w_star array (array of stars where each cell is the stars diameter)
        M = flux*Sigma*time*eff*(enrichment/100); % set M to be the product of the multiplication
        if add_star % check if program was called from 'Add Star' button
            X = [Particle_Diameter]; % X is an array of one parameter which is the 'Particle Diameter' from 'Add Star' button
        else
            if strcmp(star_selection,'Small') % check if bullet called 'Small' was picked 
                X=[0.5,0.6,0.8,1,1.1,1.2,1.3,1.5,1.7,1.8,2.0,2.2,2.4,2.5,2.6]; % X is an array of 'Small' parameters
            else
                if strcmp(star_selection,'Large' )% check if bullet called 'Large' was picked
                    X=[3,3.2,3.4,3.5,4,4.2,4.4,4.6,4.8,5,5.1,5.2]; % X is an array of 'Large' parameters
                else % since bullets 'Small' and 'Large' were not picked, then bullet called 'Combined' was picked
                    X=[0.5,0.6,0.8,1,1.1,1.2,1.3,1.5,1.7,1.8,2.0,2.2,2.4,2.5,2.6,3,3.2,3.4,3.5,4,4.2,4.4,4.6,4.8,5,5.1,5.2]; % X is an array of 'Combined' parameters
                end
            end
        end
        if Fixed_intensity && ~add_star
            X=[0.5,0.6,0.8,1,1.1,1.2,1.3,1.5,1.7,1.8,2.0,2.2,2.4,2.5,2.6,3,3.2,3.4,3.5,4,4.2,4.4,4.6,4.8,5,5.1,5.2]; % X is an array of 'Combined' parameters
        end
        X1=(X/2).^3; % get the radius value from the diameter (for the calculation of the volume)
    
        x_rand = []; % reset x_rand array which contains the x coordinate of stars 
        y_rand = []; % reset y_rand array which contains the y coordinate of stars
        
        if add_star % check if program was called from 'Add Star' button
            img_name = imgName; % set img_name to be the name of the last image created (after adding stars)
        else
            if FixedBG
                img_name = 'Background.tif'; % set img_name to be the name of the default background
            else
                [img_name pathname] = uigetfile({'*.tif'},'File Selector'); % set img_name to be the name of the chosen backgrond (pathname is not used)
            end
        end
        Image = imread(img_name); % read img_name
        
        for RunNum = 1:number_of_calculations % iterate over the number of cycles (RunNum is the number of the current cycle)
            
            for run = 1:ns % iterate over the number of stars for the current cycle
                if Fixed_intensity % check if Fixed_intensity checkbox is checked
                    pos = run; % set pos to be the current number of iteration
                else
                    pos = randi(length(X1)); % set pos to be a random number between 1 and the length of X1 (position) 
                end
                w1 =  X1(pos); % set w1 to be the element in position pos from the radius array (X1) 
                ns_star = [ns_star,round(w1 * M)]; % add the rounded of M times the star radius to the end of the array ns_star     
                
                w_star = [w_star,X(pos)]; % add the star diameter the to the end of the array w_star
            end% done iterating over the number of stars for the current cycle

    
            % ImageText = strcat('BackGround = ',img_name,' - Run Number: ',int2str(RunNum));
            % <============================check what name to use==============================================>
    
              J=Image; % J is an intermedian image, since only using NP would cause drawing on the same image
              J=im2uint8(J); % setting image to unit8 so we can draw upon it
              J =Brightness*J; % brighten the picture
              NP=J; % NP is the selected image after chosen brightness (to draw upon) 
    
        
            for current_star = 1:ns % iterate of the number of stars
                leaf_original = ns_star(current_star); % number of leafs before change with rand
                ns = abs(round(sqrt(leaf_original)*randn(1)+ leaf_original)); % number of leafs after change with rand
                ns_star(current_star) = ns; % add number of leafs for the current star to the array of star leafs
                if add_star % check if program was called from 'Add Star' button
                    x_rand = mouse_x; % choose the star's x coordinate from GUI
                    y_rand = mouse_y; % choose the star's y coordinate from GUI
                else
                        % 1. if Fixedplace was not checked then x_rand and y_rand are empty arrays so we pick x and y coordinates.
                        % 2. if Fixedplace was checked and RunNum is equal to 1 (first cycle) then we add the x and y coordinates for the current star to the corresponding arrays.
                        % 3. else the array is filled correctly and we don't need to add more parameters
                    if (~Fixedplace) || (Fixedplace && RunNum == 1) 
                        x_rand = [x_rand, round(rand*4908)]; % pick random x coordinate (from 4908 pixels)
                        y_rand = [y_rand, round(rand*3264)]; % pick random y coordinate (from 3264 pixels)
                    end
                end
                       
                Sum_D_Star = Sum_D_Star + w_star(current_star); % add to Sum_D_Star the stars diameter
                M_Star = ((w_star(current_star)/2)^3)*(4/3)*pi*19.3; % calculate current stars mass
                M_Star = round(M_Star *100)/100; % leave only up to 4 figures after the dot
                M_Star_F = M_Star * enrichment / 100; % calculation of the mass of the fission material
                M_Star_F = (M_Star_F * 10000)/10000; % leave only up to 4 figures after the dot
                Sum_M_Star_F = Sum_M_Star_F + M_Star_F; % add M_Star_F to the sum
                Sum_M_Star = Sum_M_Star + M_Star; % add to Sum_M_Star the stars mass
                
                if Fixedplace % check if Fixedplace checkbox is checked
                    results = [results;[current_star round(x_rand(current_star)) round(y_rand(current_star))  leaf_original ns_star(current_star) w_star(current_star) time enrichment flux M_Star M_Star_F]]; % add the results array the following parameters of the current star: star number, x coordinate, y coordinate, number of leafs, star diameter, fission time, flux , M_star
                else
                    results = [results;[current_star round(x_rand(1)) round(y_rand(1)) leaf_original ns_star(current_star) w_star(current_star) time enrichment flux M_Star M_Star_F]]; % add the results array the following parameters of the current star: star number, x coordinate, y coordinate, number of leafs, star diameter, fission time, flux , M_star
                end
                if current_star ==  1 % if current_star is equal to 1 then open figure (to draw upon stars) for current cycle
                    cycle_fig = figure(); % open a new figure at the start of each cycle (each time we add a star to the image, we how the new image on this figure)
                    imshow(NP); %show the image on this figure
                end
                
            
                
              for current_leaf = 1:ns_star(current_star) % in the current star, iterate over the number of leafs
                    alphadeg = round(rand *360); % get a randon degree for the current leaf from the star's center
                    alpha = deg2rad(alphadeg); % turn the degree to radian
                    L = round(rand * Length_max) + Length_min; % set the leaf length to be a random integer between Length_min and Length_min + Length_max
                    delta = round(rand * Delta); % set the distance of the leaf from the star's center to be a random integer between 0 and Delta
                    if Fixedplace % check if Fixedplace checkbox is checked
                        % if Fixedplace was checked then x_rand and y_rand are arrays in which the current star's center is at (x_rand(current_star),y_rand(current_star)).
                        % else, Fixedplace was not checked, then x_rand and y_rand are arrays in which there is only one argument in each so the current star's center is at (x_rand(current_star),y_rand(current_star)).
                        x_delta = x_rand(current_star) + (delta*cos(alpha)); %setting the leafs vector's x coordinate to star at distance "delta" and at degree "alpha" from the star's center
                        y_delta = y_rand(current_star) + (delta*sin(alpha)); %setting the leafs vector's y coordinate to star at distance "delta" and at degree "alpha" from the star's center
                    else
                        x_delta = x_rand(1) + (delta*cos(alpha)); %setting the leafs vector's x coordinate to star at distance "delta" and at degree "alpha" from the star's center
                        y_delta = y_rand(1) + (delta*sin(alpha)); %setting the leafs vector's y coordinate to star at distance "delta" and at degree "alpha" from the star's center
                    end
                    x = x_delta + (L*cos(alpha)); %setting the leafs vector's x coordinate to end at distance "L" and at degree "alpha" from "x_delta"
                    y = y_delta + (L*sin(alpha)); %setting the leafs vector's y coordinate to end at distance "L" and at degree "alpha" from "y_delta"
    
                    lnwidth = round((Line_Width_Slider+0.1)*10); % set the leaf's width
%                     NP = insertShape(NP,'Line',[x+Line_Width_Slider y+Line_Width_Slider x_delta+Line_Width_Slider y_delta+Line_Width_Slider], 'color' ,[dark_slider+0.1 dark_slider+0.1 dark_slider+0.1],'LineWidth',lnwidth);
                    NP = insertShape(NP,'Line',[x y x_delta y_delta], 'color' ,[dark_slider+0 dark_slider+0 dark_slider+0],'LineWidth',lnwidth);
%                     NP = insertShape(NP,'Line',[x-Line_Width_Slider y-Line_Width_Slider x_delta-Line_Width_Slider y_delta-Line_Width_Slider], 'color' ,[dark_slider+0.1 dark_slider+0.1 dark_slider+0.1],'LineWidth',lnwidth); 
              end  % in the current star, done iterate over the number of leafs (for in line 272)
                 
               if starCenter % check if StarCenter checkbox is checked (we want to draw a red circle in the center the each star)
                   if Fixedplace % check if Fixedplace checkbox is checked
                        NP = insertShape(NP, 'circle', [x_rand(current_star) y_rand(current_star) 20],'Color','red', 'LineWidth', 5); % draw a red circle in the center of the star
                   else
                       NP = insertShape(NP, 'circle', [x_rand(1) y_rand(1) 20],'Color','red', 'LineWidth', 5); % draw a red circle in the center of the star
                   end
               end
               figure(cycle_fig); % return to the figure we want to draw upon
               imshow(NP)  % after we added a star to the image, we show the new image on the "cycle" figure)
               
                if ~Fixedplace  % check if Fixedplace checkbox is unchecked, if it is not then we want to reset the "x_rand" and "y_rand" arrays
                    x_rand = []; % reset the "x_rand" array
                    y_rand = []; % reset the "y_rand" array
                end
            end % % finished iterating over the number of stars for the current cycle
            if RunNum ~= number_of_calculations % if we are at the last cycle
                results = [results;[0 0 0 0 0 0 0 0 0 0 0]]; % add zeros to the result array (to set apart the results by cycles on the text file)
            end

          if add_star % check if program was called from 'Add Star' button
              text_name = img_name(1:end-4); % set "text_name" te have the same text as "img_name" only without the ".tif" at the end
              if add_star_counter == 1 % if this is the first time we the "Add Star" button was pushed since the "RUN" button was pushed  
                  image_name = strcat(img_name(1:end-4),'_',int2str(add_star_counter)); % set "image_name" to have the same as text as "img_name" only instead of the ".tif" at the end there will be "_" followed by the number of times that the "Add Star" button was pushed since the "RUN" button was pushed
              else
                  image_name = strcat(img_name(1:end-5),int2str(add_star_counter));% set "image_name" to have the same as text as "img_name" only instead of the previous "add_star_counter" argument followed by ".tif" at the end there will be the number of times that the "Add Star" button was pushed since the "RUN" button was pushed (the current "add_star_counter" argument)
              end
          else % the program was not called from 'Add Star' button
              last_star = ns; % set "last star" to be "ns", since there are "ns" (the number of stars) stars drawn so the last star number is ns
              nowTime = datestr(datetime('now')); % set "nowTime" to be the current time
              nowTime = strrep(nowTime,'-',''); % replace all "-" with "" (nothing).
              nowTime = strrep(nowTime,':',''); % replace all ":" with "" (nothing).
              nowTime = strrep(nowTime,' ','_'); % replace all spaces with "_".
              % set "image_name" to have the sa%me text as "img_name" only instead of the ".tif" at the end there will be
              % an underline followed by the number of cycle we are at followed by an underline followed by the "nowTime" argument.
              image_name = strcat(img_name(1:end-4),'_',int2str(RunNum),'_',nowTime);  
          end
         
          imwrite(NP, strcat(image_name,'.tif')); % save picked image (ater adding the stars) under the name in the "image_name" argument followed by ".tif"
       
    
          
            ns_star = []; % reset array (in case of running the program again)
            w_star = []; % reset array (in case of running the program again)
        end % done iterating over the number of cycles (the for is in line 220)
  
        c = clock; % set "c" to be the current date and time in decimal form
        cf = fix (c); % set cf to be "c" after rounding each element of "c" to the nearest integer toward zero
        
         DateTime = num2str(cf); % set DateTime to be "cf" after turning it into a String
        if add_star % check if program was called from 'Add Star' button (there is already a file ending with "_Trainer.txt" which we want to edit)
            infid = fopen(strcat(text_name,'_Trainer.txt'), 'rt'); % open the file of the previous run which ends with "_Trainer.txt"
            if add_star_counter == 1 % if this is the first time we the "Add Star" button was pushed since the "RUN" button was pushed  
                outfid = fopen(strcat(text_name,'_',int2str(add_star_counter),'_Trainer.txt'), 'wt'); % set and open "outfid" (the output file name) to have the same text as "text_name" followed an underline followed by the number of times that the "Add Star" button was pushed since the "RUN" button was pushed (the current "add_star_counter" argument) followed by "_Trainer.txt"
            else % "Add Star" was pushed before
                outfid = fopen(strcat(text_name(1:end-1),int2str(add_star_counter),'_Trainer.txt'), 'wt');% set and open "outfid" (the output file name) to have the same text as "text_name" (without the number of times the "Add Button" was pushed (single digit number of times)) followed an underline followed by the number of times that the "Add Star" button was pushed since the "RUN" button was pushed (the current "add_star_counter" argument) followed by "_Trainer.txt"
            end
            while true % infinite loop (until break is called)
              thisline = fgetl(infid);    % read line from input file
              if ~ischar(thisline);  % if there isn't anything more to read from file
                  break; % exit loop
              end    
              fprintf( outfid, '%s\n', thisline );   %write the line read from "infid" to the "outfid" file
            end %reached end of file
            last_star = last_star + 1; % increment  the counter for the number of times "Add Star" was pressed
            fprintf(outfid, '%d\t%d\t%d\t%d\t%d\t%s\t%d\t%s\t%d\t%s\t%s\n', last_star,results(2),results(3),results(4),results(5),num2str(results(6)),results(7),num2str(results(8)),results(9),num2str(results(10)),num2str(results(11))); % add the results form the current run ("Add Star" was pressed so there is only one line the "results" array)
            
            fclose(infid); % close the "infid" file
            fclose(outfid); % close the "infid" file
        else
            % Create a table with the data and variable names
            T = array2table(results,'VariableNames',{'star','x','y','leafs_O','leafs','D_star','time','enrich','flux','M_star','M_Star_F'});
            % Write data to text file
            writetable(T, strcat(image_name,'_Trainer1.txt'),'Delimiter','\t');
            
            pause(1) % wait for one second (so the above file will be saved)
            infid = fopen( strcat(image_name,'_Trainer1.txt'), 'rt'); % set and open "infid" file (the file we just saved)
            outfid = fopen(strcat(image_name,'_Trainer.txt'), 'wt'); % set and open "outfid" file (starts as empty file)
            % making a list of parameters to enter into the file "outfid"  
            params = {strcat('file name:_____',strcat(image_name,'_Trainer.txt'))}; % set params(1) to be the file name
            params = [params;{strcat('running version:_____',mfilename)}]; % set params(2) to be the programs version
            params =[params;{strcat('initial number of stars:_____',num2str(ns))}]; % set params(3) to be number of stars in the initial file
            params =[params;{strcat('number of runs:_____',num2str(number_of_calculations))}]; % set params(4) to be number of cycles of the initial run
            params =[params;{strcat('type of stars:_____',star_selection)}]; % set params(5) to be the initial selection of the "Particle size" choice
            params =[params;{strcat('brightness number:_____',num2str(Brightness))}]; % set params(6) to be the initial brightness choice (in "Add Star" we don't change the brightness)
            params =[params;{strcat('line width:_____',num2str(Line_Width_Slider))}]; % set params(7) to be initial leaf width chosen 
            params =[params;{strcat('min length:_____',num2str(Length_min))}]; % set params(8) to be the initial min length of the leafs
            params =[params;{strcat('max length:_____',num2str(Length_max))}]; % set params(9) to be the initial max length of the leafs s.t. the maximum length in (min length)+(max length)
            params =[params;{strcat('Delta:_____',num2str(Delta))}]; % set params(10) to be the initial Delta
            params =[params;{strcat('Line distance:_____',num2str(Line_Distance))}]; % set params(11) to be the initial line distance
            params =[params;{strcat('Leaf darkness:_____',num2str(dark_slider))}]; % set params(12) to be the initial leaf darkness
            params =[params;{strcat('Flux:_____',num2str(flux))}]; % set params(13) to be the initial flux
            params =[params;{strcat('Sigma:_____',num2str(Sigma))}]; % set params(14) to be the initial Sigma
            params =[params;{strcat('Time:_____',num2str(time))}]; % set params(15) to be the time parameter
            params =[params;{strcat('Efficiency:_____',num2str(eff))}]; % set params(16) to be the initial efficiency
            params =[params;{strcat('run time is approximatly:_____',num2str(toc),' seconds')}]; % set params(17) to be the time it took to run the program from the "RUN" button
            params =[params;{strcat('Date & time is :_____',DateTime)}]; % set params(18) to be the date and time when the program ran from the "RUN" button
            
            fprintf( outfid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n', char(params(1)),char(params(2)),char(params(3)),char(params(4)),char(params(5)),char(params(6)),char(params(7)),char(params(8)),char(params(9)),char(params(10)),char(params(11)),char(params(12)),char(params(13)),char(params(14)),char(params(15)),char(params(16)),char(params(17)),char(params(18))); % insert all of the above parameter (each in its own line) to "outfid"
            fprintf(outfid, '\n\n\n'); % add 3 downline to "outfid"
            while true % infinite loop (until break is called)
                thisline = fgetl(infid); % read line from input file
                if ~ischar(thisline)% if reached end of file
                    break; % exit while loop
                end    % reached end of file
                fprintf( outfid, '%s\n', thisline );  % write the line to the output file
            end
            fclose(infid); % close "infid"
            fclose(outfid); % close "outfid"
            pause(1); % pause for 1 second to make sure the files are closed
            delete(strcat(image_name,'_Trainer1.txt')); % delete the first file we saved (the data is in the second file)
    
            
        end
        imgName = strcat(image_name,'.tif'); % change the golbal parameter "imgName" to be that of the last ran image
        figure(FTA_Trainer_32); % bring the main gui figure to the top (in order to show the image on it)
        imshow(NP) % show the last ran image (on the main gui)
    
    
    
    function number_of_calculations_Callback(hObject, eventdata, handles)
    % hObject    handle to number_of_calculations (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of number_of_calculations as text
    %        str2double(get(hObject,'String')) returns contents of number_of_calculations as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function number_of_calculations_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to number_of_calculations (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on slider movement.
    function slider1_Callback(hObject, eventdata, handles)
    % hObject    handle to slider1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    sliderVal = get(handles.slider1,'Value'); % get the line width slider value
    set(handles.r,'String',num2str(sliderVal)) % show the line width slider value in the text above it
    %set(handles.r,double2str(get(handles.slider1,'value')))
    
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
    
    
    
    function ns_Callback(hObject, eventdata, handles)
    % hObject    handle to ns (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of ns as text
    %        str2double(get(hObject,'String')) returns contents of ns as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function ns_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to ns (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function Length_min_Callback(hObject, eventdata, handles)
    % hObject    handle to Length_min (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of Length_min as text
    %        str2double(get(hObject,'String')) returns contents of Length_min as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function Length_min_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Length_min (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function Length_max_Callback(hObject, eventdata, handles)
    % hObject    handle to Length_max (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of Length_max as text
    %        str2double(get(hObject,'String')) returns contents of Length_max as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function Length_max_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Length_max (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function delta_Callback(hObject, eventdata, handles)
    % hObject    handle to delta (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of delta as text
    %        str2double(get(hObject,'String')) returns contents of delta as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function delta_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to delta (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function w_Callback(hObject, eventdata, handles)
    % hObject    handle to W_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of W_text as text
    %        str2double(get(hObject,'String')) returns contents of W_text as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function W_text_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to W_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes during object creation, after setting all properties.
    function w_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to w (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function flux_Callback(hObject, eventdata, handles)
    % hObject    handle to flux (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of flux as text
    %        str2double(get(hObject,'String')) returns contents of flux as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function flux_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to flux (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function Sigma_Callback(hObject, eventdata, handles)
    % hObject    handle to Sigma (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of Sigma as text
    %        str2double(get(hObject,'String')) returns contents of Sigma as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function Sigma_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Sigma (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function time_Callback(hObject, eventdata, handles)
    % hObject    handle to time (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of time as text
    %        str2double(get(hObject,'String')) returns contents of time as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function time_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to time (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function eff_Callback(hObject, eventdata, handles)
    % hObject    handle to eff (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of eff as text
    %        str2double(get(hObject,'String')) returns contents of eff as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function eff_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to eff (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in Fixedplace.
    function Fixedplace_Callback(hObject, eventdata, handles)
    % hObject    handle to Fixedplace (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of Fixedplace
    
    
    % --- Executes on button press in StarCenter.
    function StarCenter_Callback(hObject, eventdata, handles)
    % hObject    handle to StarCenter (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of StarCenter
    % fc = get(hObject,'Value')
    %if fc = 0
    %    StarCenter_f = 0
    %else
    %    StarCenter_f = 1;
    %end
    %end
        
    
    
    % --- Executes on button press in FixedBG.
    function FixedBG_Callback(hObject, eventdata, handles)
    % hObject    handle to FixedBG (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of FixedBG
    
    
    % --- Executes on button press in RichStars.
    function RichStars_Callback(hObject, eventdata, handles)
    % hObject    handle to RichStars (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of RichStars
    
    
    % --- Executes on button press in WeakStars.
    function WeakStars_Callback(hObject, eventdata, handles)
    % hObject    handle to WeakStars (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of WeakStars
    
    
    % --- Executes on button press in CombainedStars.
    function CombainedStars_Callback(hObject, eventdata, handles)
    % hObject    handle to CombainedStars (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of CombainedStars
    
        
    
    
    % --- Executes on button press in Fixed_intensity.
    function Fixed_intensity_Callback(hObject, eventdata, handles)
    % hObject    handle to Fixed_intensity (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of Fixed_intensity
    
    
    % --- If Enable == 'on', executes on mouse press in 5 pixel border.
    % --- Otherwise, executes on mouse press in 5 pixel border or over r.
    function r_ButtonDownFcn(hObject, eventdata, handles)
    % hObject    handle to r (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --- Executes on slider movement.
    function slider2_Callback(hObject, eventdata, handles)
    sliderVal = get(handles.slider2,'Value'); % set "sliderVal" to be the value from the slider for the darkness of the leafs 
    sliderVal = round(sliderVal); % round the "sliderVal" value
    set(handles.dark_slider,'String',num2str(sliderVal)) % set the slider for the darkness of the leafs to be the value from "sliderVal"   
    set(handles.slider2,'Value',sliderVal); % set the text above the slider to be the one from "sliderVal"
    % hObject    handle to slider2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'Value') returns position of slider
    %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    
    
    % --- Executes during object creation, after setting all properties.
    function slider2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to slider2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
    
    
    % --- Executes on button press in close_all.
    function close_all_Callback(hObject, eventdata, handles)
    % hObject    handle to close_all (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of close_all
    
    
    % --- Executes on button press in Add_Star.
    function Add_Star_Callback(hObject, eventdata, handles)
    global imgName % name of last image ran
    global add_star_counter %number of times 'Add Star' button got pressed after 'RUN' button got pressed
    global Sum_D_Star % sum of stars diameters
    global Sum_M_Star % sum of stars mass
    global Sum_M_Star_F % sum of stars mass of the fission material
    global mouse_x % x coordinate for "Add Star"
    global mouse_y % y coordinate for "Add Star"
    add_star_counter = add_star_counter + 1 % increment "add_star_counter" by one (we are adding a star)
    
    if ~strcmp(imgName,'none')
        mouse_x = str2double(get(handles.mouse_x,'String')); % set "mouse_x" to the x coordinate from the "add star" button group
        mouse_y = str2double(get(handles.mouse_y,'String')); % set "mouse_y" to the y coordinate from the "add star" button group
        if (mouse_x == 1) && (mouse_y == 1) % mouse is out of picture
            msgbox('Mouse Position Out Of Picture');
        else
            set(handles.Star,'Enable','off'); % once the button is pressed the "RUN" button is disabled until the end of the run 
            set(handles.Add_Star,'Enable','off'); % once the button is pressed the "Add Star" button is disabled until the end of the run
            set(handles.done_running,'String','RUNNING','ForegroundColor','red'); % the program is running so we change the text to "RUNNING" in red until the run is done
            pause(1); % wait for 1 second (in order to disable )

            Brightness =	1; % there is no need to change the image brightness again (it was changed when the "RUN" button was pressed)
            ns = 1; % only one star needs to be added
            Length_max = str2double(get(handles.Length_max,'String')); % get max length of leaf from GUI
            Length_min = str2double(get(handles.Length_min,'String')); % get min length of leaf from GUI
            Delta = str2double(get(handles.delta,'String')); % get Delta from GUI (distance from center)
            number_of_calculations=1; % only one cycle needed in order to add just one star
            sliderVal = get(handles.slider1,'Value'); % get the line width from slider
            Line_Distance = str2double(get(handles.w,'String'));% get leaf distance from ceter from star from GUI
            enrichment = str2double(get(handles.enrichment,'String'));% get star enrichment from GUI
            flux = str2double(get(handles.flux,'String'));% get flux value from GUI
            Sigma = str2double(get(handles.Sigma,'String'));% get Sigma value from GUI
            time = str2double(get(handles.time,'String'));% get time value from GUI
            eff = str2double(get(handles.eff,'String'));% get efficiency value from GUI
            dark_slider = get(handles.slider2,'Value');% get shade of leaf from slider
            Fixedplace = 0; % "mouse_x" and "mouse_y" are the coordinates for the adding of the star
            Fixed_intensity = 0; % we use the "Particle Diameter" from the "add star" button group
            starCenter = handles.StarCenter.Value(); % check if StarCenter checkbox is checked
            FixedBG = 0; % the background is the last run output image
            star_selection = 'adding one star'; % we use the "Particle Diameter" from the "add star" button group
            close_all = handles.close_all.Value(); % close all windows at the end
            Particle_Diameter = str2double(get(handles.Particle_Diameter,'String')); % get the "Particle Diameter" from the "add star" button group
            activate(Brightness,number_of_calculations,ns,Length_min,Length_max,Delta,Line_Distance,sliderVal,enrichment,flux,Sigma,time,eff,dark_slider,Fixedplace,Fixed_intensity,starCenter,FixedBG,star_selection,Particle_Diameter) % call the function that makes the calculations and files
            %set(handles.ImageText,'String',program);

            set(handles.Sum_D_Star,'String',num2str(Sum_D_Star)); % write sum of stars diameters on GUI
            set(handles.Sum_M_Star,'String',num2str(Sum_M_Star)); % write sum of stars mass on GUI
            set(handles.Sum_M_Star_F,'String',num2str(Sum_M_Star_F)); % write sum of stars mass on GUI

            if close_all % if close_all checkbox is checked
                close ([1:100]); % close all figures except main figure
            end
            msgbox('Operation Completed');
            set(handles.done_running,'String','DONE','ForegroundColor','green'); % the program is done running so we change the text to "DONE" in green to show user he can run again
            set(handles.Star,'Enable','on'); % at the end of the run (now) the "RUN" button is enabled to enable running the program
            set(handles.Add_Star,'Enable','on'); % at the end of the run (now) the "Add Star" button is enabled to enable running the program
            'END'
        end
    
    end
    % hObject    handle to Add_Star (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    
    function Particle_Diameter_Callback(hObject, eventdata, handles)
    % hObject    handle to Particle_Diameter (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of Particle_Diameter as text
    %        str2double(get(hObject,'String')) returns contents of Particle_Diameter as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function Particle_Diameter_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Particle_Diameter (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on mouse press over figure background, over a disabled or
    % --- inactive control, or over an axes background.
    function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
    global mouse_x_for_AddStar_window_top_left % x coordinate for top left screen for calibration 
    global mouse_y_for_AddStar_window_top_left % y coordinate for top left screen for calibration
    global mouse_x_for_AddStar_window_bottom_right % x coordinate for bottom right screen for calibration
    global mouse_y_for_AddStar_window_bottom_right % y coordinate for bottom right screen for calibration
    global mouse_x % x coordinate of place to add star if 'Add Star' was pushed
    global mouse_y % y coordinate of place to add star if 'Add Star' was pushed
    
    % getting screen coordinates from calibration
    mouse_x_for_AddStar_window_top_left = str2double(get(handles.top_left_x,'String')); % get left x coordinate from calibration
    mouse_y_for_AddStar_window_top_left = str2double(get(handles.top_left_y,'String')); % get top y coordinate from calibration
    mouse_x_for_AddStar_window_bottom_right = str2double(get(handles.bottom_right_x,'String')); % get right x coordinate from calibration
    mouse_y_for_AddStar_window_bottom_right = str2double(get(handles.bottom_right_y,'String')); % get bottom y coordinate from calibration

    pos = get(hObject, 'currentpoint'); % get mouse location on figure
    x = pos(1); y = pos(2); % assign locations to x and y
    set(handles.last_clicked_x,'String',num2str(x)); % set "last_clicked_x" text to clicked x coordinate
    set(handles.last_clicked_y,'String',num2str(y)); % set "last_clicked_y" text to clicked y coordinate
    if (x < mouse_x_for_AddStar_window_top_left) ||(y < mouse_y_for_AddStar_window_bottom_right) || (x > mouse_x_for_AddStar_window_bottom_right) || (y > mouse_y_for_AddStar_window_top_left) % if clicked outside of calibrated screen boundries
        x = 1; % set x to be 1 (default)
        y = 1; % set y to be 1 (default)
    else
        x = x - mouse_x_for_AddStar_window_top_left; % change x to be as if adjested screen left x parameter starts at left
        x = x * (4908/(mouse_x_for_AddStar_window_bottom_right - mouse_x_for_AddStar_window_top_left)); % make clicked x coordinate relative to the calibrated screen is (in relations) on a 4908 pixel length screen (act as if selected screen is 4908 pixels long)
        x = round(x);
        y = y - mouse_y_for_AddStar_window_bottom_right; % change xy to be as if adjested screen left x parameter starts at top
        y = ((mouse_y_for_AddStar_window_top_left - mouse_y_for_AddStar_window_bottom_right) - y) * (3264/(mouse_y_for_AddStar_window_top_left - mouse_y_for_AddStar_window_bottom_right)) % make clicked y coordinate relative to the calibrated screen is (in relations) on a 3264 pixel length screen (act as if selected screen is 3264 pixels high) and turn it upside down(act as if screen top is 0 instead of bottom)
        y = round(y);
    end
    set(handles.mouse_x, 'string', x); % update text for x loc
    set(handles.mouse_y, 'string', y); % update text for y loc 
    mouse_x = x; % set mouse_x to be the the x coordinate in the picked picture to add star 
    mouse_y = y; % set mouse_y to be the the y coordinate in the picked picture to add star 
    % hObject    handle to figure1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    
    function mouse_x_Callback(hObject, eventdata, handles)
    % hObject    handle to mouse_x (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of mouse_x as text
    %        str2double(get(hObject,'String')) returns contents of mouse_x as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function mouse_x_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to mouse_x (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function mouse_y_Callback(hObject, eventdata, handles)
    % hObject    handle to mouse_y (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of mouse_y as text
    %        str2double(get(hObject,'String')) returns contents of mouse_y as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function mouse_y_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to mouse_y (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function x_min_crop_Callback(hObject, eventdata, handles)
    % hObject    handle to x_min_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of x_min_crop as text
    %        str2double(get(hObject,'String')) returns contents of x_min_crop as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function x_min_crop_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to x_min_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function y_min_crop_Callback(hObject, eventdata, handles)
    % hObject    handle to y_min_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of y_min_crop as text
    %        str2double(get(hObject,'String')) returns contents of y_min_crop as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function y_min_crop_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to y_min_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function x_max_crop_Callback(hObject, eventdata, handles)
    % hObject    handle to x_max_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of x_max_crop as text
    %        str2double(get(hObject,'String')) returns contents of x_max_crop as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function x_max_crop_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to x_max_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    function y_max_crop_Callback(hObject, eventdata, handles)
    % hObject    handle to y_max_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of y_max_crop as text
    %        str2double(get(hObject,'String')) returns contents of y_max_crop as a double
    
    
    % --- Executes during object creation, after setting all properties.
    function y_max_crop_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to y_max_crop (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    



function last_clicked_x_Callback(hObject, eventdata, handles)
% hObject    handle to last_clicked_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last_clicked_x as text
%        str2double(get(hObject,'String')) returns contents of last_clicked_x as a double


% --- Executes during object creation, after setting all properties.
function last_clicked_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last_clicked_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function last_clicked_y_Callback(hObject, eventdata, handles)
% hObject    handle to last_clicked_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last_clicked_y as text
%        str2double(get(hObject,'String')) returns contents of last_clicked_y as a double


% --- Executes during object creation, after setting all properties.
function last_clicked_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last_clicked_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in top_left.
function top_left_Callback(hObject, eventdata, handles)
    allow_screen_calibration = handles.allow_screen_calibration.Value(); % check if allow_screen_calibration checkbox is checked
    if allow_screen_calibration % if allow_screen_calibration is checked then set the top left coordinates to be the last_clicked_x and last_clicked_x
        x = get(handles.last_clicked_x,'String'); % set x to have the same value as the "last_clicked_x"
        y = get(handles.last_clicked_y,'String'); % set y to have the same value as the "last_clicked_y"
        set(handles.top_left_x,'String',x); % set top_left_x to have the same value as the x
        set(handles.top_left_y,'String',y); % set top_left_y to have the same value as the y
    end
    
% hObject    handle to top_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bottom_right.
function bottom_right_Callback(hObject, eventdata, handles)
    allow_screen_calibration = handles.allow_screen_calibration.Value(); % check if allow_screen_calibration checkbox is checked
    if allow_screen_calibration % if allow_screen_calibration is checked then set the top left coordinates to be the last_clicked_x and last_clicked_x
        x = get(handles.last_clicked_x,'String'); % set x to have the same value as the "last_clicked_x"
        y = get(handles.last_clicked_y,'String'); % set y to have the same value as the "last_clicked_y"
        set(handles.bottom_right_x,'String',x); % set bottom_right_x to have the same value as the x
        set(handles.bottom_right_y,'String',y); % set bottom_right_y to have the same value as the y
    end
% hObject    handle to bottom_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in allow_screen_calibration.
function allow_screen_calibration_Callback(hObject, eventdata, handles)
    allow_screen_calibration = handles.allow_screen_calibration.Value(); % check if allow_screen_calibration checkbox is checked
    if allow_screen_calibration
        set(handles.screen_calibration,'Visible','on'); % turn on visibility of the "screen_calibration" button group
    else
        set(handles.screen_calibration,'Visible','off'); % turn off visibility of the "screen_calibration" button group
    end
% hObject    handle to allow_screen_calibration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of allow_screen_calibration



function enrichment_Callback(hObject, eventdata, handles)
% hObject    handle to enrichment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enrichment as text
%        str2double(get(hObject,'String')) returns contents of enrichment as a double


% --- Executes during object creation, after setting all properties.
function enrichment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enrichment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
