%Read in testing and training data
TRAINING = csvread(fullfile('data', 'training.csv'));
TESTING = csvread(fullfile('data', 'testing.csv'));

%Pure Linear
Activate('purelin', array2table(TRAINING), array2table(TESTING));

%ReLU (poslin)
Activate('poslin', array2table(TRAINING), array2table(TESTING));

%Sigmoid (logsig)
Activate('logsig', array2table(TRAINING), array2table(TESTING));

%tanh (tansig)
Activate('tansig', array2table(TRAINING), array2table(TESTING));

%Bounded ReLU (satlin)
Activate('satlin', array2table(TRAINING), array2table(TESTING));

%Leaky ReLu (custom)
Activate('lrelu', array2table(TRAINING), array2table(TESTING));


