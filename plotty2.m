function [poly_trunc_subvec, time_poly_trunc_subvec, poly_trunc_subvec_2, time_poly_trunc_subvec_2, trunc_current_vec, trunc_thres_times_vec, thres_current_vec_values, thres_times_vec_values, func_test, f_val_vec_trunc, tester] = plotty2(in)

    % previous formats for function calls in the next 2 lines for different
    % output values

    % [poly_trunc_subvec, time_poly_trunc_subvec, poly_trunc_subvec_2, time_poly_trunc_subvec_2, trunc_current_vec, trunc_thres_times_vec, thres_current_vec_values, thres_times_vec_values, coefficient_array_a, coefficient_array_b,coefficient_array_a_2, coefficient_array_b_2, coefficient_array_a_3, coefficient_array_b_3,  sum_a_array, sum_b_array, sum_a_array_2, sum_b_array_2, sum_a_array_3, sum_b_array_3] = plotty2(in)

    % [poly_trunc_subvec, time_poly_trunc_subvec, poly_trunc_subvec_2, time_poly_trunc_subvec_2, trunc_current_vec, trunc_thres_times_vec, thres_current_vec_values, thres_times_vec_values, func_test, f_val_vec_trunc, tester, coefficient_array_a_test , coefficient_array_b_test , coefficient_array_a_2_test , coefficient_array_b_2_test] = plotty2(in)
    
    % reformat data to get the current
    % and time data portions from HRF data sets
    
    data_new_3 = struct2cell(in);
    data_new = data_new_3;
    subvec_3 = data_new{3};
    subvec_3_1 = [data_new{1} data_new{3}];
    time_subvec = subvec_3_1(:,1);
    subvec_3_2 = subvec_3_1(:,2);
    K = find(subvec_3_2 < (subvec_3_2(length(subvec_3_2))-1.5));
    % K = find(subvec_3_2 < (subvec_3_2(length(subvec_3_2))+(subvec_3_2(1)-subvec_3_2(length(subvec_3_2))-1.5)));
    
    % define truncation of subvec_3_2
    
    trunc_subvec_3_2 = [ ];
    
    for J = 1 : length(K)
        trunc_subvec_3_2(J) = subvec_3_2(K(J));
    end 
    
    time_vec = [ ];
    
    for I = 1 : length(K)
        time_vec(I) = time_subvec(K(I));
    end
    
    poly_trunc_subvec = [ ];
    
    % initialize the truncation of subvec for polynomial
    % interpolation
    
    for IJ = 1:length(trunc_subvec_3_2)
        if isequal(mod(IJ,3),0)
            poly_trunc_subvec(IJ) = trunc_subvec_3_2(IJ);
        end 
    end 
    
    time_poly_trunc_subvec = [ ];
    % initialize the corresponding truncation of time
    % subvec for polynomial interpolation
    
    for IK = 1 : length(time_vec)
        if isequal(mod(IK,3),0)
            time_poly_trunc_subvec(IK) = time_vec(IK);
        end 
    end 

    % remove 0 elements
    
    poly_trunc_subvec_2 = nonzeros(poly_trunc_subvec);
    time_poly_trunc_subvec_2 = nonzeros(time_poly_trunc_subvec);
    
    % introduce polynomial interpolant for each section
    % of the flight, but first make sure that we have the
    % correct times and positions 
    
    figure(11)
    plot(time_poly_trunc_subvec_2, poly_trunc_subvec_2)
    
    combined_vec = [time_poly_trunc_subvec_2 poly_trunc_subvec_2];
    poly_trunc_subvec_22 = combined_vec(:,2);
    row = find(poly_trunc_subvec_22(poly_trunc_subvec_22 < (max(poly_trunc_subvec_22)-0.5)));
    thres_current_vec_values = poly_trunc_subvec_22(poly_trunc_subvec_22 < (max(poly_trunc_subvec_22)-0.5));
    
    % obtain the corresponding times for separate stages of the flight
    % from testy3 vector
    
    thres_times_vec_values = [ ];
    
    for II = 1 : length(row)
        thres_times_vec_values(II) = combined_vec(row(II),1);
    end 
    
    % finally, plot the separate stages of the flight,
    % EXCLUDING the stage where the current flow
    % is constant
    
     trunc_thres_times_vec = [ ];
    format long
    for IJK = 1:length(thres_times_vec_values)
        if isequal(mod(IJK,100),0)
            trunc_thres_times_vec(IJK) = thres_times_vec_values(IJK);
        end 
    end 
    trunc_current_vec = [ ];
    format long
    for IJL = 1:length(thres_current_vec_values)
        if isequal(mod(IJL,100),0)
            trunc_current_vec(IJL) = thres_current_vec_values(IJL);
        end 
    end 
    
    % 'renormalize' data so that we 
    % can apply the polynomial finding 
    % roots algorithm to determine a 
    % suitable polynomial fit for the data

    % MANUALLY place in values of roots and 
    % stretching constant k from polyfit_roots
    % code from online resource
    
    k =6.290750139634687e-04;
    r_1 =1.0e+02 *4.676654228275841;
    r_2= 1.0e+02*4.069645771724160;

    syms X
    % func_test = @(X) (k .* (X-r_1) .* (X-r_2));
    
    % define the function which is a smooth polynomial
    % approximation of the current versus time flight
    % data
    
    func_test = @(X) ((6.290750139634687e-04 .* (X-(1.0e+02 *4.676654228275841)) .* (X-(1.0e+02*4.069645771724160))+17));
    % func_test = @(X) (k .*(X-r));
    
    % FIRST STAGE 
    figure(12)
    
    subplot(5,1,1)
    plot(thres_times_vec_values, thres_current_vec_values)
    hold on;
    % fplot((func_test)+16.5, [399.9000 473.8850])
    
    f_val_vec = [ ];
    for AI = 1 : length(thres_times_vec_values)
        f_val_vec(AI) = func_test(thres_times_vec_values(AI));
    end 
     plot(thres_times_vec_values, f_val_vec)
     title('{\color{blue} plotting the polynomial approximation against the current versus time data}')
     xlabel('time')
     ylabel('current readings')
     % plot(thres_times_vec_values, func_test)
