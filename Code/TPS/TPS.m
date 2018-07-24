function [Za,RMSE_control,max_error_control,min_error_control,RMSE_check,max_error_check,min_error_check]=TPS(xx,yy,grid,check)
[row,col]=size(grid);
for t=1:row
    for m=t:row
            C(t,m)=phee(t,m,grid,grid);
            C(m,t)=C(t,m);
    end
end
F(:,2:3)=grid(:,2:3);
F(:,1)=[1];
Z(:,1)=grid(:,4);
Z=[Z;0;0;0];
z0=zeros(3);
A=[C F;F' z0];
X=inv(A'*A)*(A'*Z);
%computing height of an arbitrary point
a=[1,xx,yy];
for i=1:row
   Ca(1,i)=phee(i,1,grid,a);
end
Ca(1,row+1:row+3)=[1,a(1,2),a(1,3)];
Za=Ca*X;
%computing height of control points
for i=1:row
    for j=1:row
        C_control(1,j)=phee(i,j,grid,grid);
    end
    C_control(1,row+1:row+3)=[1,grid(i,2),grid(i,3)];
    Z_control(i,1)=C_control*X;
end
r=grid(:,4)-Z_control;
%computing RMSE for control points
RMSE_control=sqrt((sum(r.^2)))/(row-1);
%computing max and min error
max_error_control=max(abs(r));
min_error_control=min(abs(r));
%computing RMSE for check points
if check==1
    RMSE_check='Not defined';
    max_error_check='Not defined';
    min_error_check='Not defined';
else
    [rowch colch]=size(check);
    for i=1:rowch
      for j=1:row
        C_check(1,j)=phee(i,j,check,grid);
      end
      C_check(1,row+1:row+3)=[1,check(i,2),check(i,3)];
      Z_check(i,1)=C_check*X;
    end
    rc=check(:,4)-Z_check;
    RMSE_check=sqrt((sum(rc.^2)))/(rowch-1);
    max_error_check=max(abs(rc));
    min_error_check=min(abs(rc));
end


    
        