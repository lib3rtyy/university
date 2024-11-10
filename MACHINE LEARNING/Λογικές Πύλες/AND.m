clc 
clear all
close all
net = newp([0 1; 0 1],1); %This code creates a perceptron layer with one 2-element
P = [0 0 1 1; 0 1 0 1]; % And Input patterns
T = [0 0 0 1]; 
net.trainParam.epochs = 2; % train (learn) for a maximum of 2 epochs
net = train(net,P,T);
net.IW{1} = [1 1] % display weight vector
net.b{1} = 1 % display bias
a = sim(net,P); % simulate the network's output again (test pattern)
a = [0 1 1 1] % Result from test pattern