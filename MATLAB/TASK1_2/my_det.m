function determinant=my_det(A)
[N,M]=size(A);
if (N~=M)
 fprintf('The matrix is not square.');
end
determinant=1;
for i=1:N-1
 k=i;
 while A(k,i)==0 && k<=N
 k=k+1;
 end
 if k<=N
 if k~=i
 for j=i:N
 A(i,j)=A(i,j)+A(k,j);
 end
 end
 for k=i+1:N
 pol=A(k,i)/A(i,i);
 for j=i:N
 A(k,j)=A(k,j)-A(i,j)*pol;
 end
 end
 else
 i=N;
 determinant=0;
 end
end
if determinant==1
 for i=1:N
 determinant=determinant*A(i,i);
 end
end
