function [data_new, C_max_array, data_new_4] = nasa_test(in1,in2, in3, in4, in5, in6, in7)
    % disp('hello');
    data_new = struct2cell(in1);
    data_new_2 = struct2cell(in2);
    
    data_new_3 = struct2cell(in3);
    data_new_4 = struct2cell(in4);
    
    data_new_5 = struct2cell(in5);
    data_new_6 = struct2cell(in6);
    
    data_new_7 = struct2cell(in7);
    % data_new_2 = struct2cell(in2);
    
    % data_new = struct2cell(in1);
    % data_new_2 = struct2cell(in2);
    
    names = fieldnames(in1);
    % plot quantities versus time
    times = data_new{1};
    times_2 = data_new_2{1};
    
    times_3 = data_new_3{1};
    times_4 = data_new_4{1};
    
    times_5 = data_new_5{1};
    times_6 = data_new_6{1};
    
    times_7 = data_new_7{1};
    % times_2 = data_new_2{1};
    
    
%  for A = 2 : length(data_new)-1
%     figure(A)
%     X = data_new{A};
%     plot(times,X,'or')
%     title('Plot of times versus ' + string(names{A}))
%     xlabel('time')
%     ylabel(names{A})
%     legend({''})
%     hold on;
%     % refline
%  end 

 
%  figure(1)
 
%  subplot(3,1,1)
%  plot(times,data_new{3})
%  hold on;
%  plot(times, data_new{4})
%  title(' {\color{blue}Flight Profile, Set 3 HIRF 26}')
%  xlabel('TIME') 
%  ylabel('CURRENT VALUES')
%  legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
%  
%  subplot(3,1,2)
%  plot(times,data_new{3})
%  hold on;
%  plot(times, data_new{4})
%  xlim([275 290])
%  ylim([18 22])
%  title('{\color{blue}Zoom in of HIRF 26, takeoff}')
%  xlabel('TIME') 
%  ylabel('CURRENT VALUES') 
%  
%  subplot(3,1,3)
%  plot(times,data_new{3})
%  hold on;
%  plot(times, data_new{4})
%  xlim([1150 1250])
%  ylim([16 18.99999])
%  title('{\color{blue}Zoom in of HIRF 26, landing}')
%  xlabel('TIME') 
%  ylabel('CURRENT VALUES') 

