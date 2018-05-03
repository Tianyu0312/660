G=inf(10000,10000);
i1=(1:1:10000^2-1)';
N=size(G,1); %200
for index=1:N-1    %1-199 
    num=ceil((N-index)/2); %pick how many numbers eg. index=1 pick num=100
    randnums=index+(randperm((N-index),num)); 
    if randnums(end)~=10000
       randnums=[randnums,10000];
    end
    numbers=sort(randnums,'ascend'); 
    pathlen=randi(200,[num,1]); %1 col
    for kkk=1:num
       G(index,numbers(kkk))=pathlen(kkk);
       G(numbers(kkk),index)=pathlen(kkk);
    end
end
save('input10000','G')