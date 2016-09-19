function [max] = plotRec(a01)
[max,a,b] = calcMaxDis(a01);
max;
plotCircle(a,b,max);

end

