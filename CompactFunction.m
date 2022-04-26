function CompactFunction(training_data, test_data, lambda, alpha, num_iters)
  %set training_data = 'training_data_cleaned.txt'
  %set test_data = 'test_data_cleaned.txt'
  %vary lambda, alpha, num_iters as desired. 
  %By default, try lambda = 1, alpha = 0.01, num_iters = 1000
  data_training = load(training_data);
  data_test = load(test_data);
  X = data_training(:,[1:105]);
  y = data_training(:,106);
  J_history = zeros(num_iters,1);
  initial_theta = zeros(size(X,2),1);
  [theta,J_history] = GradientDescent(X,y,initial_theta,lambda,alpha,num_iters);
  TestPerformance(J_history,num_iters,X,y);
  %Things to Add: For-loop, misclassification error, precision, recall, plotting performance
end
