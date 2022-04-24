function g = TestPerformance(test_data, J_history, num_iters, X, y)
  x1 = linspace(1,num_iters,num_iters); %start,end.num_steps
  baseline = zeros(1,num_iters);
  plot(x1,J_history,'--',x1,baseline,':');
  title('Cost History of Gradient Descent');
  xlabel('Number of iterations of Gradient Descent');
  ylabel('Gradient Descent cost');
  arrayP = size(X,1);
  for i = 1:size(X,1):
    x = X(i,:);
    prob = Sigmoid(x*theta);
    if prob >= 0.50
      P = 1;
    else
      P = 0;
    end
    arrayP[i] = P;
  end
endfor
numErrors = 0;
%Misclassification Analysis:
