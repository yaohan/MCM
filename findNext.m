function [aim] = findNext(now,before,plane)
%计算飞机的下一个目标点
%返回值为aim，target的下标 返回0表示未找到
%now 当前坐标
%before 前一个坐标
%plane 第几架飞机
    global flag route Index alpha angle;
    alpha = 1;
    len = length(nonzeros(Index(:,plane))) %一架飞机要飞的所有目标个数
    result = zeros(len,2); %保存距离和角度
    for i=1:len%第一架飞机的所有落点数目
        index = Index(i,plane);  %第i个目标点、
        if(flag(index,1) == 0) %未侦查
            result(i,1) = norm(now-route(index,:),2); %距离
            
            result(i,2) = calcAngle(before,now,route(index,:));
        end
    end
    %%
    %归一化
    maxDis= max(result(:,1));
    if(maxDis ~= 0)
        result(:,1) = result(:,1)/maxDis;
    end
    maxAngle = max(result(:,2));
    if(maxAngle ~= 0)
        result(:,2) = result(:,2)/maxAngle;
    end
    res = alpha * result(:,1)+(1-alpha)*result(:,2);
    if(res == 0)
        aim = 0;
        return;
    end
    ind = find(res == min(res(find(res>0))));
    aim = Index(ind(1,1),plane);
    flag(aim,1) = 1;
    angle = angle + result(ind,2)*maxAngle;
%     pause
end

