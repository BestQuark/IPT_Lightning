
dim = 2;
n_grid = 150;
lattice = zeros(n_grid,n_grid);
lattice(:,n_grid) = ones(1,n_grid);
lattice(n_grid/2,n_grid-1) = 1;
t = 0;
figure
puntosX = length(lattice(:,1));
puntosY = length(lattice(1,:)); 
voltMax = lattice(puntosX,puntosY);

while(sum(lattice(:,1))==0) 
    t = t + 1;
    lattice = discreteLaplaceSolve(lattice,dim);
    lattice = stepLightning(lattice,dim); 
 %  plotRay(lattice,dim)
    rayo = (lattice==voltMax);
    figure(1)
    I = mat2gray(rot90(rayo));
    imshow(I, 'InitialMagnification', 800)
    
    
    %Gif del Rayo
    GifRay
end




