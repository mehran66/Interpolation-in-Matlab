function Semivariances=Semivariances_Fnc(DistanceMat)
[row col]=size(DistanceMat);
Semivariances=zeros(row,row+1);
for ii=1:row-1
    for jj=ii+1:row
       Semivariances(ii,jj)=0.4*DistanceMat(ii,jj);
    end
     Semivariances(ii,row+1)=0.4*DistanceMat(ii,row+1);
end
Semivariances(row,row+1)=0.4*DistanceMat(row,row+1);