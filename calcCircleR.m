function [x,y,r1] = calcCircleR(a,b,c)
x1 = a(1,1);
x2 = b(1,1);
x3 = c(1,1);

y1 = a(1,2);
y2 = b(1,2);
y3 = c(1,2);
% a = [
%     x1 y2
%     x2 y2
%     x3 y3]

% x = (x1+x2+x3)/3;
% y = (y1+y2+y3)/3;
% http://www.zybang.com/question/28231e30758cfa6af7567f1482011fd9.html
d = 2*(x1-x2)*(y3-y2) - 2*(y1-y2)*(x3-x2);
x = (y3-y2)*(x1^2+y1^2-x2^2-y2^2)-(y1-y2)*(x3^2+y3^2-x2^2-y2^2);
x = x/d;
y = (x1-x2)*(x3^2+y3^2-x2^2-y2^2)-(x3-x2)*(x1^2+y1^2-x2^2-y2^2);
y = y/d;
a = [x y];
r1 = norm([x,y]-[x1,y1],2);
r2 = norm([x,y]-[x2,y2],2);
r3 = norm([x,y]-[x3,y3],2);
a = [r1,r2,r3];
% if(r1 == r2 && r2 ==r3)
%     print('true');
% else
%     print('false');
% end;
% %定义符号变量，后面求解
% syms x y;
% z = [x,y];
% eq1=(z-(a+b)/2)*((b-a)');
% eq2=(z-(a+c)/2)*((c-a)');
% [x,y]=solve(eq1,eq2)%求圆心坐标
% 
% r = sqrt((x-a(1,1))^2+(y-a(1,2))^2)

end

