function g = TestPerformance(J_history, num_iters)
  x1 = linspace(1,num_iters,num_iters); %start,end.num_steps
  baseline = zeros(1,num_iters);
  plot(x1,J_history,'--',x1,baseline,':');
  title('Cost History of Gradient Descent');
  xlabel('Number of iterations of Gradient Descent');
  ylabel('Gradient Descent cost');
  
 end