function Predict(theta,xtemp, dataFileOrig)
  data = load(dataFileOrig);
  X = data(:,[2,3]);
  latMean = mean(X(:,1));
  longMean = mean(X(:,2));
  latSTD = std(X(:,1));
  longSTD = std(X(:,2));
  xnorm = [((xtemp(:,1)+latMean)/latSTD) ((xtemp(:,2)+longMean)/longSTD)];
  x = Featurize(xnorm(:,1), xnorm(:,2)); %lat feature, long feature
  prob = Sigmoid(x*theta); %probability based on trained parameters
  if prob >= 0.50
    P = 1;
  else
    P = 0;
  end
  %accuracy = mean(double(P==y))*100;
  fprintf('\nFor a Satellite at Latitude (Deg): %f', xtemp(:,1));
  fprintf(' and Longitude (Deg): %f\n', xtemp(:,2));
  if P == 1
    fprintf('The Satellite is within the South Atlantic Anomaly with likelihood: %f ', prob);
  else 
    fprintf('The Satellite is NOT within the South Atlantic Anomaly with likelihood: %f\n ', 1-prob);
  end

  %fprintf('And accuracy: %f\n', accuracy);
end
  