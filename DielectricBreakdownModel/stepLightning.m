function latticeRay = stepLightning(latticeV, dim)
d = 0.1;
eta = 2;
latticeRay = latticeV;
%Resuelve para dimension 2
    if dim==2
        %Busca que puntos pueden ser nuevos
        puntosX = length(latticeV(:,1));
        puntosY = length(latticeV(1,:)); 
        voltMax = latticeV(puntosX,puntosY);
        puntosMax = (latticeV==voltMax);
        posibleBreak = zeros(puntosX,puntosY);
        for i=2:puntosX-1
            for j=2:puntosY-1
                if puntosMax(i,j)==1 
                    if puntosMax(i+1,j)==0
                        posibleBreak(i+1,j)=abs((latticeV(i,j)-latticeV(i+1,j)))/d ;
                    end
                    if puntosMax(i-1,j)==0
                        posibleBreak(i-1,j)=abs((latticeV(i,j)-latticeV(i-1,j)))/d;
                    end
                    if puntosMax(i,j+1)==0
                        posibleBreak(i,j+1)=abs((latticeV(i,j)-latticeV(i,j+1)))/d;
                    end
                    if puntosMax(i,j-1)==0
                        posibleBreak(i,j-1)=abs((latticeV(i,j)-latticeV(i,j-1)))/d;
                    end
                    if puntosMax(i-1,j-1)==0
                        posibleBreak(i-1,j-1)=abs((latticeV(i,j)-latticeV(i-1,j-1)))/d;
                    end
                    if puntosMax(i+1,j-1)==0
                        posibleBreak(i+1,j-1)=abs((latticeV(i,j)-latticeV(i+1,j-1)))/d;
                    end
                    if puntosMax(i-1,j+1)==0
                        posibleBreak(i-1,j+1)=abs((latticeV(i,j)-latticeV(i-1,j-1)))/d;
                    end
                    if puntosMax(i+1,j+1)==0
                        posibleBreak(i+1,j+1)=abs((latticeV(i,j)-latticeV(i+1,j+1)))/d;
                    end
                end
            end
        end
        
        %Haya probabilidades
        posibleBreak = posibleBreak.^eta;
        posibleBreak = posibleBreak/sum(sum(posibleBreak));

        weigths = posibleBreak(:);
        nuevoP = randsample(puntosX*puntosY,1,true,weigths);
        latticeRay(rem(nuevoP,puntosX), fix(nuevoP/puntosX)+1) = voltMax;
        
        
%Resuelve para dimension 3        
    elseif dim==3
        puntosX = length(latticeV(:,1,1));
        puntosY = length(latticeV(1,:,1));
        puntosZ = length(latticeV(1,1,:));        
    else
        fprintf("# de dimensiones invalido")
    end

end