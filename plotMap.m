function [] = plotMap()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global p ld a01 a02 a03 a04 a05 a06 a07 a08 a09 a10 r;

plot(p(:,1),p(:,2),'bo');
hold on;
plot(ld(:,1),ld(:,2),'k*');
hold on;
plot(a01(:,1),a01(:,2),'ro');
hold on;
plot(a02(:,1),a02(:,2),'ro');
hold on;
plot(a03(:,1),a03(:,2),'ro');
hold on;
plot(a04(:,1),a04(:,2),'ro');
hold on;
plot(a05(:,1),a05(:,2),'ro');
hold on;
plot(a06(:,1),a06(:,2),'ro');
hold on;
plot(a07(:,1),a07(:,2),'ro');
hold on;
plot(a08(:,1),a08(:,2),'ro');
hold on;
plot(a09(:,1),a09(:,2),'ro');
hold on;
plot(a10(:,1),a10(:,2),'ro');
hold on;

% »­À×´ï·¶Î§
for i=1:length(ld)
    plotCircle(ld(i,1),ld(i,2),70);
end

% axis([-100,800,-100,800]);
% axis([-100,400,250,750]);
axis equal;

%%»­Íâ½ÓÔ²
% r(1,1) = plotRec(a01);
% r(2,1) = plotRec(a02);
% r(3,1) = plotRec(a03);
% r(4,1) = plotRec(a04);
% r(5,1) = plotRec(a05);
% r(6,1) = plotRec(a06);
% r(7,1) = plotRec(a07);
% r(8,1) = plotRec(a08);
% r(9,1) = plotRec(a09);
% r(10,1) = plotRec(a10);

r;
end