%      fplot(func_test , [min(thres_times_vec_values) max(thres_times_vec_values)])

    % hold on;
    
    r_1 =1.0e+02 *5.013495160622909;
   r_2 = 1.0e+02*3.732804839377091;

    subplot(5,1,2)
    plot(thres_times_vec_values, thres_current_vec_values)
    hold on;
    title('{\color{blue} plotting the polynomial approximation to the current versus time data after applying the linear transformation}')
    xlabel('time')
    ylabel('current readings')
    
    k =6.290750139634690e-04;

    func_test_2 = @(X) ((k .* (X-r_1) .* (X-r_2))+17);

    f_val_vec_2 = [ ];
    for AI = 1 : length(thres_times_vec_values)
        f_val_vec_2(AI) = func_test(thres_times_vec_values(AI));
    end 

    % plot(thres_times_vec_values, f_val_vec_2+16.7+0.3)
%     fplot(func_test_2 , [min(thres_times_vec_values) max(thres_times_vec_values)])
     
    trunc_thres_times_vec = transpose(trunc_thres_times_vec);
    trunc_thres_times_vec = nonzeros(trunc_thres_times_vec);
    trunc_current_vec = transpose(trunc_current_vec);
    trunc_current_vec = nonzeros(trunc_current_vec);
    
    subplot(5,1,3)
    
    % determine current values for time stamps less than 450
    combined_curr_times = [thres_times_vec_values; transpose(thres_current_vec_values)];
    
    thres_times_vec_values_trunc = thres_times_vec_values(thres_times_vec_values < 450);
    f_val_vec_trunc = [ ];
    for AI = 1 : length(thres_times_vec_values_trunc)
        f_val_vec_trunc(AI) = func_test(thres_times_vec_values_trunc(AI));
    end 
    
    a_1 = 16.5 + zeros( 1, 4239-3345);
    a_2 = 17.3 + zeros( 1, 4938-4499);
    
    current_jump = [ ];
    % num_test_2 = 4499 - 4226+168+(4938-4770);
    num_test_2 = 4499-4239;
    func_current = @(X) (((17.2696-16.5531)/(467.3-463.4)) * (X - 463.4) + 16.5531);
    for I = 1 : num_test_2
        current_jump = func_current(I);
    end 
    
   
     tester = [f_val_vec_trunc a_1 current_jump a_2];
     tester_2 = [a_1 current_jump a_2];
     
     plot(linspace(1,length(tester),length(tester)),tester)
     hold on;
     plot(thres_times_vec_values, thres_current_vec_values)
     
     subplot(5,1,4)
    
     % hold on;
     % plot(1,1)
     % hold on;
    
     
     plot(thres_times_vec_values_trunc, f_val_vec_trunc)

    
    figure(1)
    subplot(4,1,1)
    plot(thres_times_vec_values, thres_current_vec_values)
    hold on;
    plot(thres_times_vec_values, f_val_vec)
     title('{\color{blue} plotting the polynomial approximation against the current versus time data}')
     xlabel('time')
     ylabel('current reading')
    
    trunc_current_vec=thres_current_vec_values(33,1);
    
    subplot(4,1,2)
    plot(thres_times_vec_values, thres_current_vec_values)
    hold on;
    plot(thres_times_vec_values, f_val_vec)
     title('{\color{blue} plotting the quadratic, smooth approximation up to the time stamp at 450}')
     xlabel('time')
     ylabel('current reading')
    xlim([400 450])
     
    subplot(4,1,3)
    plot(linspace(1,length(tester_2),length(tester_2)),tester_2)
    % hold on;
    % plot(thres_times_vec_values, thres_current_vec_values)
      title('{\color{blue} plotting the magnitude of the change in current between different stages of a flight}')
     xlabel('time stamp number')
     ylabel('current reading')
    
    subplot(4,1,4)
    plot(linspace(1,length(tester_2),length(tester_2)),tester_2)
    xlim([885 900])
     title('{\color{blue} observing the magnitude of the current change between flight stages}')
     xlabel('time stamp number')
     ylabel('current reading')
    
      % poly fit with many spikes in data
     %[p_1, S , mu] = polyfit(trunc_thres_times_vec, trunc_current_vec , (length(trunc_thres_times_vec)-1)/2);
     % make sure that x to be of length odd because
     % sgf needs the frame length variable to be odd
     x = length(trunc_thres_times_vec);
     if isequal(mod(x,2),0)
         x=x-1;
         % setting x to x+1 is 
         % also possible
     end 
     % sgf = sgolayfilt(trunc_current_vec, length(trunc_thres_times_vec)-4,x);
     % p = polyfit(sgf,length(sgf),length(sgf)-1)
     % plot(trunc_thres_times_vec, sgf)
     % hold on;
