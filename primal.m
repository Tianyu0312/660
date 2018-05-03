A=[];
C=[];
for i=1:size(G,1)
    for j=1:size(G,2)        
        if G(i,j)~=inf
            temp=zeros(size(G,1),1);
            temp(i,1)=1;
            temp(j,1)=-1;
             A=[A,temp];
             C=[C;G(i,j)];
        end
    end
end
n=size(C,1);
b=zeros(size(G,1), size(G, 1));
t=cputime;
for i=1:size(G, 1)
    b(1,i)=1;
    b(i,i)=-1;
cvx_begin quiet
variables x(n) 
minimize (transpose(C)*x)
subject to 
           A*x==b(:,i);
           x>=0;
cvx_end
end
e=cputime-t;
%b(1)=1;
%b(t)=-1;
% n=size(C,1);
% cvx_begin
% variables x(n) 
% minimize (transpose(C)*x)
% subject to 
%            A*x==b;
%            x>0;
% cvx_end
%disp(x)


            