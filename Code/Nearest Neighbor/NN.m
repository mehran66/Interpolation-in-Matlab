function Za=NN(xx,yy,grid)
[row,col]=size(grid);
max_x=max(grid(:,2));
max_y=max(grid(:,3));
min_x=min(grid(:,2));
min_y=min(grid(:,3));
if xx>max_x | xx<min_x | yy>max_y | yy<min_y
    msgbox('Please Enter coordinates in the range','Out of range');
    Za='Not computed'
else
%determining pixel size
if grid(1,2)==grid(2,2)
pixel_size=grid(2,3)-grid(1,3);
elseif grid(1,3)==grid(2,3)
pixel_size=grid(2,2)-grid(1,2);
end
coor_r=(floor((xx-min_x)/pixel_size))*pixel_size;
coor_c=(floor((yy-min_y)/pixel_size))*pixel_size;
d1=dist(xx,yy,coor_r,coor_c);
neighbor(1,1:3)=[coor_r,coor_c,d1];
d2=dist(xx,yy,coor_r+pixel_size,coor_c);
neighbor(2,1:3)=[coor_r+pixel_size,coor_c,d2];
d3=dist(xx,yy,coor_r+pixel_size,coor_c+pixel_size);
neighbor(3,1:3)=[coor_r+pixel_size,coor_c+pixel_size,d3];
d4=dist(xx,yy,coor_r,coor_c+pixel_size);
neighbor(4,1:3)=[coor_r,coor_c+pixel_size,d4];
neighbor=sortrows(neighbor,3);
for j=1:row
    if grid(j,2)==neighbor(1,1) && grid(j,3)==neighbor(1,2)
        Za=grid(j,4);
        break;
    end
end
end


