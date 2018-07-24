function [z,RMSE_control,max_control_error,min_control_error,RMSE_Check,max_check_error,min_check_error]=Polynomial(x,y,Control_Points,Check_Points,Degree)
X=Control_Points(:,2);
Y=Control_Points(:,3);
Z=Control_Points(:,4);
%Compute Parameters from Control points-------------------------------------
%First compute design matrix
for i=1:length(X)
    if(i==1)
       A=[1 X(i) Y(i) X(i)^2 X(i)*Y(i) Y(i)^2 X(i)^3 X(i)^2*Y(i) Y(i)^2*X(i) Y(i)^3 X(i)^4 X(i)^3*Y(i)...
           X(i)^2*Y(i)^2 X(i)*Y(i)^3 Y(i)^4 X(i)^5 X(i)^4*Y(i) X(i)^3*Y(i)^2 X(i)^2*Y(i)^3 X(i)*Y(i)^4 Y(i)^5];
    end
    if(i>1)
       B=[1 X(i) Y(i) X(i)^2 X(i)*Y(i) Y(i)^2 X(i)^3 X(i)^2*Y(i) Y(i)^2*X(i) Y(i)^3 X(i)^4 X(i)^3*Y(i)...
           X(i)^2*Y(i)^2 X(i)*Y(i)^3 Y(i)^4 X(i)^5 X(i)^4*Y(i) X(i)^3*Y(i)^2 X(i)^2*Y(i)^3 X(i)*Y(i)^4 Y(i)^5];
       A=[A;B];
    end
end
switch Degree
    case 1
        A=A(:,1:3);
    case 2
        A=A(:,1:6);
    case 3
        A=A(:,1:10);
    case 4 
        A=A(:,1:15);
    case 5
        A=A;
end

Parameters=inv(A'*A)*A'*Z;
%Compute RMSE For Control points-------------------------------------
l1_computed=A*Parameters;
l1_observed=Z;
%r is rasidual vector
r=l1_observed-l1_computed;
for i=1:length(r)
   R(i)= r(i)^2;
end
RMSE_control=sqrt(sum(R))/(length(Z)-1);
min_control_error=min(abs(r));
max_control_error=max(abs(r));
%TSA variance analysis-------------------------------------
% mean_Z=mean(Z);
% temp1=l1_observed-mean_Z;
% temp2=l1_computed-mean_Z;
% SSt=sum(temp1.^2);
% SSr=sum(temp2.^2);
% R2=SSr/SSt;
%Compute RMSE For Check points-------------------------------------
if Check_Points==1
    RMSE_Check='Not defined';
    max_check_error='Not defined';
    min_check_error='Not defined';
else
X=Check_Points(:,2);
Y=Check_Points(:,3);
Z=Check_Points(:,4);
A=[];
for i=1:length(X)
    if(i==1)
       A=[1 X(i) Y(i) X(i)^2 X(i)*Y(i) Y(i)^2 X(i)^3 X(i)^2*Y(i) Y(i)^2*X(i) Y(i)^3 X(i)^4 X(i)^3*Y(i)...
           X(i)^2*Y(i)^2 X(i)*Y(i)^3 Y(i)^4 X(i)^5 X(i)^4*Y(i) X(i)^3*Y(i)^2 X(i)^2*Y(i)^3 X(i)*Y(i)^4 Y(i)^5];
    end
    if(i>1)
       B=[1 X(i) Y(i) X(i)^2 X(i)*Y(i) Y(i)^2 X(i)^3 X(i)^2*Y(i) Y(i)^2*X(i) Y(i)^3 X(i)^4 X(i)^3*Y(i)...
           X(i)^2*Y(i)^2 X(i)*Y(i)^3 Y(i)^4 X(i)^5 X(i)^4*Y(i) X(i)^3*Y(i)^2 X(i)^2*Y(i)^3 X(i)*Y(i)^4 Y(i)^5];
       A=[A;B];
    end
end
switch Degree
    case 1
        A=A(:,1:3);
    case 2
        A=A(:,1:6);
    case 3
        A=A(:,1:10);
    case 4 
        A=A(:,1:15);
    case 5
        A=A;
end
l1_computed=A*Parameters;
l1_observed=Z;
%r is rasidual vector
r=l1_observed-l1_computed;
R=[];
for i=1:length(r)
   R(i)= r(i)^2;
end
RMSE_Check=sqrt(sum(R))/(length(Z)-1);
min_check_error=min(abs(r));
max_check_error=max(abs(r));
end
%Compute coordinates of unknown points-------------------------------------
A=[];
       A=[1 x y x^2 x*y y^2 x^3 x^2*y y^2*x y^3 x^4 x^3*y...
           x^2*y^2 x*y^3 y^4 x^5 x^4*y x^3*y^2 x^2*y^3 x*y^4 y^5];
 switch Degree
    case 1
        A=A(:,1:3);
    case 2
        A=A(:,1:6);
    case 3
        A=A(:,1:10);
    case 4 
        A=A(:,1:15);
    case 5
        A=A;
 end
 z=A*Parameters;