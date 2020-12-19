function plotRayo = plotLightning(Rayos,nRayos,paso,tocaPiso)
%plots lightning
clf
plotRayo = figure(1);
set(gca,'Color','black')
hold on
for j=1:nRayos
    if j~=tocaPiso
        plot(Rayos(j).ray(1,1:paso-1),Rayos(j).ray(2,1:paso-1),'blue','LineWidth',2)    
    end
end
plot(Rayos(tocaPiso).ray(1,1:paso),Rayos(tocaPiso).ray(2,1:paso),'white','LineWidth',4)    

hold off
end

