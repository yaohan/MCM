function [angle] = calcAngle(before,now,next)
if(before == [0,0])
    angle = 0;
%     disp('first')
    return;
end;
a = now - before;
b = next - now;

angle = acos(dot(a,b)/(norm(a)* norm(b)))*180/pi;


end

