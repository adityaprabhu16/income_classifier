function [theta] = RunGradientDescent(training_data, lambda, alpha, num_iters, degree)
  %set training_data = 'training_data_cleaned.txt'
  %set test_data = 'test_data_cleaned.txt'
  %vary lambda, alpha, num_iters as desired. 
  %By default, try lambda = 1, alpha = 0.01, num_iters = 1000
  data_training = load(training_data);
  X = data_training(:,[1:degree]);
  y = data_training(:,106);
  J_history = zeros(num_iters,1);
  initial_theta = ones(size(X,2),1);      %IMPORTANT - it MATTERS where initial_theta is initialized!
  [theta,J_history] = GradientDescent(X,y,initial_theta,lambda,alpha,num_iters);
  %[error, accuracy, precision, recall, errorArr] = TestPerformance(test_data, theta)
  %Things to Add: For-loop, misclassification error, precision, recall, plotting performance
end
