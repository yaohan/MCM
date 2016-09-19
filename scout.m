function [time,radarTime,finalResult] = scout(type,pl)
global p flag v start alpha angle route scoutDis a01 a02 a03 a04 a05 a06 a07 a08 a09 a10 Index color;

if(type == 1)
        route = [a01;a02;a03;a04;a05;a06;a07;a08;a09;a10];
        scoutDis = 1;   
        a =[
  263  728
  149  501
   76  388
  197  628
];

b =[
   368   319
   256   121
   392   220
   392   275
   ];
    else
        scoutDis = sqrt(7.5*7.5-1.5*1.5);
        a = [
          164  486
          265  727
           93  395
          205  621
        ];

        b = [
           256   121
           368   319
           392   220
           392   275
        ];
    end

plane = pl;
alpha = 1;

[ldx,C] = kmeans(route,plane,'Replicates',100);
C = fix(C);
Index = zeros(length(route),plane);

for i=1:plane
    Index(1:length(find(ldx == i)),i) = find(ldx == i);
    for j=1:length(route)
        if(ldx(j,1) == i)
            plot(route(j,1),route(j,2),'x','color',color(i,:));
            hold on;
        end
    end
end

now = zeros(4,2);
for i = 1:4
    for j = 1:4
        if(C(i,1) == a(j,1))
            now(i,:) = b(j,:);
        end
    end
end
start = now;
next = zeros(size(now));
v = (200/60);



%     i = 1;
%
%     for round=1:100
%         disp('===========================================')
%         alpha = (round)/100
%% 设定第一个目标

flag = zeros(length(route),1);
time = 0;
radarTime = 0;
angle = 0.5;

for i=1:plane
    index = findNext(now(i,:),[0,0],i);
    next(i,:) = route(index,:);
    canScout(next(i,:),[0,0]);
end
%% 心跳 开始

canScout(next(i,:),[0 0])
%         pause(1);
finalResult = zeros(500,8);
while(1)
    time = time +1;
    radarFlag = 0;
    for i=1:plane
        radarFlag = radarFlag+inRadar(now(i,:));
        finalResult(time,2*i-1) = now(i,1);
        finalResult(time,2*i) = now(i,2);
        [now(i,:),next(i,:)] = fly1min(now(i,:),next(i,:),i);%飞1分钟
    end
    if(radarFlag >0)
        radarTime = radarTime + 1;
    end
    if(now == start)
        break;
    end
%                 pause(0.1)
    % pause
end

        finalResult(time+1,2*i-1) = now(i,1);
        finalResult(time+1,2*i) = now(i,2);
finalResult
time
radarTime
angle
%         RTime(round,1) = radarTime;
%         Time(round,1) = time;
%         Angle(round,1) = angle;
%     end
%     [value,index] = min(RTime)
%     figure(2)
%     plot(RTime,'r-');
%     figure(3)
%     plot(Time,'g-');
%     figure(4)
%     plot(Angle,'b-');
end

