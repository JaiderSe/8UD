t=0:0.1:pi;
y1=sin(t);
for i=1:length(y1)
    plot(y1(i),'o',LineWidth=4)
    axis([0,pi,0,1])
    pause(0.1)
    drawnow();
end