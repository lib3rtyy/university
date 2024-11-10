close all, clear all, clc
Y = [-1 -1 -1 1;-1 -1 1 1;-1 1 -1 1;-1 1 1 1;1 -1 -1 1;1 -1 1 1;1 1 -1 1;1 1 1 1];

d =[1 1 1 1  1 1 1 -1]; %vector of desired outputs
clc;

%Assign small random initial weights and display them
w=rand(4,1);
disp('Initial random weight vector is:');
disp(w');
 
%initialise learning rate c
c=1;
er=0; k=0;
fprintf('k     error  net   w1   w2    w3    w4     \n');

%training begins here
while(1)
      er=0;
      for i=1:8     
        x=Y(i,:)';
        net=w'*x;
       	o(i)=sign(net);%ouput of the TLU perceptron computed
       	et=0.5*(d(i)-o(i))^2;
        er=er+et;
        
        %find weight change dw using perceptron learning rule
        dw=c*(d(i)-o(i))*x;
        w=w+dw;
        k=k+1;
        fprintf('\n%-4d %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f',k,er,net,w(1),w(2),w(3),w(4));  
      end
      if (er==0)
          break;
      end
end    
% Training ends here

%Network Recall
fprintf('\n\nPerforming the network recall to generate the network output for each input case:');
fprintf('\n\nTruth Table for NAND gate alongwith actual output o of the trained network\n\n');

fprintf(' x1  x2   x3  x4  d   o');

for i=1:8
    x=Y(i,:)';
    o(i)=sign(w'*x);
    fprintf('\n%3d %3d %3d %3d %3d %3d',x(1),x(2),x(3),x(4),d(i),o(i));
end

fprintf('\n');