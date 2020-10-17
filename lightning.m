
%this code simulates a lightning starting at a position (0,h) and hits the
%ground

%%PARAMETERS

%h is the height and n the max number of steps 
h = 30;
n = 50;

%bifurcation sigma
bifurSigma = 0.01;

%alet sigma
aleatSigma = 0.22;

%%----------------------------------------
directions = zeros(1,n);
ray = zeros(2,n);
ray(2,1) = h;
Rayos(1).directions = directions;
Rayos(1).ray = ray;
nRayos = 1;
tocaPiso =0; paso=-1;
for i=2:n
    if tocaPiso==0
        rayosAct = nRayos;
        for j=1:rayosAct
            %Probability of bifurcation?? como deberia ser?
            if rand<0.5/nRayos
                p=normrnd(0,bifurSigma);
                nRayos = nRayos+1;
                Rayos(nRayos).directions = Rayos(j).directions; 
                Rayos(nRayos).directions(i) = Rayos(nRayos).directions(i-1)-p;  
                Rayos(nRayos).ray = Rayos(j).ray;             
                Rayos(nRayos).ray(:,i)=[sin(Rayos(nRayos).directions(i)) ; -cos(Rayos(nRayos).directions(i))]+Rayos(nRayos).ray(:,i-1);            
                Rayos(j).directions(i) = Rayos(j).directions(i-1)+p;
                Rayos(j).ray(:,i)=[sin(Rayos(j).directions(i)) ; -cos(Rayos(j).directions(i))]+Rayos(j).ray(:,i-1);
            else
                Rayos(j).directions(i)= Rayos(j).directions(i-1) + normrnd(0,aleatSigma);
                Rayos(j).ray(:,i)=[sin(Rayos(j).directions(i)) ; -cos(Rayos(j).directions(i))]+Rayos(j).ray(:,i-1);
            end
            if Rayos(j).ray(2,i)<=0
                tocaPiso=j;  
                paso=i;
                break
            end
        end
    end
end
plotLightning(Rayos,nRayos,paso,tocaPiso);
gifLightning(Rayos,nRayos,paso,tocaPiso,h);
clear
