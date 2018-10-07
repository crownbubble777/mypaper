clear all
close all

N=8;
ns=6000;
f=8*10^3;
c=1500;
 lmda=c/f;
 theta0=0.25*180*pi/180;
R=0.1;

fs=2000*10^3;
% mk=2*(fix(d*sin(90*pi/180)*fs/c))+1;
% mk=fix(R/c*fs)+1;
% snr=5;
% mk0=(mk+1)/2;
% nmax=(N-1)*(mk0-1)+1;
% lobe_rate=30;

% % 造信号，入射方向为theta0，到达原点的时间为最初点；
for k=1:6000
    ss(k)=cos(2*pi*f*k/fs);
end
% nmax=fix(R/c*fs);

% %八元线列阵：位于x坐标轴，沿x轴的正方向编号1到8
% tao（m）为坐标原点（1号水听器）到m号水听器的时间延迟
for m=1:N
    tao(m)=(m-1)(R/c)*cos(theta0));  
end 
nmax=round(7*R/c*fs)+10;%最大声程差的点数
for m=1:N
% 取基础信号 nmax:(ns-nmax)，以便于将基础信号进行向后延迟  
    a=1:(ns-nmax);
    S=ss(a+round(tao(m)*fs));
% h=[1,cos(theta0),sin(theta0)].';
% 各输出通道，(P,Vx,Vy)=p(1,cosQshiq,shiQcosq);这里q=90度，Q=180度。
    sig((3*m-2),:)=S;
    sig((3*m-1),:)=S*cos(theta0);
    sig((3*m),:)=S*sin(theta0);
end
x1(:,:)=(sig(:,:)).'; 
% % x1为仿真的各通道输出信号
R1max=0;
% % 采用第二类波束形成方法，即将各个传感器输出的各个分量中相同的分量进行延时求和，再进行四则运算的波束形成。
for n=0:359
    theta_axis =[0:359].*pi/180; 
    theta=n*pi/180;
    for m=1:N
        w=2;
       if mod(m,w)~=0
        tao1(m)=(R/c)*cos(0.25*pi*(m-1)-theta); %第m个传感器在0到360度范围内的延时；
       else 
          tao1(m)=(r/c)*cos(0.25*pi*(m-1)-theta);
       end   
     end 
           t=nmax:(4900-nmax);%已知仿真的各通道输出信号的点数为4915，取基础信号 nmax:(4900-nmax)
           yp1=0;
           yv1=0;
        for pp=1:N  
            yp1=yp1+x1(t-round(tao1(pp)*fs),(3*pp-2));%各阵元声压通道延时求和
            vx1=x1(t-round(tao1(pp)*fs),(3*pp-1));%各阵元x轴速度分量延时
            vy1=x1(t-round(tao1(pp)*fs),(3*pp));%各阵元y轴速度分量延时
            v1=vx1*cos(theta)+vy1*sin(theta);
            yv1=yv1+v1;%矢量通道求和
           yyp1(t)=yp1;
           yyv1(t)=yv1;
        end
    Rp(n+1)=abs(sum(yyp1.^2));
    Rpv(n+1)=abs(sum((yyp1.*yyv1).^2)); 
    Rpvv(n+1)=abs(sum(((yyp1+yyv1).*yyv1).^2));  
end

  RRp=10*log10(Rp/max(Rp));
  RRpv=10*log10(Rpv/max(Rpv));
  RRpvv=10*log10(Rpvv/max(Rpvv));
figure;
 plot(theta_axis*180/pi,Rp),grid,xlabel('角度（度）'),ylabel('指向性');
 grid on;
figure;
plot(theta_axis*180/pi,Rpv),grid,xlabel('角度（度）'),ylabel('指向性');
 grid on;
 figure;
plot(theta_axis*180/pi,Rpvv),grid,xlabel('角度（度）'),ylabel('指向性');
 grid on;
 figure;
plot(theta_axis*180/pi,RRp),grid,xlabel('角度（度）'),ylabel('DB指向性');
 grid on;
 figure;
plot(theta_axis*180/pi,RRpv),grid,xlabel('角度（度）'),ylabel('DB指向性');
 grid on;
  figure;
plot(theta_axis*180/pi,RRpvv),grid,xlabel('角度（度）'),ylabel('DB指向性');
 grid on;