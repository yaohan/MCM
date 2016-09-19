function [aim] = findNext(now,before,plane)
%����ɻ�����һ��Ŀ���
%����ֵΪaim��target���±� ����0��ʾδ�ҵ�
%now ��ǰ����
%before ǰһ������
%plane �ڼ��ܷɻ�
    global flag route Index alpha angle;
    alpha = 1;
    len = length(nonzeros(Index(:,plane))) %һ�ܷɻ�Ҫ�ɵ�����Ŀ�����
    result = zeros(len,2); %�������ͽǶ�
    for i=1:len%��һ�ܷɻ������������Ŀ
        index = Index(i,plane);  %��i��Ŀ��㡢
        if(flag(index,1) == 0) %δ���
            result(i,1) = norm(now-route(index,:),2); %����
            
            result(i,2) = calcAngle(before,now,route(index,:));
        end
    end
    %%
    %��һ��
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

