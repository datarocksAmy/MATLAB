% ---------------------------------------------
% Mini Project #2 - RBF Neural Nets 
% ( Find the optimized goal and spread value. )
% ---------------------------------------------

% Clear memory data
clear all;
clc;

% Load formatted input and target data
load('P.mat');
load('T.mat');

% Splipt Input Data & Store indexes ( 60% Train, 20% Validation, 20% Test )
[trainP, valP, testP, trainIdx, valIdx, testIdx] = dividerand(P, 0.6, 0.2, 0.2);	

% Split Target Data  ( 60% Train, 20% Validation, 20% Test )
[trainT, valT, testT] =	divideind(T, trainIdx, valIdx, testIdx);

% Build two RBF	Neural Nets ( Exact + Regular Base )
RBF_exact	=	newrbe(trainP,trainT);

% ----- Simulate Validation MSE for different goals and spreads -----

% Initialize goal and a matrix for storing simulation results
goal = 0.0;
simulation_results = [];

% Goal loop until it reaches 1
while( goal <= 1 )
    
    % Initialize spread as 1
    reg_spread = 1;
    
    % Spread loop until it reaches 35
    while(reg_spread <= 35)
        
        % Train the Reguar RBF net
        RBF_regular	= newrb(trainP, trainT, goal, reg_spread, 200, 50);

        % Network Output using validation 
        RBFRegular_output = sim(RBF_regular, valP);	

        % MSE Error for validation
        Validation_MSE = mse(RBFRegular_output - valT);
       
        % Store the simulation result when Validation MSE is between 0.5
        % and 0.51
        if(Validation_MSE >= 0.5 && Validation_MSE <= 0.51 )
            
            % Store all simulation valules : goal, spread, validation MSE
            results = [goal, reg_spread, Validation_MSE];
            simulation_results = vertcat(simulation_results, results);
        
        % Find Validation = 0.5, go to the next goal iteration
        if(Validation_MSE == 0.5)
            break
        elseif(Validation_MSE < 0.5)
            break
        end
        
        % Increment spread by 1
        reg_spread = reg_spread + 1;
        
        end
    end
    % Incrementn goal by 0.1
    goal = goal + 0.1;
end

disp(simulation_results);
