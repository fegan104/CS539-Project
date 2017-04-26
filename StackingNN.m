function cp = StackingNN(training, testing)
    traData = flatten_images(training.images);
    traResp = training.labels;
    testData = flatten_images(testing.images);
    testResp = testing.labels;
    %Traing the L0
    L0 = cell(2, 1);
    L0{1} = fitcknn(traData, traResp);
    L0{2} = fitctree(traData, traResp);
    %Augment training data
    augTraData = traData;
    augTestData = testData;
    for i=size(L0)
        %TODO: don't predict on data we trained on
        augTraData = [augTraData, predict(L0{i}, traData)];
        augTestData = [augTestData, predict(L0{i}, testData)];
    end
    %Train net
    net = patternnet([800]);
    
    net = train(net, augTraData', full(ind2vec(traResp'+1)));
    classEst = vec2ind(net(augTestData'))-1;
cp = classperf(testResp, classEst);