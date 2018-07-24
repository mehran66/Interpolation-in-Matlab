function b=phee(p1,p2,points1,points2)
x1=points1(p1,2);
y1=points1(p1,3);
x2=points2(p2,2);
y2=points2(p2,3);
r=sqrt((x1-x2)^2+(y1-y2)^2);
if r==0
    b=8*pi;
else
b=(r^2)*log(r);
end

