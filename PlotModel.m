function PlotModel(errorArr, degreeArr, TNArr, FPArr, FNArr, TPArr)
  %x1 = linspace(1,maxDegree,maxDegree); %start,end.num_steps
  subplot(4,3,1);
  plot(degreeArr, errorArr,':');
  title('Training Error');
  xlabel('Number of Features');
  ylabel('Error');
  
  subplot(4,3,2);
  plot(degreeArr, TNArr, ':');
  title('True Negative');
  xlabel('Number of Features');
  ylabel('Count');
  
  subplot(4,3,3);
  plot(degreeArr, FPArr, ':');
  title('False Positive');
  xlabel('Number of Features');
  ylabel('Count');
  
  subplot(4,3,4);
  plot(degreeArr, FNArr, ':');
  title('False Negative');
  xlabel('Number of Features');
  ylabel('Count');
  
  subplot(4,3,5);
  plot(degreeArr, TPArr, ':');
  title('True Positives');
  xlabel('Number of Features');
  ylabel('Count');  
  
  subplot(4,3,6);
  accuracy = (TPArr+TNArr)./(TPArr+TNArr+FPArr+FNArr); %element-wise division
  plot(degreeArr, accuracy, '-oro', 'MarkerSize', 2);
  title('Accuracy');
  xlabel('Number of Features');
  ylabel('Proportion');  
  
  subplot(4,3,7);
  precision = TPArr./(TPArr+FPArr); %element-wise division
  plot(degreeArr, precision, '-oro', 'MarkerSize', 2);
  title('Precision');
  xlabel('Number of Features');
  ylabel('Proportion');  
  
  subplot(4,3,8);
  recall = TPArr./(TPArr+FNArr); %element-wise division
  plot(degreeArr, recall, '-oro', 'MarkerSize', 2);
  title('Recall');
  xlabel('Number of Features');
  ylabel('Proportion');  
  
end