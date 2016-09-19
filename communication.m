%%µÚ¶þÎÊ

data = xlsread('result.xlsx');
a = zeros(8,2);
a(1,:) = data(1,2:3);
a(2,:) = data(1,4:5);
a(3,:) = data(1,6:7);
a(4,:) = data(1,8:9);
a(5,:) = data(1,10:11);
a(6,:) = data(1,12:13);
a(7,:) = data(1,14:15);
a(8,:) = data(1,16:17);

[x,y,r] = calcCircleR(a(1,:),a(2,:),a(3,:))
[x,y,r] = calcCircleR(a(1,:),a(2,:),a(4,:))
[x,y,r] = calcCircleR(a(1,:),a(3,:),a(4,:))
[x,y,r] = calcCircleR(a(2,:),a(3,:),a(4,:))

size(data(:,16))
dis = zeros(338,1);
for i=1:338
    a = data(i,8:9);
    b = data(i,16:17);
    dis(i,1) = norm(a-b,2);
end
plot(dis)

% for i=1:8
%     for j=i+1:8;
%         for k = j+1:8
%             calcCircleR()
%         end
%     end
% end