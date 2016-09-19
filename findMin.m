function [index,angle] = findMin(target,start)
dis = (target(:,1)-start(1,1)).^2+(target(:,2)-start(1,2)).^2;
[value,index] = min(dis);
a = [0,1];
b = start-target(index,:);
% http://zhidao.baidu.com/link?url=arGzUgn3w2OSoXfeVRdsptIRaAuptTu2msoCnbMECpLAwn7bSMzeCaju1HfAz6YiWfL-nRz0upqt6IYW3g9sMa
angle = calcAngle([0,1],target(index,:));
end

