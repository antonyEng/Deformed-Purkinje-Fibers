load N.txt % nodes of heart ventricles
load Nd.txt  % nodes of deformed heart ventricles
load purk.txt  % nodes of purkinji befor deformation 

n(1,1)=size(N,1) ;
n(1,2)=size(purk,1);
Tpurk =zeros(n(1,2),2); % Tpurk is the matrix where the first column is for the order purkinji and second column for the order of ventricle node 
% Tpurk is just for check it will not used during the calculation

dpurk=zeros(n(1,2),4);

for i=1:n(1,2);
    dpurk(i,1)=i;
end

v=zeros(n(1,1),1);

for i=1:n(1,2);
    % take one of purkinji nodes and check the nerest point to ventricles
    for j=1:n(1,1);
        
    v(j,1) = ((purk(i,2)-N(j,2))^2 + (purk(i,3)-N(j,3))^2 +(purk(i,4)-N(j,4))^2 )^(1/2) ;
    
    if j==n(1,1);
        
       vx=min(v(:,1)) ;
        
       s =find(v==vx) ;
       Tpurk(i,1)=i ;
       Tpurk(i,2)=s;
       
      %after identifiying the nearest point from nodes of ventricles to certain  purkinji  node , 
       
       dpurk(i,2)=purk(i,2)+Nd(s,2)-N(s,2);
       dpurk(i,3)=purk(i,3)+Nd(s,3)-N(s,3);
       dpurk(i,4)=purk(i,4)+Nd(s,4)-N(s,4);
       
    end
    
    end
end
save dpurk.txt dpurk -ascii







