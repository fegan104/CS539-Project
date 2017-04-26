function h = hidden(net, data)
    L = 1;
    
    count = size(data, 3);
    data_flat = flatten_images(data);
    weights = cell2mat(net.IW(L))';
    bias = cell2mat(net.b(1, :))';
    
    result = zeros([count, size(bias, 2)]);
    
    for i = 1:count
        wsum = (data_flat(i, :) * weights) + bias;
        result(i, :) = poslin(wsum);
    end
    
    h = result;
end