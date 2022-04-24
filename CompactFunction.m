function CompactFunction(dataFileNorm, dataFileOrig, x)
data = load(dataFileNorm);
X = data(:,[1,2]); y = data(:,3);
[ynew] = YTransform(y,0);
num_iters = 10000;
alpha = 0.01;
lambda = 1;
X = Featurize(X(:,1),X(:,2)); 
J_history = zeros(num_iters,1);
initial_theta = zeros(size(X,2),1);
%== === == === == = = == = = = = == = = == = == = 

[theta, J_history] = GradientDescent(X,ynew,initial_theta,lambda,alpha,num_iters);
%= == = = == = = == = = == = = == = = == = = = ==
PlotBoundary(theta,X,ynew);
xtemp = x;
Predict(theta,x, dataFileOrig);
end
