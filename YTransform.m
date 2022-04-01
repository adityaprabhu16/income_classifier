function [yNew] = YTransform(y,n)
%turns n into 1's, everything else into 0's
%ensures there's only 1's and 0's in the
%sorting mechanism
yNew = zeros(size(y));
N = size(y,1); %numRows
M = size(y,2); %numColumns


   for i = 1:N
    for j = 1:M
       if y(i,j) ~= n
           yNew(i,j) = 0;
       else
           yNew(i,j) = 1;
       end
    end
   end


end