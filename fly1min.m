function [z,next] = fly1min(begin,aims,i)
    global v start flag route;
    next = aims;
    dis = norm(begin-aims,2);
    
    x1 = begin(1,1);
    y1 = begin(1,2);
    x2 = aims(1,1);
    y2 = aims(1,2);
    if(dis>v) %��Ŀ�������
        x = x1 + (x2-x1)*(v/dis);
        y = y1+ (y2-y1)*(v/dis);
    else %�ִ�Ŀ��
%         begin
%         aims
%         dis
%         st = start(i,:)
%         pause
        %%
        if( aims == start(i,:)) %%�ص�����
            next = aims;
            z = next;
            return;
        else if(norm(aims-start(i,:),2)<v) %%�ػ������һ��
                disp(i,'�ŷɻ������ɹ�');
%                 pause
                z = aims;
                next = z;
                plotLine(begin,z,i);
                return;
            end
        end
        %%
%         pause
        plotLine(begin,aims,i); %%�ɵ�Ŀ���
        index = findNext(aims,begin,i); %%Ѱ����һ��Ŀ��
%         flag(index,1)
%         index
%         pause
        if(index == 0)  %%̽����ɣ�����
            next = start(i,:);
        else  %%����һ��Ŀ�����
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

