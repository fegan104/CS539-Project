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
    m = patternnet(800);
    
    tra_flat = flatten_images(tra.images)';
    tra_out = full(ind2vec(tra.labels' + 1));
    
    tes_flat = flatten_images(tes.images)';
    
    %apply our selected activation function
    for l = 1:size(m.layers, 1)-1
        m.layers{l}.transferFcn = activation;
    end
    
    [trainedModel, trainingRecord] = train(m, tra_flat, tra_out);
    
    %Test perofrmance of our classification
    pred = vec2ind(trainedModel(tes_flat));
    pred_class = pred - 1; %move data from indices to class
    perf = classperf(tes.labels, pred_class);
    
    result = struct(...
        'accuracy', perf.CorrectRate,...
        'precision', perf.Sensitivity,...
        'recall', perf.Specificity,...
        'epochs', trainingRecord.best_epoch);
end
