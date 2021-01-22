function path = lightningPath(rayo, dim)
    %Credits to Alfonso Nieto-Castanon who answered a 2015 matlab post with
    %this code
    if dim==2
        BW = rayo;
        point = find(rayo(:,1)==1);
        puntosX = length(rayo(:,1));
        puntosY = length(rayo(1,:)); 
        i1 = [point, 1];           % coordinates of initial point
        i2 = [puntosX/2, puntosY];          % coordinates of end point
        n = max(abs(i2-i1))+1;     % number of steps
        i = arrayfun(@(a,b)round(linspace(a,b,n)),i1,i2,'uni',0);
        idx = sub2ind(size(BW),i{:});
        sumBW = nnz(BW(idx));
        disp(cell2mat(i'));        % display trajectory
        disp(sumBW);      
    end
    



end