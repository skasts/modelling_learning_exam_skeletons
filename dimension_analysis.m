
% dimension analysis matrix
% (rows = dimensions, columns = variables)
A = [% B c kb T lamb h
        1 0 1 0 0 1;  % W
        -3 1 0 0 0 1; % m
        0 -1 1 0 0 2; % s
        0 0 -1 1 0 0];% K

% A = [
%         1 1 0 1 1;
%         0 3 0 2 2;
%         0 -2 0 -1 -2;
%         0 -2 1 0 0];

null(A,"rational")