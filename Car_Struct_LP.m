%creating structs car
%clears workspace LP
clear all
%clears window LP
clc
%limits LP
A=10;
%loop LP
for i=1:1:A
%color array
C_temp=['y';'m';'c';'r';'g';'b';'w'];
%randomizer for the color
C=C_temp(floor((rand(1)*7)+1),1);
%randomize in x position LP
rand_x=floor(rand(1)*A);
%randomize in y position LP
rand_y=floor(rand(1)*A);
%create struct LP
car_struct = struct ('car_id',num2str(i), 'color',  C, 'pos_x', num2str(rand_x), 'pos_y', num2str(rand_y))

end
