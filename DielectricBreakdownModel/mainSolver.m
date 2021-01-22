VoltajeMax = 1;

%Rayo dim 2
dim = 2;
n_grid = 150;
lattice = zeros(n_grid,n_grid);
lattice(:,n_grid) = VoltajeMax*ones(1,n_grid);
lattice(n_grid/2,n_grid-1) = VoltajeMax;
t = 0;


%Rayo dim 3
% dim = 3;
% n_grid = 80;
% lattice = zeros(n_grid,n_grid,n_grid);
% lattice(:,:,n_grid) = VoltajeMax*ones(n_grid,n_grid);
% lattice(n_grid/2,n_grid/2,n_grid-1) = VoltajeMax;
% t = 0;

if dim==2
    while(sum(lattice(:,1))==0) 
        t = t + 1;
        lattice = discreteLaplaceSolve(lattice,dim);
        lattice = stepLightning(lattice,dim); 
        rayo = (lattice==VoltajeMax);
        figure(1)
        I = mat2gray(rot90(rayo));
        imshow(I, 'InitialMagnification', 800)
        
%         figure(2)
%         path = lightning(rayo);
%         IPath = mat2gray(rot90(path));
%         imshow(IPath, 'InitialMagnification', 800)
%         %Gif del Rayo
%         GifRay
    end

    
elseif dim==3
    lattice = discreteLaplaceSolve(lattice,dim);
  % surf(squeeze(lattice(:,n_grid/2,:)))
    while(sum(sum(lattice(:,:,1)))==0 && t <1000) 
        t = t + 1;
        disp(t);
        lattice = discreteLaplaceSolve(lattice,dim);
        lattice = stepLightning(lattice,dim); 
    end 
    rayo = (lattice==VoltajeMax);
    
    puntos=sum(sum(sum(rayo(:,:,1:end-1))));
    x = zeros(1,puntos);
    y = zeros(1,puntos);
    z = zeros(1,puntos);
    Ncuadros = 0;
    for i=1:n_grid
        for j=1:n_grid
            for k=1:n_grid-1
                if rayo(i,j,k)==1
                    Ncuadros = Ncuadros+1;
                    x(Ncuadros)=i;y(Ncuadros)=j;z(Ncuadros)=k;
                end
            end
        end
    end
    scatter3(x,y,z,30,'yellow','s', 'filled')
    set(gca,'XLim',[0 n_grid],'YLim',[0 n_grid],'ZLim',[0 n_grid])
    set(gca,'color','black') 
%    set(gcf,'color','black')
end





