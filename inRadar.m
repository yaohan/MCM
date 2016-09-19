function [flag] = inRadar(now)
    flag = 0;
    global ld;
    for i=1:length(ld)
        if(norm(ld(i,:)-now,2)<70)
            flag = 1;
            return
        end
    end
end

