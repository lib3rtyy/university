function x = cramer1(A, b)
% Description: Solves Ax = b using the Cramer rule
% Input: 
%   - A: the coefficient matrix
%   - b: the right-hand side values
% Output: 
%   - x: the solution vector
% Author: Nikos Ploskas

	[m, n] = size(A);
	if m ~= n
		error('Matrix A must be square!');
	end
	n1 = length(b);
	if n1 ~= n
		error('Vector b should be equal to the number of rows and columns of A!');
	end
	%p = det(A); 
     p = my_det(A);
	x = zeros(n, 1);
	for j = 1:n
		%x(j) = det([A(:,1:j-1) b A(:,j+1:end)]) / p;
         x(j) = my_det([A(:,1:j-1) b A(:,j+1:end)]) / p;
	end
end
