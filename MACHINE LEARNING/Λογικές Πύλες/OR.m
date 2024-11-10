clc 
clear all
close all

net = newp([0 1; 0 1],1);
P = [0 0 1 1; 0 1 0 1]; % OR Input patterns
T = [0 1 1 1];
net.IW{1} = [1 1] % display weight vector
net.b{1} = 1
net.trainParam.epochs = 2; % train (learn) for a maximum of 2 epochs
net = train(net,P,T);
net.IW{1} = [1 1] % display weight vector
net.b{1} = 1 % display bias
a = sim(net,P); % simulate the network's output again (test pattern)
