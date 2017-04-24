%Read in testing and training data
TRAINING = csvread(fullfile('data', 'training.csv'));
TESTING = csvread(fullfile('data', 'testing.csv'));

%Separate out the data from the responses
trainingData = TRAINING(:, 1:end-1);
trainingResp = TRAINING(:, end);
testingData = TESTING(:, 1:end-1);
testingResp = TESTING(:, end);



