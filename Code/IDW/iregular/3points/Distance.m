function Dist=Distance(x1,y1,points)
[row,col]=size(points);
for ii=1:row
    Dist(ii)=sqrt((x1-points(ii,1))^2+(y1-points(ii,2))^2);
end