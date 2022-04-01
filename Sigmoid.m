function g = Sigmoid(z)
 %our prediction function h(x) = g(X*theta) = g(z), where
 %g is the sigmoid function
 %ensures that the predictions h1 ... hm for m training examples
 %are between 0 and 1 (that is, the prediction is a probability);
 
 g = zeros(size(z));
 g = 1 ./ (1 + (1./exp(z)));
 
 end
 