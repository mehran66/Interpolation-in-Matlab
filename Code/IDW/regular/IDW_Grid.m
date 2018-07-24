function z=IDW_Grid(xa,ya,grid,method)
[row,col]=size(grid);
method=method-1;
max_x=max(grid(:,2));
max_y=max(grid(:,3));
min_x=min(grid(:,2));
min_y=min(grid(:,3));
if xa>max_x | xa<min_x | ya>max_y | ya<min_y
    msgbox('Please Enter coordinates in the range','Out of range');
    z='Not computed';
else
    %determining pixel size
    if grid(1,2)==grid(2,2)
        pixel_size=grid(2,3)-grid(1,3);
    elseif grid(1,3)==grid(2,3)
        pixel_size=grid(2,2)-grid(1,2);
    end
    %determining left bottom corner of squar surrounding point
    x=(floor((xa-min_x)/pixel_size))*pixel_size;
    y=(floor((ya-min_y)/pixel_size))*pixel_size;
    %selecting 16 points
    if x+(2*pixel_size)<=max_x && x+((-1)*pixel_size)>=min_x && y+(2*pixel_size)<=max_y && y+((-1)*pixel_size)>=min_y
        dx=2;dy=2;
    else
        if x+(1*pixel_size)<=max_x && x+((-2)*pixel_size)>=min_x && y+(3*pixel_size)<=max_y 
            dx=1;dy=3;
        else
            if  x+(1*pixel_size)<=max_x && x+((-2)*pixel_size)>=min_x && y+(1*pixel_size)<=max_y && y+((-2)*pixel_size)>=min_y
                dx=1;dy=1;
            else
                if  x+(3*pixel_size)<=max_x && y+(1*pixel_size)<=max_y && y+((-2)*pixel_size)>=min_y
                    dx=3;dy=1;
                else
                    if  x+(3*pixel_size)<=max_x && y+(3*pixel_size)<=max_y 
                        dx=3;dy=3;
                    end
                end
            end
        end
    end
    L=1;
    for i=(dy-3):dy
        for j=(dx-3):dx
            points(L,1:2)=[x+(j*pixel_size),y+(i*pixel_size)];
            for m=1:row
                if grid(m,2)==(x+(j*pixel_size)) && grid(m,3)==y+(i*pixel_size)
                    points(L,3)=grid(m,4);
                    break;
                end
            end
            L=L+1;
        end
    end
    points_XY=points(:,1:2);
    Z=points(:,3);
    Dist=Distance(xa,ya,points_XY);
    temp=1;
    for ii=1:length(Dist)
        if Dist(ii)==0
            z=Z(ii);
            temp=-1;
            break;
        end
    end
    if temp==1
    switch method 
        case 1
            Weight=Dist.*0+1;
        case 2
            Weight=1./Dist;
        case 3
            Weight=1./Dist.^2;
        case 4
            Weight=1./Dist.^3;
        case 5
            Weight=1./(1+Dist);
        case 6
            Weight=1./(1+Dist.^2);
        case 7
            Weight=exp(-Dist);
        case 8
            Weight=exp(-Dist.^2);
    end
    
    z=(Weight*Z)/sum(Weight);
    end
end