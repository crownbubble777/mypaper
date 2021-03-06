%%%%%   3C码本设计
%%%%%   3C码本设计
%波束转向
%波束转向
% M个阵元，K个取值，K个方向
% M个阵元，K个取值，K个方向
%均匀线阵
%均匀线阵

clc
clear all

%初始化参数
M=4;            %阵元数  
K=4;            %方向数  

theta=-pi:pi/2/100:pi; %原来是theta=-pi/2:pi/2/100:pi/2，这样只能画出一半的图像
d=1;             %阵元间距 
namda=2;         %波长
phi=2*pi*d/namda*sin(theta);  %阵元响应   %sin(a)  sind(a),前一个a指的是弧度，后一个指的是角度


%%%%%  码本设计
W=zeros(M,K);
for k=1:K
   for m=1:M
     if(M<=K)
          
         W(m,k)=exp(i*pi/2*(fix(m*mod(k+(K/2),K)/(K/4))));  % 复数的虚数部分用i表示     
         %W(m,k)=exp(i*2*pi*m*k/M); %DFT码本变化
         %W(m,k)=exp(j*pi*m*sin(2*pi*k/2^4)); %beam steering码本变化 
     end 
   end 
end




%根据波束指向 确定权值
 for ii=1:K
  for i=1:length(theta)
   w=[];%权值向量 先设为空   
   a=[]; 
    for j=1:M
     w=[w,W(j,ii)];%exp里面是否加负号呢，不加，负号存在与否会导致移动相位会刚好反向
     a=[a,exp(1i*(j-1)*phi(1,i))];
    end
  % F(i,ii)=abs(w*a');%最大信噪比准则
    F(i,ii)=abs(w*a');
  end
 end

 
 
figure(1);
theta_degree=theta/(2*pi)*360; %改了一下，弧度改为度数

subplot(1,3,1);
plot(theta_degree,F(:,1));
grid
xlabel('空间方向')
ylabel('增益')
subplot(1,3,2);
plot(theta_degree,F(:,1));
grid
xlabel('空间方向')
ylabel('增益')
subplot(1,3,3);
plot(theta_degree,F(:,1));
grid
xlabel('空间方向')
ylabel('增益')

% title('M元均匀线阵多波束图')
% xlabel('空间方向')
% ylabel('增益')


% %举例子画出极坐标下的第二个波束的方向图，归一化功率值
%可能polar要归一化才可以画，否则容易报错
figure(2);
a=F/max(max(F));
a=a';
for j=1:K
    polar(theta,a(j,:));
    hold on;
end

figure(3);
polar(theta,a(6,:));


