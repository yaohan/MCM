init();
plotMap();
global ld p v start flag route Index alpha angle;
len = length(ld);
minDis = ones(len,1)*inf;
minld = minDis;
minP = minDis;
for i = 1:length(ld)
    for j = 1:length(p)
        dis = norm(ld(i,:)-p(j,:),2);
        if(dis <minDis(i,1))
            minDis(i,1) = dis;
            minld(i,1) = i;
            minP(i,1) = j;
        end 
    end
end
%%
flag = zeros(length(ld),1);
%%
now = [368 319];
next = ld(4,:);
flag(4,1) = 1;
Index = [1;2;3;4;8;9];
% now = [296,242];
% next = ld(6,:);
% flag(6,1) = 1;
% Index = [5;6;7;10];
%%
start = now;

%%
route = ld;
time = 0;
plane = 1;
radarTime = 0;
while(1)
     time = time +1
    radarFlag = 0;
    for i=1:plane
        radarFlag = radarFlag+inRadar(now(i,:));
        [now(i,:),next(i,:)] = fly1min(now(i,:),next,i);%·É1·ÖÖÓ
    end
    if(radarFlag >0)
        radarTime = radarTime + 1;
    end
    if(now == start)
        break;
    end
%     pause(0.1);
end
    time
    radarTime