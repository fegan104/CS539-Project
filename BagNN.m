%This function will seperate training set into numBag parts then train
%the given neural net on that data.
%Args:
%   net - The weak learner untrained neural net
%   training - The training set with classes as the last column
%   tesing - The testing set with classes as the last column
%   numBags - the number of bags to use
function acc = BagNN(net,training, testing, numBags)
    trainingClass = training(:, end);
    cv = cvpartition(trainingClass, 'KFold', numBags);
    bags = cell(numBags, 1);
    for i=1:numBags
        data = training(:, 1:end-1)';
        classes = training(:, end)';
        classes = full(ind2vec(classes(cv.training(i))+1));
        trained = train(net,data(:, cv.training(i)),classes);
        bags{i} = trained;
    end
    testData = testing(:, 1:end-1);
    testClass = testing(:, end);
    bagged = predictOnBag(bags, testData');
    cp = classperf(testClass, bagged);
acc = cp.CorrectRate;

function result = predictOnBag(bag, X)
    numBags = size(bag);
    preds = zeros(1, length(X));
    idx = 1;
    for d = X
        predForD = zeros(numBags);
        for i=1:numBags
            net = bag{i};
            predForD(i) = vec2ind(net(d))-1;
        end
        preds(idx) = mode(predForD);
        idx = idx + 1;
    end
result = preds;