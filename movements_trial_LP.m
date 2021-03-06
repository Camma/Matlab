%this is the main movement code. the way it works is it keeps an index of
%where the cars are, and only updates the index and not the entire matrix.
%Also, the car now only checks the blocks around it and not the entire
%matrix like it did before. In order to avoid going back on its own steps,
%it keeps the direction it went represented by the numbers 2,4,6 and 8. 2
%is south, 4 is west, 6 is east, and 8 is north.�Most of the lines are
%explained, for the rest ask me directly.
%
%North=8
%South=2
%East=6
%West=4
%
close all
clc
clear all
%init number of times the movement is repeated
nIter=0;
%input for map
inp=0;
inp= input(sprintf('1:top to bottom, 30x3   \n2:bottom to top,30X3   \n3:twist & turns 30x30   \n4:two cars   \n5:two cars simple crossing   \n6:casual crossing   \n',inp));
%if-else statement for map
if (inp==1)
    %creating the matrix
    A=-1*zeros(30,3);
    %setting the free road
    A(:,2)=1;
    %index for the car
    B=[1,2];
    %starting position
    A(B(1,1),B(1,2))=0.3;
    %number of iterations for the specified map
    nIter=30;
    %number of cars for the specified map
    nCars=1;
    %previous movement is set by the program depending in the sirtuation
    %for each car
    movement(1,1)=2;
    %SAME AS ABOVE
elseif (inp==2)
    A=-1*zeros(30,3);
    A(:,2)=1;
    A(15,2)=-1;
    B=[30,2];
    A(B(1,1),B(1,2))=0.3;
    nIter=30;
    nCars=1;
    movement(1,1)=8;
    %SAME AS ABOVE
elseif (inp==3)
    A=-1*ones(30,30);
    A(1:10,3)=1;
    A(10,3:25)=1;
    A(10:15,25)=1;
    A(15,2:25)=1;
    A(15:25,2)=1;
    A(25,2:10)=1;
    A(20:25,10)=1;
    A(20,10:29)=1;
    B=[1,3];
    A(B(1,1),B(1,2))=0.3;
    nIter='fit';
    nCars=1;
    movement(1,1)=2;
elseif (inp==4)
    A=-1*zeros(30,5);
    A(:,2)=1;
    A(:,4)=1;
    B=[30 2;1 4];
    A(B(1,1),B(1,2))=0.3;
    A(B(2,1),B(2,2))=0.3;
    nIter=30;
    nCars=2;
    movement(1,1)=8;
    movement(1,2)=2;
elseif (inp==5)
    A=-1*zeros(30,30);
    A(:,15)=1;
    A(15,:)=1;
    B=[1 15;15 1];
    A(B(1,1),B(1,2))=0.3;
    A(B(2,1),B(2,2))=0.3;
    nIter=30;
    nCars=2;
    movement(1,1)=2;
    movement(1,2)=6;
elseif (inp==6)
    A=-1*zeros(30,30);
    A(:,15)=1;
    A(15,:)=1;
    A(1,:)=-1;
    A(:,1)=-1;
    A(30,:)=-1;
    A(:,30)=-1;
    A(15,15)=2;
    B=[1 15];
    A(B(1,1),B(1,2))=0.3;
    nIter=30;
    nCars=1;
    movement(1,1)=2;
elseif (inp==7)
    A=-1*zeros(300,300);
    A(:,2)=1;
    A(:,4)=1;
    B=[300 2;1 4];
    A(B(1,1),B(1,2))=0.3;
    A(B(2,1),B(2,2))=0.3;
    nIter=300;
    nCars=2;
    movement(1,1)=8;
    movement(1,2)=2;
end

%video
video=0;
video = input(sprintf('videofile?? 1 for yes, 2 for no',video));
if (video==1)
aviobj = avifile('example.avi','compression','None');
fig=figure;
end


%show first image
imshow(A,'InitialMagnification',250,'colormap',hot)

if (video==1)
F = getframe(fig);
aviobj = addframe(aviobj,F);
end


%break
pause(1)
%loop for movements
for i=2:1:nIter
    for j=1:1:nCars %loop for each car on the map
    [A,B,movement,i,j] = prevmove(A,B,movement,i,j);
    end
    imshow(A,'InitialMagnification',250,'colormap',hot)
    pause(0.01)
    if (video==1)
        F = getframe(fig);
        aviobj = addframe(aviobj,F);
    end
end

if (video==1)
close(fig);
aviobj = close(aviobj);
end