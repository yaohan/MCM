function [] = SBscout(start)
global target flag;
[index,angle] = findMin(target,start);
flag(index,1) = 1;
start
index
target(index,:)
line([start(1,1),target(index,1)],[start(1,2),target(index,2)])
pause(0.5)
while(sum(flag)<length(flag))
    now = target(index,:);
    [index,angle] = findNext(now);
    flag(index,1) = 1;
    line([now(1,1),target(index,1)],[now(1,2),target(index,2)])
    pause(0.5)
end

end

