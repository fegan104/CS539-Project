%This function runs a battery of test and performance metrics on a
%patternet using the specified activation function.
%Args:
%   activation - The acivation function to be used.
%   tra - Training dataset response variable included as last column in table.
%   tes - Test set to be compared against as a table.
%Returns:
%   performance metrics
function result = Activate(activation, tra, tes)
    %Instantiate our neural net with 3 layers and 20 hidden units
    m = patternnet();
    %m.trainParam.goal = 0.001;
   
    
    %apply our selected activation function
    for l = 1:size(m.layers, 1)-1
        m.layers{l}.transferFcn = activation;
    end
    
    %Transform input data for training
    tra_col = size(tra, 2);
    X = table2array(tra(:, 1:tra_col-1));
    Y = transpose(table2array(tra(:, tra_col)));
    train_in_vec = transpose(X);
    train_out_vec = full(ind2vec(Y+1));
    %Train model on tranformed data sets
    [trainedModel trainingRecord] = train(m, train_in_vec, train_out_vec);
    %Test perofrmance of our classification
    classes = vec2ind(trainedModel(table2array(tes(:, 1:end-1))'));
    classes = classes-1;%move data from indices to class
    perf = classperf(table2array(tes(:, end)), classes);

    accuracy = perf.CorrectRate;
    recall = perf.Sensitivity;
    precision = perf.Specificity;
    epochs = trainingRecord.best_epoch;
    %model = trainedModel;
    result = struct('accuracy', accuracy, 'precision', precision, 'recall', recall, 'epochs', epochs);
end
