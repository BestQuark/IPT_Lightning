function latticeV = discreteLaplaceSolve(latticeV,dim)
%Esta función soluciona la ecuacion de Laplace discreta
%
error = 1;
newLatticeV = latticeV;
%Resuelve para dimension 2
    if dim==2
        tol = 1d-2;
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
        tol = 1d-4;
        puntosX = length(latticeV(:,1,1));
        puntosY = length(latticeV(1,:,1));
        puntosZ = length(latticeV(1,1,:));
        voltMax = latticeV(puntosX,puntosY,puntosZ);
        while (error > tol)
            for i=2:puntosX-1
                for j=2:puntosY-1
                    for k=2:puntosZ-1
                        if latticeV(i,j,k)~=voltMax
                            if i==2
                                newLatticeV(i,j,k) = 0.16*(latticeV(i+1,j,k)+latticeV(i,j+1,k)+latticeV(i+1,j,k)+latticeV(i,j-1,k)+latticeV(i,j,k+1)+latticeV(i,j,k-1));
                                newLatticeV(i-1,j,k) = latticeV(i+1,j,k);
                            elseif i==puntosX-1
                                newLatticeV(i,j,k) = 0.16*(latticeV(i-1,j,k)+latticeV(i,j+1,k)+latticeV(i-1,j,k)+latticeV(i,j-1,k)+latticeV(i,j,k+1)+latticeV(i,j,k-1));
                                newLatticeV(i+1,j,k) = latticeV(i-1,j,k);
                            elseif j==2
                                newLatticeV(i,j,k) = 0.16*(latticeV(i+1,j,k)+latticeV(i,j+1,k)+latticeV(i-1,j,k)+latticeV(i,j+1,k)+latticeV(i,j,k+1)+latticeV(i,j,k-1));
                                newLatticeV(i,j-1,k) = latticeV(i,j+1,k);
                            elseif j==puntosY-1
                                newLatticeV(i,j,k) = 0.16*(latticeV(i+1,j,k)+latticeV(i,j-1,k)+latticeV(i-1,j,k)+latticeV(i,j-1,k)+latticeV(i,j,k+1)+latticeV(i,j,k-1));
                                newLatticeV(i,j+1,k) = latticeV(i,j-1,k);
                            else
                                newLatticeV(i,j,k) = 0.16*(latticeV(i+1,j,k)+latticeV(i,j+1,k)+latticeV(i-1,j,k)+latticeV(i,j-1,k)+latticeV(i,j,k+1)+latticeV(i,j,k-1));
                            end
                        end  
                    end
                end
            end
            error = sqrt(sum(sum(sum(newLatticeV - latticeV)).^2));
            latticeV = newLatticeV;
        end
    else
        fprintf("# de dimensiones invalido")
    end
    
end

