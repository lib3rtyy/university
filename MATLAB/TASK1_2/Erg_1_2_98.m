for N=2:200
    t=0;
    hold on;
    for i=1:10
        tic
        A=rand(N);
        b=rand([N,1]);
        x=cramer1(A,b);
        y=toc;
        t=t+toc;
    end
    averageTime = t/10;
    a1(200)=averageTime;
    %fprintf('\n');
    hold on;
    for i=1:10
        tic
        A=rand(N);
        b=rand([N,1]);
        x=gaussianElimination(A,b);
        y1=toc;
        t2=t+toc;
    end
    averageT = t2/10;
    a2(200)=averageT;
    fprintf('N: %d The cramer average is: %f \n',N,averageTime);
    fprintf('N: %d The gaussian average is: %f sec\n',N,averageT);
end

figure (1);
plot(N,a1,'k'); grid on; 
plot(N,a2,'k'); grid on;
