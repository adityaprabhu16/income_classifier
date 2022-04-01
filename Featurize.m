function map = Featurize(X1, X2) %the original latitude and longitude features
  %function maps the original X1 and X2 features into other combinations
  %of polynomial features as follows: X1, X2, X1.^2, X2.^2, X1*X2.^2, etc.
  %ths array of additional features is stored into map and returned
  
  degree = 6;
  map = ones(size(X1(:,1))); %the fact that map is initialized to ones is important
  
  for i = 1:degree
    for j = 0:i
      map(:, end+1) = (X1.^(i-j)).*(X2.^(j));
    end
  end
  
end 
  