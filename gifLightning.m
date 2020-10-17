function plotRayo = gifLightning(Rayos,nRayos,paso,tocaPiso,h)
%creates gif of lightning
clf
plotRayo = figure(1);
set(gca,'Color','black')
axis([-30 30 0 h])
filename = 'rayo.gif';
for n = 1:paso-1
    hold on
    for j=1:nRayos
            plot(Rayos(j).ray(1,1:n-1),Rayos(j).ray(2,1:n-1),'blue','LineWidth',2)    
    end
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if n == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','DelayTime',0.05,'WriteMode','append');
    end
end

% flash
set(gca,'Color','white')
drawnow
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif','DelayTime',0.1,'WriteMode','append');

% lightning strike
set(gca,'Color','black')
plot(Rayos(tocaPiso).ray(1,1:paso),Rayos(tocaPiso).ray(2,1:paso),'white','LineWidth',4) ;

hold off

drawnow
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif','DelayTime',0.4,'WriteMode','append');

end

