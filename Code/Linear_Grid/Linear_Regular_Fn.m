function Za=Linear_Regular_Fn(xx,yy,grid)
[row,col]=size(grid);
max_x=max(grid(:,2));
max_y=max(grid(:,3));
min_x=min(grid(:,2));
min_y=min(grid(:,3));
if xx>=max_x | xx<=min_x | yy>=max_y | yy<=min_y
    msgbox('Please Enter coordinates in the range','Out of range');
    Za='Not computed';
else
%determining pixel size
if grid(1,2)==grid(2,2)
pixel_size=grid(2,3)-grid(1,3);
elseif grid(1,3)==grid(2,3)
pixel_size=grid(2,2)-grid(1,2);
end
coor_r=(ceil(xx/pixel_size))*pixel_size;
coor_c=floor(yy/pixel_size)*pixel_size;
row1=ceil(xx/pixel_size)+1;
col1=floor(yy/pixel_size)+1;
for ii=1:row
    tempx=grid(ii,2)/pixel_size;
    tempy=grid(ii,3)/pixel_size;
    Mat(tempx+1,tempy+1)=grid(ii,4);
    counter(tempx+1,tempy+1)=grid(ii,1);
end

if rem(xx,pixel_size)==0 & rem(yy,pixel_size)==0
    Za=Mat(row1,col1);

else
width= grid(counter(end,1),2)-grid(counter(1,1),2);   
xx1=yy;
yy1=width-xx;
coor_r1=coor_c;
coor_c1=width-coor_r;
X_bar=(xx1-coor_r1)/pixel_size;
Y_bar=(yy1-coor_c1)/pixel_size;
if X_bar<=Y_bar
    delta=1;
else
    delta=0;
end
row2=row1-1;col2=col1;
row3=row1-1;col3=col1+1;
row4=row1;col4=col1+1;
Z1=Mat(row1,col1);
Z2=Mat(row2,col2);
Z3=Mat(row3,col3);
Z4=Mat(row4,col4);
Za=delta*(Z1+(Z3-Z2)*X_bar+(Z2-Z1)*Y_bar)+(1-delta)*(Z1+(Z4-Z1)*X_bar+(Z3-Z4)*Y_bar);
end
end