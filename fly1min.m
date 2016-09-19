function [z,next] = fly1min(begin,aims,i)
    global v start flag route;
    next = aims;
    dis = norm(begin-aims,2);
    
    x1 = begin(1,1);
    y1 = begin(1,2);
    x2 = aims(1,1);
    y2 = aims(1,2);
    if(dis>v) %向目标飞行中
        x = x1 + (x2-x1)*(v/dis);
        y = y1+ (y2-y1)*(v/dis);
    else %抵达目标
%         begin
%         aims
%         dis
%         st = start(i,:)
%         pause
        %%
        if( aims == start(i,:)) %%回到基地
            next = aims;
            z = next;
            return;
        else if(norm(aims-start(i,:),2)<v) %%回基地最后一步
                disp(i,'号飞机返航成功');
%                 pause
                z = aims;
                next = z;
                plotLine(begin,z,i);
                return;
            end
        end
        %%
%         pause
        plotLine(begin,aims,i); %%飞到目标点
        index = findNext(aims,begin,i); %%寻找下一个目标
%         flag(index,1)
%         index
%         pause
        if(index == 0)  %%探索完成，返航
            next = start(i,:);
        else  %%向下一个目标飞行
%             index
            canScout(route(index,:),[0,0]);
            next = route(index,:);
        end
            last = v-dis;
            dis = norm(aims-next,2);
            begin = aims;  
%             begin
%             next
%             pause
            x1 = aims(1,1);
            y1 = aims(1,2);
            x2 = next(1,1);
            y2 = next(1,2);
            x = x1 + (x2-x1)*(last/dis);
            y = y1+ (y2-y1)*(last/dis);
%             x
%             y 
    end
    z = [x y];
    canScout(z,begin);
    plotLine(begin,z,i);
end

