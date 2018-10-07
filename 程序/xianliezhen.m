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

% % ���źţ����䷽��Ϊtheta0������ԭ���ʱ��Ϊ����㣻
for k=1:6000
    ss(k)=cos(2*pi*f*k/fs);
end
% nmax=fix(R/c*fs);

% %��Ԫ������λ��x�����ᣬ��x�����������1��8
% tao��m��Ϊ����ԭ�㣨1��ˮ��������m��ˮ������ʱ���ӳ�
for m=1:N
    tao(m)=(m-1)(R/c)*cos(theta0));  
end 
nmax=round(7*R/c*fs)+10;%������̲�ĵ���
for m=1:N
% ȡ�����ź� nmax:(ns-nmax)���Ա��ڽ������źŽ�������ӳ�  
    a=1:(ns-nmax);
    S=ss(a+round(tao(m)*fs));
% h=[1,cos(theta0),sin(theta0)].';
% �����ͨ����(P,Vx,Vy)=p(1,cosQshiq,shiQcosq);����q=90�ȣ�Q=180�ȡ�
    sig((3*m-2),:)=S;
    sig((3*m-1),:)=S*cos(theta0);
    sig((3*m),:)=S*sin(theta0);
end
x1(:,:)=(sig(:,:)).'; 
% % x1Ϊ����ĸ�ͨ������ź�
R1max=0;
% % ���õڶ��ನ���γɷ�����������������������ĸ�����������ͬ�ķ���������ʱ��ͣ��ٽ�����������Ĳ����γɡ�
for n=0:359
    theta_axis =[0:359].*pi/180; 
    theta=n*pi/180;
    for m=1:N
        w=2;
       if mod(m,w)~=0
        tao1(m)=(R/c)*cos(0.25*pi*(m-1)-theta); %��m����������0��360�ȷ�Χ�ڵ���ʱ��
       else 
          tao1(m)=(r/c)*cos(0.25*pi*(m-1)-theta);
       end   
     end 
           t=nmax:(4900-nmax);%��֪����ĸ�ͨ������źŵĵ���Ϊ4915��ȡ�����ź� nmax:(4900-nmax)
           yp1=0;
           yv1=0;
        for pp=1:N  
            yp1=yp1+x1(t-round(tao1(pp)*fs),(3*pp-2));%����Ԫ��ѹͨ����ʱ���
            vx1=x1(t-round(tao1(pp)*fs),(3*pp-1));%����Ԫx���ٶȷ�����ʱ
            vy1=x1(t-round(tao1(pp)*fs),(3*pp));%����Ԫy���ٶȷ�����ʱ
            v1=vx1*cos(theta)+vy1*sin(theta);
            yv1=yv1+v1;%ʸ��ͨ�����
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
 plot(theta_axis*180/pi,Rp),grid,xlabel('�Ƕȣ��ȣ�'),ylabel('ָ����');
 grid on;
figure;
plot(theta_axis*180/pi,Rpv),grid,xlabel('�Ƕȣ��ȣ�'),ylabel('ָ����');
 grid on;
 figure;
plot(theta_axis*180/pi,Rpvv),grid,xlabel('�Ƕȣ��ȣ�'),ylabel('ָ����');
 grid on;
 figure;
plot(theta_axis*180/pi,RRp),grid,xlabel('�Ƕȣ��ȣ�'),ylabel('DBָ����');
 grid on;
 figure;
plot(theta_axis*180/pi,RRpv),grid,xlabel('�Ƕȣ��ȣ�'),ylabel('DBָ����');
 grid on;
  figure;
plot(theta_axis*180/pi,RRpvv),grid,xlabel('�Ƕȣ��ȣ�'),ylabel('DBָ����');
 grid on;