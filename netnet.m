function model = netnet(activation, tra, tes)
    m = patternnet([20 20]);
    
    for l = 1:size(m.layers, 1)-1
        m.layers{l}.transferFcn = activation;
    end
    
    tra_col = size(tra, 2);
    disp(tra_col)
    X = table2array(tra(:, 1:tra_col-1));
    Y = transpose(table2array(tra(:, tra_col)));
    
    train_in_vec = transpose(X);
    train_out_vec = full(ind2vec(Y+1));
    
    trainedModel = train(m, train_in_vec, train_out_vec);
    
model = trainedModel;
