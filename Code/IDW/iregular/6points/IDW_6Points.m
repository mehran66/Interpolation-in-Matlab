function z=IDW_6Points(x,y,Control_Points,method)
dt=DelaunayTri(Control_Points(:,2),Control_Points(:,3));
Table(:,2:4)=dt.Triangulation;
[row col]=size(dt.Triangulation);
Table(:,1)=1:row;
DataStructure=DataStructure_Fnc(Table);
Triangle=Walking_Fnc(x,y,DataStructure,Control_Points);
if Triangle==0
    msgbox('Please Enter coordinates in the range','Out of range');
    z='Not computed';
else
Ed1=Table(Triangle,2);Ed2=Table(Triangle,3);Ed3=Table(Triangle,4);
linear=-1;
for ii=1:3
    temp1=DataStructure(Triangle,ii+1);
    temp2=DataStructure(Triangle,ii+4);
    if temp2==-1;
        linear=1;
        break;
    end
    temp3=find(DataStructure(temp2,5:7)==Triangle);
    if temp3==1
        temp4(ii)=DataStructure(temp2,temp3+1);
    elseif temp3==2
        temp4(ii)=DataStructure(temp2,temp3+1);
    elseif temp3==3
        temp4(ii)=DataStructure(temp2,temp3+1);
    end
end
if linear==-1
    Ed4=temp4(1);Ed5=temp4(2);Ed6=temp4(3);
    points=[Control_Points(Ed1,2),Control_Points(Ed1,3);...
           Control_Points(Ed2,2),Control_Points(Ed2,3);...
           Control_Points(Ed3,2),Control_Points(Ed3,3);...
           Control_Points(Ed4,2),Control_Points(Ed4,3);...
           Control_Points(Ed5,2),Control_Points(Ed5,3);...
           Control_Points(Ed6,2),Control_Points(Ed6,3)];
    Z=[Control_Points(Ed1,4),Control_Points(Ed2,4),Control_Points(Ed3,4)...
       Control_Points(Ed4,4),Control_Points(Ed5,4),Control_Points(Ed6,4)];
    Dist=Distance(x,y,points);
    if Dist(1)==0
        z=Z(1);
    elseif Dist(2)==0
        z=Z(2);
    elseif Dist(3)==0
        z=Z(3);
    elseif Dist(4)==0
        z=Z(4);
    elseif Dist(5)==0
        z=Z(5);
    elseif Dist(6)==0
        z=Z(6);
    end
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
    
    z=(Weight*Z')/sum(Weight);
else
    z=IDW_3Points(x,y,Control_Points,method);
end
end