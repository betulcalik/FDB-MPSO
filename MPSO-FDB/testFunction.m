function [ fitness ] = testFunction( x, fhd, fNumber )
  % x = cozum adayi, fhd = cec2020, fNumber = kacinci problem
  fitness = feval(fhd, x, fNumber);  
end
