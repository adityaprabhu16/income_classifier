function [theta, J_history] = GradientDescent(X,y,theta,lambda,alpha,num_iters)
m = length(y);
J_history = zeros(size(num_iters),1);
for i = 1:num_iters
    h = Sigmoid(X*theta);
    reg = (lambda/(2*m))*theta(2:end,:)'*theta(2:end,:);
    %J_history(num_iters,1) = (-1/m)*sum(y.*log(h)-(1-y).*log(1-h)) + reg;
    J_history(i) = (-1/m)*sum(y.*log(h)-(1-y).*log(1-h)) + reg;
    theta1 = [theta(1,:) ; zeros(size(theta,1)-1,1)];
    theta2 = [0; theta(2:end,:)];
    theta = theta1 + theta2*(1-(alpha*lambda)/m) - (alpha/m)*((h-y)'*X)';
end
end
