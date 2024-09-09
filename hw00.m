% Author: Alexis Abney / aha0013@auburn.edu
% Date: 2024-09-01
% Assignment Name: hw00

classdef hw00
    methods (Static)
        function a_m = p1(m)
            % This function takes an integer m and returns the term a_m in the sequence defined by 
            % a_0 = 0, a_1 = 1, a_2 = 1, and a_n = a_{n-1} + a_{n-2} + a_{n-3} for n >= 3.
            % :param m: an integer
            % :return: the m-th term in the sequence

            % Check if the input is a non-negative integer
            if m < 0
                error('m must be a non-negative integer')
            end

            
            if m == 0
                a_m = 0;
                return;
            elseif m == 1
                a_m = 1;
                return;
            elseif m == 2
                a_m = 1;
                return;
            end

            
            a0 = 0;
            a1 = 1;
            a2 = 1;

            
            for i = 3:m
                a_m = a0 + a1 + a2;
                
                a0 = a1;
                a1 = a2;
                a2 = a_m;
            end
        end

        function det_A = p2(A)
            % This function computes the determinant of a matrix A using Laplace expansion.
            % :param A: a matrix of size n x n
            % :return: the determinant of A

            % Check if A is a square matrix
            [n, m] = size(A);
            if n ~= m
                error('A must be a square matrix');
            end

           
            if n == 1
                det_A = A(1, 1);
                return;
            end

           
            if n == 2
                det_A = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1);
                return;
            end

            
            det_A = 0;

            
            for j = 1:n
                
                minor = A;
                minor(1, :) = []; 
                minor(:, j) = []; 

                
                cofactor = (-1)^(1+j) * A(1, j) * hw00.p2(minor);

                
                det_A = det_A + cofactor;
            end
        end

        function p3()
            % This function should have a run time about 1 second.
            % :return: no returns

            % Run a task for approximately 1 second
            tic;
            count = 0;

            while toc < 1
                
                count = count + 1;
            end

            fprintf('Operations performed: %d\n', count);
        end
    end
end