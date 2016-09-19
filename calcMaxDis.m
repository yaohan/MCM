function [max,x1,y1] = calcMaxDis(a01)
    max = inf;
    x1 = 0;
    y1 = 0;
    for i=1:length(a01)
        for j=i+1:length(a01)
            for k = j+1:length(a01)
                [x,y,r] = calcCircleR(a01,i,j,k);
                if(check(a01,x,y,r) == 1)
                    if(r<max)
                        max = r;
                        x1 = x;
                        y1 = y;
                    end
                end
                
            end
        end
    end
end

