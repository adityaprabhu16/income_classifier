function [errorArr, degreeArr, TNArr, FPArr, FNArr, TPArr] = TestModel(training_data, test_data, numSteps)
  lambda = 1; alpha = 1; num_iters = 5000; 
  maxDegree = 105;
  stepSize = floor(maxDegree/numSteps);
  errorArr = zeros(1, numSteps);
  degreeArr = zeros(1, numSteps);
  loop_iters = 1;
  i = 1;
  while i <= 11
    [theta] = RunGradientDescent(training_data, lambda, alpha, num_iters, i);
    [testError, TN, FP, FN, TP] = TestPerformance(test_data, theta, i);
    degreeArr(loop_iters) = i;
    errorArr(loop_iters) = testError;
    TNArr(loop_iters) = TN; FPArr(loop_iters) = FP; FNArr(loop_iters) = FN; TPArr(loop_iters) = TP;
    loop_iters = loop_iters + 1;
    i = i + 1;
  endwhile
  %Things to Add: For-loop, misclassification error, precision, recall, plotting performance
end