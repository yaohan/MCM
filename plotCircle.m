function [] = plotCircle(x1,y1,r)
    alpha = 0:pi/40:2*pi;
    x=r*cos(alpha);
    y=r*sin(alpha);
    plot(x+x1,y+y1,'g-');
%     fill(x+x1,y+y1,'g','edgealpha',0)
end

