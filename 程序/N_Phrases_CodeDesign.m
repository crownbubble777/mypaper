%%%%%   N��λ�뱾���
%%%%%   N��λ�뱾���
%����ת��
%����ת��
% M����Ԫ��K��ȡֵ��K������N����λ
% M����Ԫ��K��ȡֵ��K������N����λ
%���ھ�������
%���ھ�������


clc
clear all
%��ʼ������
M=8;            %��Ԫ��  
K=16;            %������  
N=16;            %��λ��
theta=-pi/2:pi/2/100:pi/2;
d=1;             %��Ԫ��� 
namda=2;         %����
phi=2*pi*d/namda*sin(theta);  %��Ԫ��Ӧ   %sin(a)  sind(a),ǰһ��aָ���ǻ��ȣ���һ��ָ���ǽǶ�


%%%%%  �뱾���
W=zeros(M,K);
for k=1:K
   for m=1:M
     if(M<=K)
          
         W(m,k)=exp(i*2*pi/N*(fix(m*mod(k+(K/2),K)/(K/N))));  % ����������������i��ʾ     
     end 
   end 
end




%���ݲ���ָ�� ȷ��Ȩֵ
 for ii=1:K
  for i=1:length(theta)
   w=[];%Ȩֵ���� ����Ϊ��   
   a=[]; 
    for j=1:M
     w=[w,W(j,ii)];%exp�����Ƿ�Ӹ����أ����ӣ����Ŵ������ᵼ���ƶ���λ��պ÷���
     a=[a,exp(1i*(j-1)*phi(1,i))];
    end
  % F(i,ii)=abs(w*a');%��������׼��
    F(i,ii)=abs(w*a');
  end
 end

 
 
figure(1);
theta_degree=theta/(2*pi)*360; %����һ�£����ȸ�Ϊ����
plot(theta_degree,F(:,10));
grid
% title('MԪ��������ನ��ͼ')
xlabel('�ռ䷽��')
ylabel('����')



% %�����ӻ����������µĵڶ��������ķ���ͼ����һ������ֵ
%����polarҪ��һ���ſ��Ի����������ױ���
figure(2);
a=F/max(max(F));
a=a';
for j=1:K
    polar(theta,a(j,:));
    hold on;
end

figure(3);
polar(theta,a(8,:));
