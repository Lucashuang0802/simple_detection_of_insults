function g = sigmoidFunction(z)

  % You need to return the following variables correctly
  g = zeros(size(z));

  % Instructions: z can be a matrix, vector or scalar
  g = 1.0 ./ ( 1.0 + exp(-z)); % For Matlab
end
