function x = gaussianElimination(A, b)
% Description: Solves Ax = b using the Gaussian elimination with partial pivoting
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
	Aug = [A b]; % build the augmented matrix
	C = zeros(1, n + 1);
	
	% elimination phase
	for k = 1:n - 1
		% ensure that the pivoting point is the largest in its column
		[pivot, j] = max(abs(Aug(k:n, k)));
		C = Aug(k, :);
		Aug(k, :) = Aug(j + k - 1, :);
		Aug(j + k - 1, :) = C;
		if Aug(k, k) == 0
			error('Matrix A is singular');
		end
		for i = k + 1:n
			r = Aug(i, k) / Aug(k, k);
			Aug(i, k:n + 1) = Aug(i, k:n + 1) - r * Aug(k, k: n + 1);
		end
	end
	
	% back substitution phase
	x = zeros(n, 1);
	x(n) = Aug(n, n + 1) / Aug(n, n);
	for k = n - 1:-1:1
		x(k) = (Aug(k, n + 1) - Aug(k, k + 1:n) * x(k + 1:n)) / Aug(k, k);
	end
end