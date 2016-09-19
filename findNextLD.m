function [ index ] = findNextLD(now,ld,targetIndex,flag)
    index = 0;
    for i = 1:length(targetIndex)
        if(flag(i,1) == 0)
            dis = norm(now-ld(targetIndex(i,1),:),2);
            if(dis<min)
                min = dis;
                index = i;
            end
        end
    end


end