%      title('{\color{blue} plotting the flight data with the Savitzky-Golay filter}')
%      xlabel('time')
%      ylabel('current readings')
     
%     subplot(5,1,4)
%     plot(linspace(1, (length(trunc_thres_times_vec))/2+1, (length(trunc_thres_times_vec))/2+1), p_1)
%      title('{\color{blue} plotting the polynomial approximation to the current versus time data with polyfit}')
%      xlabel('time')
%      ylabel('current readings')
     
%     subplot(5,1,5)
%     plot(thres_times_vec_values, thres_current_vec_values-16.5)
%     ylim([-1 18])
%     xlim([390 480])

     % compute Fourier coefficients for functions above
     
        syms X;
        w0 = pi;

%     coefficient_array_a_test = [ ];
%     coefficient_array_b_test = [ ];
%  
%     % x = linspace(1150, 1250, 100);
%     format long
%     for n = 1:200
%         fprintf('Processing %d of %d....',n,200)
%         a = (2./50) .* int(@(X) func_test * cos(n * w0 * X./50),X, 400, 450);
%         b = (2./50) .* int(@(X) func_test * sin(n* w0 * X./50),X, 400, 450);
%         coefficient_array_a_test(n) = a;
%         coefficient_array_b_test(n) = b;
%         fprintf('Done.\n')
%     end 
%     
%     coefficient_array_a_2_test = [ ];
%     coefficient_array_b_2_test = [ ];
%     
%     format long
%     for n = 1:2000
%         fprintf('Processing %d of %d....',n,2000)
%         a = (2./50) .* int(@(X) func_test * cos(n * w0 * X./50),X, 400, 450);
%         b = (2./50) .* int(@(X) func_test * sin(n* w0 * X./50),X, 400, 450);
%         coefficient_array_a_2_test(n) = a;
%         coefficient_array_b_2_test(n) = b;
%         fprintf('Done.\n')
%     end 

%     
%     coefficient_array_a_3 = [ ];
%     coefficient_array_b_3 = [ ];
    
%     format long
%     for n = 1:10000
%         fprintf('Processing %d of %d....',n,10000)
%         a = (2./80) .* int(@(X) func_test * cos(n * w0 * X./80),X, 400, 480);
%         b = (2./80) .* int(@(X) func_test * sin(n* w0 * X./80),X, 400, 480);
%         coefficient_array_a_3(n) = a;
%         coefficient_array_b_3(n) = b;
%         fprintf('Done.\n')
%     end 
%     
    sum_a_array = [ ];
    
