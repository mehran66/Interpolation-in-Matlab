function DistanceMat=DistanceMat_Fnc(Points,x,y)
[row col]=size(Points);
DistanceMat=zeros(row,row+1);
for ii=1:row-1
    for jj=ii+1:row
       DistanceMat(ii,jj)=sqrt((Points(ii,2)-Points(jj,2))^2+(Points(ii,3)-Points(jj,3))^2);
    end
     DistanceMat(ii,row+1)=sqrt((Points(ii,2)-x)^2+(Points(ii,3)-y)^2);
end
DistanceMat(row,row+1)=sqrt((Points(row,2)-x)^2+(Points(row,3)-y)^2);

