% The piano key numbers and the corresponding durations for Nancy Mulligan.
%
% t and tdur are for the treble clef or upper part and b and bdur are for 
% the bass clef or lower part.
% A duration of 1 corresponds to an EIGHTH note, a note value 0 is a REST.

clear, clc

% mi 44
% fa 45
% so 47
% xi 51
% do 52
% ri 54
% mi 56
% fa 57
% so 59
t = [ 59 58 56 58 56 54 56 54 51 51 51 53 ...
      54 51 49 51 49 47 49 47 44 44 ...
      59 58 56 58 56 54 56 54 51 51 51 54 ...
      56 58 56 54 51 54 51 49 47 46 44 44 ];

tdur = [ 1 .5 .5 1 .5 .5 .5 .5 1 1 .5 .5 ...
         1 .5 .5 1 .5 .5 .5 .5 1 2 ...
         1 .5 .5 1 .5 .5 .5 .5 1 1 .5 .5 ...
         .5 .5 .5 .5 .5 .5 .5 .5 .5 .5 1 2 ];

play(t, tdur)