%     sum_a_array(1)=0;
%     for IO = 1 : length(coefficient_array_a_test)
%         fprintf('Processing %d of %d....',IO,length(coefficient_array_a))
%         sum_a_array(1) = sum_a_array(1)+(coefficient_array_a(IO))^2;
%         fprintf('Done.\n')
%     end 
%     
%     sum_b_array = [ ];
%     sum_b_array(1)=0;
%     for IK = 1 : length(coefficient_array_b_test)
%         fprintf('Processing %d of %d....',IK,length(coefficient_array_b))
%         sum_b_array(1) = sum_b_array(1)+(coefficient_array_b(IK))^2;
%         fprintf('Done.\n')
%     end 
%     
%     sum_a_array_2 = [ ];
%     sum_a_array_2(1)=0;
%     for IO = 1 : length(coefficient_array_a_2)
%         fprintf('Processing %d of %d....',IO,length(coefficient_array_a_2))
%         sum_a_array_2(1) = sum_a_array_2(1)+(coefficient_array_a_2(IO))^2;
%         fprintf('Done.\n')
%     end 
%     
%     sum_b_array_2 = [ ];
%     sum_b_array_2(1)=0;
%     for IK = 1 : length(coefficient_array_b_2)
%         fprintf('Processing %d of %d....',IK,length(coefficient_array_b_2))
%         sum_b_array_2(1) = sum_b_array_2(1)+(coefficient_array_b_2(IK))^2;
%         fprintf('Done.\n')
%     end 
%     
%     sum_a_array_3 = [ ];
%     sum_a_array_3(1)=0;
%     for IO = 1 : length(coefficient_array_a_3)
%         fprintf('Processing %d of %d....',IO,length(coefficient_array_a_3))
%         sum_a_array_3(1) = sum_a_array_3(1)+(coefficient_array_a_3(IO))^2;
%         fprintf('Done.\n')
%     end 
%     
%     sum_b_array_3 = [ ];
%     sum_b_array_3(1)=0;
%     for IK = 1 : length(coefficient_array_b_3)
%         fprintf('Processing %d of %d....',IK,length(coefficient_array_b_3))
%         sum_b_array_3(1) = sum_b_array_3(1)+(coefficient_array_b_3(IK))^2;
%         fprintf('Done.\n')
%     end

figure(1)
subplot(2,1,1)
plot(coefficient_array_a_3,linspace(1,length(coefficient_array_a_3), length(coefficient_array_a_3)))
subplot(2,1,1)
plot(coefficient_array_a_3,linspace(1,length(coefficient_array_a_3), length(coefficient_array_a_3)), '.')
title('{\color{blue} plotting the Fourier cosine coefficient values}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')
xlim([0 0.43])
% plot(coefficient_array_a_3,linspace(1,length(coefficient_array_a_3), length(coefficient_array_a_3)), '.')
ylabel('number of Fourier coefficient')
ylabel('number of Fourier coefficient')
title('{\color{blue} plotting the Fourier cosine coefficient values}')
xlabel('Fourier coefficient value')
subplot(2,1,2)
plot(coefficient_array_a_3,linspace(1,length(coefficient_array_a_3), length(coefficient_array_a_3)), '.')
title('{\color{blue} Zoom in of plot above}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')

figure(2)
subplot(2,1,1)
% plot(coefficient_array_b_3, linspace(1, length(coefficient_array_b_3), length(coefficient_array_b_3)), '.')
title('{\color{blue} plotting the Fourier sine coefficient values}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')
subplot(2,1,2)
% plot(coefficient_array_b_3, linspace(1, length(coefficient_array_b_3), length(coefficient_array_b_3)), '.')
title('{\color{blue} zoom in of the plot above}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')

figure(3)
subplot(3,1,1)
plot(coefficient_array_b_2_test, linspace(1, length(coefficient_array_b_2_test), length(coefficient_array_b_2_test)), '.')
title('{\color{blue} plotting the Fourier sine coefficient values}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')
subplot(3,1,2)
plot(coefficient_array_b_2_test, linspace(1, length(coefficient_array_b_2_test), length(coefficient_array_b_2_test)), '.')
title('{\color{blue} zoom in of the plot above}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')
subplot(3,1,3)
plot(coefficient_array_b_2_test, linspace(1, length(coefficient_array_b_2_test), length(coefficient_array_b_2_test)), '.')
% title('{\color{blue} zoom in of the plot above}')
xlabel('Fourier coefficient value')
ylabel('number of Fourier coefficient')

% plot the Fourier series representation, by
% defining function handles iteratively, from
% which we are able to evaluate the Fourier series
% representation for different points in the plane
% which the aircraft traverses in a given flight plan

test_func_0 = @(x) 0;
for IK = 1 : length(coefficient_array_a_3)
    fprintf('Processing %d of %d....',IK,length(coefficient_array_a_3))
    test_func_temp = @(x) cos(IK * pi * x./50) .* coefficient_array_a_3(IK);
    test_func_0 = @(x) (test_func_temp(x) + test_func_0(x));
    fprintf('Done.\n')
end 


   
%     Fourier coefficients for this stage of the flight

    
    % [P, S , mu] = polyfit(poly_trunc_subvec, poly_trunc_subvec, length(poly_trunc_subvec)-1)
    
    
    % plot(time_vec, polyfit(time_vec,trunc_subvec_3_2,length(trunc_subvec_3_2)-1))
    % plot([1,2,3],polyfit([1,2,3],[10,25,30],2))
    
    
    % plot(time_poly_trunc_subvec,P)
    
end 