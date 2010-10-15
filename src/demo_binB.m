% function result = demo_binB()
%TEST_BINB st_binB ve re_binB yi test eder
%   ...
%   Example
%   -------
%   test_binB()
% 
%   See also st_binB, re_binB

% $Date: 2009/11/18 16:25 $

for B=bin2dec('00000000'):bin2dec('11111111')
    b = randint; % ya 1 ya da 0
    rB = st_binB(b, B);
    ob = re_binB(rB); % observed
    if ob ~= b
        msg = sprintf('Test basarisiz. B = %03d, b = %1d, ob = %1d', B, b, ob);
        error(msg);
        result = false;
        return
    end
end

fprintf('ST_BINB - RE_BINB testi basarili\n');
result = true;