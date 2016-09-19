function [] = plotLine(start,target,c)
global color scoutDis;
%     start
%     target
    line([start(1,1),target(1,1)],[start(1,2),target(1,2)],'Color',color(c,:))
%     plotCircle(start(1,1),start(1,2),scoutDis);
end

