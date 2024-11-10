
x = glassInputs;
t = glassTargets;


trainFcn = 'trainscg'; 


hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize, trainFcn);


net.divideParam.trainRatio = 75/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;


[net,tr] = train(net,x,t);


y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y)
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);


view(net)


figure, plotperform(tr)
figure, plottrainstate(tr)
figure, ploterrhist(e)
figure, plotconfusion(t,y)
figure, plotroc(t,y)


load glass_dataset
[x,t] = glass_dataset;
trainFcn = 'trainscg';  
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize, trainFcn);

net.divideParam.trainRatio = 75/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
[net,tr] = train(net,x,t);







