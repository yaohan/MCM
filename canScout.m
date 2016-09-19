function [] = canScout(now,before)
global target scoutDis;
for i=1:length(target)
    dis = norm(now-target(i,:),2);
    x1 = now(1,1);
    x2 = before(1,1);
    x3 = target(i,1);
    y1 = now(1,2);
    y2 = before(1,2);
    y3 = target(i,2);
    dis2 = abs((y2-y1)*x3-(x2-x1)*y3-y2*x1-y1*x1-y1*x2-x1*y1)/sqrt((y2-y1)^2+(x2-x1)^2);
    % dis = 7.5
    if(dis <= scoutDis || dis2 <= scoutDis)
        if(dis2<dis)
            disp('ooooooooooops!')
            pause
        end
        %                 dis
        %                 dis2
        %                 i
        plot(target(i,1),target(i,2),'go');
        %                 indexSelect = i
        %                 pause
        %                 flag(i,1) = 1;
    end
    
end
end

