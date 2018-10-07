
clear all
clc

c=1500;
fs=10000;
T = 0.1;
t = 0:1/fs:T;
L=length(t);
f=500;
w=2*pi*f;
k=w/c;

M=11; %阵元个数
Nmid=1; %参考点
d=3;%阵元间距
m=[0:1:M-1];
yi=zeros(M,1);% 返回一个M*1维的零矩阵
zi=zeros(M,1);
xi=m*d;
xi=xi.';
%各阵元坐标
y1=20;
x1=10;z1=10;% 声源位置， y轴指向声源平面
Ric1=sqrt((x1-xi).^2+(y1-yi).^2+(z1-zi).^2);%声源至各阵元的距离 M*1维
Rn1=Ric1-Ric1(Nmid);%声源至各阵元与参考阵元的声程差矢量 M*1维

s1=cos(w*t);%参考阵元接收到的信号 1*L维
snr =20;
Am= 10^(-snr/20);
n1=Am*(randn(M,L)+j*randn(M,L));%各阵元噪声矢量
p1=zeros(M,L);%M*L维
for k1=1:M
    p1(k1,:)=Ric1(Nmid)/Ric1(k1)*s1.*exp(-j*w*Rn1(k1)/c);  %各阵元经过幅度衰减和相位延迟后接收到的信号，M*L维
end
p=p1+n1;%各阵元接收的声压信号矩阵 M*L
R=p*p'/L;%接收数据的自协方差矩阵 M*M

% ----------------------------------------------------------
% 扫描范围
step_x=0.1;
step_z=0.1;
y=y1;
x=[0:step_x:20];
z=[0:step_z:20];


for k1=1:length(z) % 纵坐标
    for k2=1:length(x)
        Ri=sqrt((x(k2)-xi).^2+(y-yi).^2+(z(k1)-zi).^2); %该扫描点至各阵元的聚焦距离矢量
        Rn=Ri-Ri(Nmid);%扫描点到各阵元与参考阵元的程差矢量 M*1
       
        b=exp(-j*w*Rn/c);%声压聚焦方向矢量 M*1
        Pcbf(k1,k2)=abs(b'*R*b);
        
    end
end

% 归一化
for k1=1:length(z)
    pp(k1)=max(Pcbf(k1,:));% Pcbf的第k1行的最大元素的值
end
Pcbf=Pcbf/max(pp);% Pcbf所有元素除以其最大值，归一化幅度

figure;
mesh(x,z,Pcbf);
xlabel('x(m)'),ylabel('z(m)')
title('常规聚焦波束形成单亮点声图')
figure;
pcolor(x,z,Pcbf);shading interp; 
xlabel('x(m)'),ylabel('z(m)')
title('常规聚焦波束形成单亮点声图')
colorbar
[a,b] = find(Pcbf==max(max(Pcbf)));
xm1=b/length(x)*20, zm1=a/length(z)*20,
[a b]=find(Pcbf > 0.5*max(max(Pcbf)));
deta_x=(max(b)-min(b))/length(x)*20
deta_z=(max(a)-min(a))/length(z)*20
