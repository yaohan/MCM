function [ret] = check(A,x,y,r)
    for i=1:length(A)
        dis = norm([x,y]-A(i,:),2);
        if(dis > r)
            ret = 0;
            return;
        end;     
    end
    ret = 1;
end

