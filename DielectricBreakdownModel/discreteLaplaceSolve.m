function latticeV = discreteLaplaceSolve(latticeV,dim)
%Esta función soluciona la ecuacion de Laplace discreta
%
tol = 1d-2;
error = 1;
newLatticeV = latticeV;
%Resuelve para dimension 2
    if dim==2
        puntosX = length(latticeV(:,1));
        puntosY = length(latticeV(1,:)); 
        voltMax = latticeV(puntosX,puntosY);
        while (error > tol)
            for i=2:puntosX-1
                for j=2:puntosY-1
                    if latticeV(i,j)~=voltMax
                        if i==2
                            newLatticeV(i,j) = 0.25*(latticeV(i+1,j)+latticeV(i,j+1)+latticeV(i+1,j)+latticeV(i,j-1));
                            newLatticeV(i-1,j) = latticeV(i+1,j);
                        elseif i==puntosX-1
                            newLatticeV(i,j) = 0.25*(latticeV(i-1,j)+latticeV(i,j+1)+latticeV(i-1,j)+latticeV(i,j-1));
                            newLatticeV(i+1,j) = latticeV(i-1,j);
                        else
                            newLatticeV(i,j) = 0.25*(latticeV(i+1,j)+latticeV(i,j+1)+latticeV(i-1,j)+latticeV(i,j-1));
                        end
                    end                                                       
                end
            end
            error = sqrt(sum(sum(newLatticeV - latticeV).^2));
            latticeV = newLatticeV;
        end
        
%Resuelve para dimension 3        
    elseif dim==3
        puntosX = length(latticeV(:,1,1));
        puntosY = length(latticeV(1,:,1));
        puntosZ = length(latticeV(1,1,:));        
    else
        fprintf("# de dimensiones invalido")
    end
    
end

