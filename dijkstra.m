G = [ inf 7 9 inf inf 14;
      7 inf 10 15 inf inf;
      9 10 inf 11 inf 2;
      inf inf 11 inf 6 inf;
      inf inf inf 6 inf 9;
      14 inf 2 inf 9 inf; ];
s = 1;
dist  = dijkstraAl(G , s)

function dist = dijkstraAl(G , s)
% the initial distance are infinity for all nodes
dist = Inf(1, size(G, 2));
dist(s) = 0;
prev = [];
temp = dist;
u = s;

% loop through all nodes in given graph
while(size(prev , 2) < size(G, 2))
    for v = 1 : size(G, 2)
        if dist(u) + G(u , v) < dist(v)
            % update the minimum cost to v
            dist(v) = dist(u) + G(u , v);
        end
    end
    % add u to the visited list of nodes
    prev = [prev , u];
    temp = dist;
    
    temp(prev) = inf;
    b = Inf(1 , size(G, 2));
    b(1 , G(u , :) ~= inf) = 1;  % b record the nodes which connect with the current node;
    temp = b .* temp; % temp record distances of all unvisited nodes, which are also the neighbor of the current node;
    u = find(temp == min(temp)); % find the one with minimum distance  as the next node ;
end
end
