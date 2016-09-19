function [] = cluster()
    global Index target plane color;
    size(target)
    plane
    pause
    ldx = kmeans(target,plane);
    Index = zeros(length(target),plane);
    for i=1:plane
        Index(1:length(find(ldx == i)),i) = find(ldx == i);
        for j=1:length(target)
            if(ldx(j,1) == i)
                plot(target(j,1),target(j,2),'o','color',color(i,:));
                hold on;
            end
        end
    end
end

