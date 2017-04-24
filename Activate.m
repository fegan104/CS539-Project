%This function runs a battery of test and performance metrics on a
%patternet using the specified activation function.
%Args:
%   activation - The acivation function to be used.
%   tra - Training dataset response variable included as last column.
%   tes - Test set to be compared against.
function model = Activate(activation, tra, tes)
    m = patternnet([20 20]);
    
    for l = 1:size(m.layers, 1)-1
        m.layers{l}.transferFcn = activation;
    end
    
    tra_col = size(tra, 2);
    X = table2array(tra(:, 1:tra_col-1));
    Y = transpose(table2array(tra(:, tra_col)));
    
    train_in_vec = transpose(X);
    train_out_vec = full(ind2vec(Y+1));
    
    trainedModel = train(m, train_in_vec, train_out_vec);
    
model = trainedModel;
