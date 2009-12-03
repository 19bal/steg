0001 function z = reverse(A)
0002 %REVERSE reverses the order of elements in a one-dimensional MATLAB ARRAY
0003 %
0004 % ARRAY2 = REVERSE(ARRAY1)
0005 %   ARRAY1 can be numeric, char (string), or cell array
0006 L = length(A);
0007 if iscell(A)
0008    z = cell(size(A));
0009    for i=1:L
0010       z{i} = A{L-i+1};
0011    end
0012 elseif isnumeric(A)
0013    z = zeros(size(A));
0014    for i=1:L
0015       z(i) = A(L-i+1);
0016    end
0017 elseif ischar(A)
0018     z = char(reverse(double(A)));
0019 end