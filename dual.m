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
n=size(G,1);
b=zeros(size(G,1), size(G, 1));
t=cputime;
for t=1:size(G,1)-1
cvx_begin quiet
variables lambda(n)
maximize lambda(t)-lambda(1)
subject to
           transpose(A)*lambda+C>=0;
cvx_end
end
e=cputime-t;         