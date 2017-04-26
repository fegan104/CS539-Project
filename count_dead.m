function d = count_dead(net, L, data)
    pred = hidden(net, data);
    counts = size(pred, 2);
    activeCount = zeros(counts, 1);
    for i = 1:counts
        activeCount(i) = numel(unique(pred(i, :)));
    end
    
    d = sum(activeCount == 1);
end