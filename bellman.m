G = [ inf 7 9 inf inf 14;
      7 inf 10 15 inf inf;
      9 10 inf 11 inf 2;
      inf inf 11 inf 6 inf;
      inf inf inf 6 inf 9;
      14 inf 2 inf 9 inf; ];
s = 1;
dist  = bellmanAl(G , s)

function dist = bellmanAl(G,s)
%% Initialization  
    node_num = size(G,2);
    link_num = 0;
    dist = inf * ones(1,node_num); % the initial distances of all nodes are inf ;
    dist(s) = 0; % distance from source to source;
 
    %% denote the link with an array 'edge' rather than a node pairs, thus increasing efficiency.
    edge = [];
    for i = 1 : node_num    
        for j = 1 : node_num
            if G(i, j) ~= inf
                link_num = link_num + 1;
                edge = [edge, [i, j, G(i, j)]];
            end
        end
    end
    edge = (reshape(edge, 3, []))';
   %% relaxation operation
    for v = 1: node_num - 1
        for e = 1 : link_num
            if dist(edge(e,2)) > dist(edge(e,1)) + edge(e,3)
                dist(edge(e,2)) = dist(edge(e,1)) + edge(e,3);
            end
        end
    end
end