figure(1)

 subplot(3,1,1)
 plot(times, data_new{3})
 hold on;
 plot(times, data_new{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 plot(times, data_new{3})
 hold on;
 plot(times, data_new{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 xlim([380 410])
 ylim([16 21])
 
 subplot(3,1,3)
 plot(times, data_new{3})
 hold on;
 plot(times, data_new{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 xlim([700 750])
 ylim([16 21])

figure(2)

 subplot(3,1,1)
 plot(times_2, data_new_2{3})
 hold on;
 plot(times_2, data_new_2{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 plot(times_2, data_new_2{3})
 hold on;
 plot(times_2, data_new_2{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 xlim([450 500])
 ylim([17 21])
 
 subplot(3,1,3)
 plot(times_2, data_new_2{3})
 hold on;
 plot(times_2, data_new_2{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 xlim([950 1000])
 ylim([17 21])

 figure(3)
 x = data_new_3{3};
 
 subplot(3,1,1)
 
 plot(times_3, data_new_3{3})
 hold on;
 plot(times_3, data_new_3{4})
 hold on;
 yline(x(length(data_new_3{3})));
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 
 plot(times_3, data_new_3{3})
 hold on;
 plot(times_3, data_new_3{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([370 410])
 ylim([16 21])
 
 subplot(3,1,3)
 
 plot(times_3, data_new_3{3})
 hold on;
 plot(times_3, data_new_3{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([900 940])
 ylim([16 21])
 
 figure(4)
 
 subplot(3,1,1)
 
 plot(times_4, data_new_4{3})
 hold on;
 plot(times_4, data_new_4{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 plot(times_4, data_new_4{3})
 hold on;
 plot(times_4, data_new_4{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([425 490])
 ylim([17 21])
 
 subplot(3,1,3)
 plot(times_4, data_new_4{3})
 hold on;
 plot(times_4, data_new_4{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([1280 1370])
 ylim([17 21])
 
 figure(5)
 
 subplot(3,1,1)
 
 plot(times_5, data_new_5{3})
 hold on;
 plot(times_5, data_new_5{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 plot(times_5, data_new_5{3})
 hold on;
 plot(times_5, data_new_5{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([560 610])
 ylim([17 21.5])
 
 subplot(3,1,3)
 plot(times_5, data_new_5{3})
 hold on;
 plot(times_5, data_new_5{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([1320 1360])
 ylim([17 21.5])
 
 figure(6)
 
 subplot(3,1,1)
 
 y = data_new_6{3};
 
 plot(times_6, data_new_6{3})
 hold on;
 plot(times_6, data_new_6{4})
 yline(y(1));
 yline(y(length(data_new_6{3})));
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 plot(times_6, data_new_6{3})
 hold on;
 plot(times_6, data_new_6{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([370 410])
 ylim([17 21.5])
 
 subplot(3,1,3)
 plot(times_6, data_new_6{3})
 hold on;
 plot(times_6, data_new_6{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([1430 1490])
 ylim([17 21.5])
 
 figure(7)
 
 subplot(3,1,1)
 
 plot(times_7, data_new_7{3})
 hold on;
 plot(times_7, data_new_7{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 
 subplot(3,1,2)
 
 plot(times_7, data_new_7{3})
 hold on;
 plot(times_7, data_new_7{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([210 270])
 ylim([17 21.5])
 
 subplot(3,1,3)
 
 plot(times_7, data_new_7{3})
 hold on;
 plot(times_7, data_new_7{4})
 xlabel('TIME') 
 ylabel('CURRENT VALUES')
 % legend({'Lower Left Front' 'Upper Left After'}, 'Location', 'southoutside')
 xlim([1140 1190])
 ylim([17 21.5])
 
%  figure(8)
%  subplot(3,1,1)
%  plot(times_2, data_new_2{5})
%  hold on;
%  plot(times_2, data_new_2{6})
%  title(' {\color{blue}Flight Profile, Set 3 HIRF 27}')
%  
%  subplot(3,1,2) 
%  plot(times_2 , data_new_2{5})
%  hold on;
%  plot(times_2 , data_new_2{6})
%  title(' {\color{blue}Zoom in of HIRF 27, takeoff}')
%  xlim([385 420])
%  ylim([36 42])
%  
%  subplot(3,1,3)
%  plot(times_2 , data_new_2{5})
%  hold on;
%  plot(times_2 , data_new_2{6})
%  title(' {\color{blue}Zoom in of HIRF 27, landing}')
%  xlim([1260 1300])
%  ylim([35 37.5])
 
 % plot different 'interpolations' of C_max values
 
 C_max_array = [ ];
 C_max_array_actual = [ ];
 C_max_i = 100; 
 
 % initialize first value of each C max array
 C_max_array(1) = C_max_i;
 C_max_array_actual(1) = C_max_i;
 
 time_array_Set6_1 = [30; 50; 40; 55; 50; 40; 60];
 time_array_Set6_2 = [50; 50; 40; 90; 40; 60; 50];
 
%  for I = 1 : 7
%      X = C_max_array(I);
%      C_max_temp = X * exp((-(1/1000) * 30)-((1/5000)*50));
%      C_max_array(I+1) = C_max_temp;
%      
%  end 


        % generate change in C_max across ONE flight
        C_max = 100 * exp((-(1/1000) * (65)) - (1/5000) * (1411-500));

%  for J = 1 : 7
%      Y = C_max_array(I);
%      C_max_temp = Y * exp((-(1/1000) * time_array_Set6_1(J))-((1/5000)* time_array_Set6_2(J)));
%      C_max_array_actual(J+1) = C_max_temp;
%  end 
 
 % plot the C max values
 figure(8)
 plot( [1;2;3;4;5;6;7;8], C_max_array)
 title(' {\color{blue}SET 6: exponential decay in the maximum capacitance across flight in Set 6, HRf 77}')
 hold on;
 plot( [1;2;3;4;5;6;7;8], C_max_array_actual)
 xlabel('trial number') 
 ylabel('% of maximum capacitance value')
 
 % develop an algorithm to get approximate
 % times during each period of the flight
 
 % get the first value and last values
 % for each data set
 
 x_1 = data_new{3};
 final_x_1 = length(data_new{3});
 x_2 = data_new_2{3};
 final_x_2 = length(data_new_2{3});
 x_3 = data_new_3{3};
 final_x_3 = length(data_new_3{3});
 x_4 = data_new_4{3};
 final_x_4 = length(data_new_4{3});
 x_5 = data_new_5{3};
 final_x_5 = length(data_new_5{3});
 x_6 = data_new_6{3};
 final_x_6 = length(data_new_6{3});
 
 minimum_val = min(x_1);
 maximum_val = max(x_1);
 subvec_x_1 = data_new{3}(minimum_val <= data_new{3} <= maximum_val);
 
%  for IA = 1 : length(data_new{3})
%      
%      
%      
%  end 
 
 % set up min and max values
 % for each of the x_i vectors above
 
 vec_x_1 = [min(x_1); max(x_1); x_1(final_x_1)]; 
 vec_x_2 = [min(x_2); max(x_2); x_2(final_x_2)]; 
 vec_x_3 = [min(x_3); max(x_3); x_3(final_x_3)];
 vec_x_4 = [min(x_4); max(x_4); x_4(final_x_4)];
 vec_x_5 = [min(x_5); max(x_5); x_5(final_x_5)];
 vec_x_6 = [min(x_6); max(x_6); x_6(final_x_6)];
 
 % find corresponding times for each
 % of the vectors with the specified
 % positions above, by first finding
 % the indices between the specified
 % ranges of values above ^
 
 k_x_1 = find(vec_x_1(1) < data_new{3} < vec_x_1(2));
 k_x_2 = find(vec_x_2(1) < data_new_2{3} < vec_x_2(2));
 k_x_3 = find(vec_x_3(1) < data_new_3{3} < vec_x_3(2));
 k_x_4 = find(vec_x_4(1) < data_new_4{3} < vec_x_4(2));
 k_x_5 = find(vec_x_5(1) < data_new_5{3} < vec_x_5(2));
 k_x_6 = find(vec_x_6(1) < data_new_6{3} < vec_x_6(2));
 
 % use the range of values to form 
 % subvectors from the original 
 % data set, from which we will determine
 % the maximum and minima
 
 x_1_ordered = sort(x_1(k_x_1(1):k_x_1(length(k_x_1))), 'descend');
 % x_1_times = [find(data_new{3} == min(x_1_ordered)), find(data_new{3} == max(x_1_ordered))];
 
 
 % compute the Fourier coefficients of
 % the basis for each stage of the flight
 % EXAMPLE FLIGHT: SET 3 HIRF 26
 
 % Fourier coefficients for this stage of the flight
 syms t;
 w0 = pi;
 
 coefficient_array_a = [ ];
 coefficient_array_b = [ ];
 
 x = linspace(1150, 1250, 100);
 format long
 for n = -5:5
    a = (2./100) .* int(t^2 * cos(n * w0 * t),t, 1100, 1250);
    b = (2./100) .* int(t^2 * sin(n*w0 * t),t, 1100, 1250);
    coefficient_array_a(n+6) = a;
    coefficient_array_b(n+6) = b;
 end 
 
 a0 = 1;
 
 % second flight example for paper
 C_max_1 = 100 * exp((-(1/500) * (65)) - (1/5000) * (1411-500));
 C_max_1_1 = 100 * exp((-(1/100) * (65)) - (1/5000) * (1411-500));
 C_max_1_2 = 100 * exp((-(1/2500) * (65)) - (1/2500) * (1411-500));
 C_max_2_2_2 = 100 * exp((-(1/250000) * (65)) - (1/250000) * (1411-500))
 C_max_array_1 = [100;C_max_1];
 C_max_array_2 = [100;C_max_1_1];
 C_max_array_3 = [100; C_max_1_2];
 C_max_array_3_2 = [100; C_max_2_2_2];
 figure(9)
 plot([1;2], C_max_array_1)
 hold on;
 plot([1;2] , C_max_array_2)
 hold on;
 plot([1;2], C_max_array_3)
 hold on;
 plot([1;2], C_max_array_3_2)
 title(' {\color{blue}exponential decay in the maximum capacitance across flight in Set 6, HRF 77}')
 legend({'Choice 1 of parameters' 'Choice 2 of parameters' 'Choice 3 of parameters', 'Choice 4 of parameters'}, 'Location', 'southoutside')
 xlabel('trial number, 1 to 2') 
 ylabel('% of maximum capacitance value change')
 
 % first flight example for paper
 C_max_2_1 = 100 * exp((-(1/200) * (80)) - (1/5000) * (200));
 C_max_2 = 100 * exp((-(1/1000) * (80)) - (1/5000) * (200));
 C_max_2_2 = 100 * exp((-(1/300000) * (80)) - (1/50000) * (200));
 C_max_2_2_2 = 100 * exp((-(1/300) * (80)) - (1/300) * (200));
 C_max_array = [100;C_max_2];
 C_max_array_2 = [100;C_max_2_1];
 C_max_array_3_1 = [100;C_max_2_2];
 C_max_array_3_2 = [100; C_max_2_2_2];
 figure(10)
 plot([1;2], C_max_array)
 hold on;
 plot([1;2], C_max_array_2)
 hold on;
 plot([1;2], C_max_array_3_1)
 hold on;
 plot([1;2],C_max_array_3_2)
 title(' {\color{blue} exponential decay in the maximum capacitance across flight in Set 6, HRF 80}')
 legend({'Choice 1 of parameters' 'Choice 2 of parameters' 'Choice 3 of parameters', 'Choice 4 of parameters'}, 'Location', 'southoutside')
 xlabel('trial number, 1 to 2') 
 ylabel('% of maximum capacitance value change')
 
 % define the FS representation for the
 % LAST leg of the flight
 
%  for n=-5:5
%      f = func (@x) coefficient_array_a(n) * cos(2 * pi * n * x/100) + coefficient_array_b(n) * sin(2 * pi * n * x/100);
%      
%  end 
%  
end 


