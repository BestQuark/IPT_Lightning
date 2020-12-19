drawnow
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
if t == 1
    imwrite(imind,cm,"rayoNuevo.gif",'gif', 'Loopcount',inf);
elseif rem(t,10)==0
    imwrite(imind,cm,"rayoNuevo.gif",'gif','DelayTime',0.01,'WriteMode','append');
end
