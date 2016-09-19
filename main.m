% init();
plotMap();

% % 
% time = zeros(7,4);
% for plane = 1:7 %携带S1的飞机个数
%     disp('============================');
%     plane
%     [t,rt] = scout(1,plane);
%     time(plane,1) = t;
%     time(plane,2) = rt;
%     [t2,rt2] = scout(2,8-plane);
%     plane
%     time(plane,3) = t2;
%     time(plane,4) = rt2;
% end
% 


%  = scout(1,4)
% [time,radarTime,finalResult] = scout(2,4);
global route target color;
route = target;
%%聚类
[ldx,C] = kmeans(route,4,'Replicates',100);
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


