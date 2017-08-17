clear all; close all; clc; 
data = dlmread('all.csv');   

N = 3900;  % total number of samples 
K = 10;  % K-fold 
d = size(data, 2) - 1;   % number of features 
nu = 0.0015;   % learning rate 

% Randomly shuffle data 
index = randperm(N); 
data_shuffled = data(index,:); 

% 10-fold cross validation 
n = N / K
J = [];
accuracy = [];
for k=1:K   
    
    % Separate training data and test data  
    % 90% of the data for training, 10% for testing  
    data_testing = data_shuffled(1:n,:)
    data_training = data_shuffled(n+1:N,:)
    data_shuffled = circshift(data_shuffled, n)
    
    % TRAINING    
    % Size X = data_training x (d + 1), the first column = 1   
    % Size y = data_training x 1 (class 1 and class 0 labels)   
    % Size w = (d + 1) x 1, initialized randomly, w1 is the bias
    X = [repmat(1,length(data_training),1) data_training(:,1:d)];
    y = data_training(:,d + 1)
    w = rand(d + 1, 1);
    m = length(data_training)
    
    % Apply Gradient Descent and run for 1500 iterations 
    for itr=1:1500
        hypothesis = sigmoidFunction(X * w);
        
        % use vertorization to train
        w = w - (nu / m) * X' * (hypothesis - y)

        J(itr) = (1 / m) * (-y' * log(hypothesis) - (1 - y)' * log(1 - hypothesis));
    end
    
    % TESTING   
    % Compute sigm for each test data and assign label   
    % Check against true response
    result = data_testing(:, d + 1)
    data_testing_X = [repmat(1,length(data_testing),1) data_testing(:,1:d)]
    predict = sigmoidFunction(data_testing_X * w);
    predict(predict >= 0.5) = 1
    predict(predict < 0.5) = 0
    accuracy(k) = numel(find(result==predict)) / length(data_testing_X) 
end

% Evaluate classification accuracy 
%   Accuracy per iteration = no of correct classification / 10 
%   Average accuracy for all 10-fold CV 
fprintf('Accuracy = %5.4f\n', mean(accuracy))

% Plot cost function vs training iterations 
plot (J);    % Size J = mx1 
xlabel('Training iterations'); 
ylabel('Cost function J');
