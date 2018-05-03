t = cputime;
s = 1;

dist  = bellmanAl(G , s);
e = cputime-t;

function dist = bellmanAl(G,s)
%% Initialization  
    node_num = size(G,2); %6
    link_num = 0;
    dist = inf * ones(1,node_num); % the initial distances of all nodes are inf ; [inf inf inf inf inf inf]
    dist(s) = 0; % distance from source to source;  [0 inf inf inf inf inf]
 
    %% denote the link with an array 'edge' rather than a node pairs, thus increasing efficiency.
    G(G==inf)=0;
    [row,col,value]=find(G');    
    edge=[col,row,value]
    link_num=numel(value);
    %edge = (reshape(edge, 3, []))'; %[1,2,7;1,3,9;1,6,14;2,1,7.......] size=17X3 
   %% relaxation operation
    %for v = 1: node_num - 1 %1-5
        for e = 1 : link_num  %1-17 link_num=# of paths!=inf
            if dist(edge(e,2)) > dist(edge(e,1)) + edge(e,3) 
                dist(edge(e,2)) = dist(edge(e,1)) + edge(e,3);
            end
        end
    %end
end