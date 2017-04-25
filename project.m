%Read in testing and training data
TRAINING = csvread(fullfile('data', 'training.csv'));
TESTING = csvread(fullfile('data', 'testing.csv'));

%Here we test the performance of six different ectivation function
%all with 20 hidden unit and 3 layers on patternet.

% %Pure Linear
% Activate('purelin', array2table(TRAINING), array2table(TESTING));
% 
% %ReLU (poslin)
% Activate('poslin', array2table(TRAINING), array2table(TESTING));
% 
% %Sigmoid (logsig)
% Activate('logsig', array2table(TRAINING), array2table(TESTING));
% 
% %tanh (tansig)
% Activate('tansig', array2table(TRAINING), array2table(TESTING));
% 
% %Bounded ReLU (satlin)
% Activate('satlin', array2table(TRAINING), array2table(TESTING));
% 
% %Leaky ReLu (custom)
% Activate('lrelu', array2table(TRAINING), array2table(TESTING));
% 
% %We test the performance of Decision Trees, and ECOCs 
% disp('tree')
% tree = fitctree(TRAINING(:, 1:end-1),TRAINING(:, end));
% classperf(TESTING(:, end), predict(tree, TESTING(:, 1:end-1)))
% disp('ecoc')
% ecoc = fitcecoc(TRAINING(:, 1:end-1),TRAINING(:, end));
% classperf(TESTING(:, end), predict(ecoc, TESTING(:, 1:end-1)))

%We apply meta-learning techniques to classify our data
disp('treeBagger')
treeBagger = TreeBagger(20, TRAINING(:, 1:end-1),TRAINING(:, end), 'Method','classification');
classperf(TESTING(:, end), str2num(cell2mat(predict(treeBagger, TESTING(:, 1:end-1)))))

disp('boosting')
boosting = fitcensemble(TRAINING(:, 1:end-1),TRAINING(:, end));
classperf(TESTING(:, end), predict(boosting, TESTING(:, 1:end-1)))

