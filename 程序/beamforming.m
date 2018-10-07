
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

M=11; %��Ԫ����
Nmid=1; %�ο���
d=3;%��Ԫ���
m=[0:1:M-1];
yi=zeros(M,1);% ����һ��M*1ά�������
zi=zeros(M,1);
xi=m*d;
xi=xi.';
%����Ԫ����
y1=20;
x1=10;z1=10;% ��Դλ�ã� y��ָ����Դƽ��
Ric1=sqrt((x1-xi).^2+(y1-yi).^2+(z1-zi).^2);%��Դ������Ԫ�ľ��� M*1ά
Rn1=Ric1-Ric1(Nmid);%��Դ������Ԫ��ο���Ԫ�����̲�ʸ�� M*1ά

s1=cos(w*t);%�ο���Ԫ���յ����ź� 1*Lά
snr =20;
Am= 10^(-snr/20);
n1=Am*(randn(M,L)+j*randn(M,L));%����Ԫ����ʸ��
p1=zeros(M,L);%M*Lά
for k1=1:M
    p1(k1,:)=Ric1(Nmid)/Ric1(k1)*s1.*exp(-j*w*Rn1(k1)/c);  %����Ԫ��������˥������λ�ӳٺ���յ����źţ�M*Lά
end
p=p1+n1;%����Ԫ���յ���ѹ�źž��� M*L
R=p*p'/L;%�������ݵ���Э������� M*M

% ----------------------------------------------------------
% ɨ�跶Χ
step_x=0.1;
step_z=0.1;
y=y1;
x=[0:step_x:20];
z=[0:step_z:20];


for k1=1:length(z) % ������
    for k2=1:length(x)
        Ri=sqrt((x(k2)-xi).^2+(y-yi).^2+(z(k1)-zi).^2); %��ɨ���������Ԫ�ľ۽�����ʸ��
        Rn=Ri-Ri(Nmid);%ɨ��㵽����Ԫ��ο���Ԫ�ĳ̲�ʸ�� M*1
       
        b=exp(-j*w*Rn/c);%��ѹ�۽�����ʸ�� M*1
        Pcbf(k1,k2)=abs(b'*R*b);
        
    end
end

% ��һ��
for k1=1:length(z)
    pp(k1)=max(Pcbf(k1,:));% Pcbf�ĵ�k1�е����Ԫ�ص�ֵ
end
Pcbf=Pcbf/max(pp);% Pcbf����Ԫ�س��������ֵ����һ������

figure;
mesh(x,z,Pcbf);
xlabel('x(m)'),ylabel('z(m)')
title('����۽������γɵ�������ͼ')
figure;
pcolor(x,z,Pcbf);shading interp; 
xlabel('x(m)'),ylabel('z(m)')
title('����۽������γɵ�������ͼ')
colorbar
[a,b] = find(Pcbf==max(max(Pcbf)));
xm1=b/length(x)*20, zm1=a/length(z)*20,
[a b]=find(Pcbf > 0.5*max(max(Pcbf)));
deta_x=(max(b)-min(b))/length(x)*20
deta_z=(max(a)-min(a))/length(z)*20
