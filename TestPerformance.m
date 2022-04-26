function [testError, TN, FP, FN, TP] = TestPerformance(datafile, theta, deg)
  %x1 = linspace(1,num_iters,num_iters); %start,end.num_steps
  %Graphing the Performance
  %baseline = zeros(1,num_iters);
  %plot(x1,J_history,'--',x1,baseline,':');
  %title('Cost History of Gradient Descent');
  %xlabel('Number of iterations of Gradient Descent');
  %ylabel('Gradient Descent cost');
  data = load(datafile);
  X = data(:,[1:deg]);
  y = data(:,106);
  predictionsArr = zeros(1,size(X,1)); %array of predictions 
  errorArr = zeros(1,size(X,1)); %array of errors
  TP = 0;   %True positives
  TN = 0;   %True negatives
  FP = 0;   %False positives
  FN = 0;   %False negatives
  m = size(X,1);
  for i = 1:m
    probability = Sigmoid(X(i,:)*theta);
    if probability >= 0.5
      P = 1;
    else
      P = 0;
    endif
    predictionsArr(i) = P;
    
    %Misclassification Analysis:
    %count errors as 1, else 0:
    if predictionsArr(i) == 1 &&  y(i) == 0    %false positive (FP)
      errorArr(i) = 1;    %penalize                    
      FP = FP + 1;
    elseif predictionsArr(i) == 0 && y(i) == 1 %false negative (FN)
      errorArr(i) = 1;    %penalize
      FN = FN + 1;
    elseif predictionsArr(i) == 1 && y(i) == 1 %true positive (TP)
      errorArr(i) = 0;    
      TP = TP + 1;
    else                                       %true negative (TN) 
      errorArr(i) = 0;
      TN = TN + 1;
    endif
  endfor
  %Add up the errors, and calculate proportion correct
  numErrors = sum(errorArr);
  accuracy = (TP+TN)/(TP+TN+FP+FN);
  precision = TP/(TP+FP);             %percent time model is correct
  recall = TP/(TP+FN);                %percent actual positives identified correctly.
  testError = numErrors*(1/m);        %error of the model
  errorArr = {TN,FN,FP,TP};
  end