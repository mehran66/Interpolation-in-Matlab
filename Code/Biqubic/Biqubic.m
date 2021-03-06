function Za=Biqubic(xa,ya,grid)
[row,col]=size(grid);
max_x=max(grid(:,2));
max_y=max(grid(:,3));
min_x=min(grid(:,2));
min_y=min(grid(:,3));
if xa>max_x | xa<min_x | ya>max_y | ya<min_y
    msgbox('Please Enter coordinates in the range','Out of range');
    Za='Not computed';
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
    k=1;
    for i=(dy-3):dy
        Y(k)=y+(i*pixel_size);
        L=1;
        for j=(dx-3):dx
            A1(L,1:4)=[1,(x+(j*pixel_size)),(x+(j*pixel_size))^2,(x+(j*pixel_size))^3];
            for m=1:row
                if grid(m,2)==(x+(j*pixel_size)) && grid(m,3)==Y(k)
                    z1(L,1)=grid(m,4);
                    break;
                end
            end
            L=L+1;
        end
        X1(:,k)=inv(A1'*A1)*A1'*z1;
        k=k+1;
    end
    z2=[1,xa,xa^2,xa^3]*X1;
    A2=[1,Y(1),Y(1)^2,Y(1)^3;1,Y(2),Y(2)^2,Y(2)^3;1,Y(3),Y(3)^2,Y(3)^3;1,Y(4),Y(4)^2,Y(4)^3];
    X2=inv(A2'*A2)*A2'*z2';
    Za=[1,ya,ya^2,ya^3]*X2;            
end