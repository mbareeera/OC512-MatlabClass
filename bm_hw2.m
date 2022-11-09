clear all
close all
clc
%% Homework 2 Bareera Mirza

%Q1:Use a method of your choice to create the row vector x having 100 
% regularly spaced values starting exactly at 6 and ending exactly at 39.

x=linspace(6,36,100) 

%%

%Q2:Use a method of your choice to create the column vector y having 
% a regular spacing of 0.25 starting at -3 and ending at 12.
y=(-3:0.25:12)'

%% 
% Q3: Create a vector x having six values starting at 0 and ending at 5.
% Create a matrix A whose first row is x, second row is 2x and third row is 3x + 10.

x=linspace(0,5,6)

Two=[2 2 2 2 2 2];
Twox = x.*Two;
Three=[3 3 3 3 3 3];
Threex= (x.*Three)+10;

A=[x;Twox;Threex]
 
%There must be simpler way but this is what I thought of

%%
%Q4Create the matrix 𝐴. 


A=[3 5 9;6 37 1; 2 8 6]

%Create the vector c that consists of the third row of A.
c=A(3,:)

% Create the vector d that consists of the second column of A. 
d=A(:,2)

% Create a 1x2 array e that consists of the first and second rows of A.

r1=A(1,:)
r2=A(2,:)
e=[r1 r2] %Concatenating

% Create a 2x2 array that consists of the 4 corner elements of A.

f=A([1,end],[1,end])

%%

%use the ‘sort’ function to create two new matrices; 
% one with each column sorted and one with each row sorted

A

Row = sort(A,2) %SORT IN ASCENDING ORDER

Col=sort(A,'descend') % column in descernding order


%%
 %Do maath to add, subtract, multiply, and divide C and D.

 C= [6 7; 2 9];
 D=[-9 3; 7 5];

 ad=C+D 
 minus= C-D

 pr=C.*D
 div=C./D

 %%

 %Using a method of your choice, create the following 2x2 cell array 

 
 A={'Simulink','Matlab';[3 9;8 2],[2 8 5]'}
 ss=A{2} %showing sub matrices of row and column
 ss2=A{4} %showing sub matrices of column only

%a. How would you access the $l% in ‘Matlab’ as a character?

l=A{3}(4)

%b.How would you access the word %Simulink  as a character array?As a cell?

sim=A{1}

cl=A(1) 

%c. How would you access the 8 in each of the two numeric arrays?

eight1=A{2}(2)
eight2=A{4}(2)

%d. Use the %deal’ function in to assign each cell in A to a variable of 
% the appropriate type.

[a,b,c,d] = deal(A{:})


%%
%Having done this, please figure out a way to concatenate your two
% structures into a single structure array called  combined_students’.


ce640student(1).firstname='Sam';
ce640student(2).firstname='Pierce';
ce640student(3).firstname='Chris';
ce640student(1).lastname='Fung';
ce640student(2).lastname='Steele';
ce640student(3).lastname='Ray';
ce640student(1).examscore=[94 93];
ce640student(2).examscore=[87 75];
ce640student(3).examscore=[90 81];


oc512student(1).firstname='Greg';
oc512student(2).firstname='Mary';
oc512student(3).firstname='Will';
oc512student(1).lastname='Jones';
oc512student(2).lastname='Smith';
oc512student(3).lastname='Besso';
oc512student(1).examscore=[96 95];
oc512student(2).examscore=[82 65];
oc512student(3).examscore=[81 78];

% Convert structures to tables
aa_t = struct2table( ce640student )
bb_t = struct2table( oc512student )

combined_students = [ce640student oc512student]

%% End



