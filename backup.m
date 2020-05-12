test_func_2 = @(x) 0;

% code that I copy and pasted into 2017b, runs much faster

% paste these lines of code directly into the command line

for IK = 1 : length(coefficient_array_b_2_test)
    fprintf('Processing %d of %d....',IK,length(coefficient_array_b_2_test))
    test_func_temp = @(x) cos(IK * pi * x./50) .* coefficient_array_b_2_test(IK);
    test_func_2 = @(x) (test_func_temp(x) + test_func_2(x));
    fprintf('Done.\n')
end


    coefficient_array_a_3 = [ ];
    coefficient_array_b_3 = [ ];
    
    func_test = @(X) ((6.290750139634687e-04 .* (X-(1.0e+02 *4.676654228275841)) .* (X-(1.0e+02*4.069645771724160))+17));

    syms X;
    w0 = pi;
    
         coefficient_array_a_test_2 = [ ];
         coefficient_array_b_test_2 = [ ];
 
    % x = linspace(1150, 1250, 100);
    format long
    for n = 1:200
        fprintf('Processing %d of %d....',n,200)
        a = (2./50) .* int(@(X) func_test * cos(2 * n * w0 * X./50),X, 400, 450);
        b = (2./50) .* int(@(X) func_test * sin(2* n* w0 * X./50),X, 400, 450);
        coefficient_array_a_test_2(n) = a;
        coefficient_array_b_test_2(n) = b;
        fprintf('Done.\n')
    end 
    
     sum_a_array_2 = [ ];
     sum_a_array_2(1)=0;
    for IO = 1 : length(coefficient_array_a_test)
        fprintf('Processing %d of %d....',IO,length(coefficient_array_a_test))
        sum_a_array_2(1) = sum_a_array(1)+(coefficient_array_a_test(IO))^2;
        fprintf('Done.\n')
    end 
    
    sum_b_array = [ ];
    sum_b_array(1)=0;
    for IK = 1 : length(coefficient_array_b_test)
        fprintf('Processing %d of %d....',IK,length(coefficient_array_b_test))
        sum_b_array(1) = sum_b_array(1)+(coefficient_array_b_test(IK))^2;
        fprintf('Done.\n')
    end 
    
        
    format long
    for n = 1:10000
        fprintf('Processing %d of %d....',n,10000)
        a = (2./80) .* int(@(X) func_test * cos(2* n * w0 * X./80),X, 400, 480);
        b = (2./80) .* int(@(X) func_test * sin(2* n* w0 * X./80),X, 400, 480);
        coefficient_array_a_3(n) = a;
        coefficient_array_b_3(n) = b;
        fprintf('Done.\n')
    end 
    