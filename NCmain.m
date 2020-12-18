clc; close all; clear all;
syms x t %����xΪ���ű���

f = 4/(1+x^2);  %�����������
a=0;b=1;n=1; %aΪ�������ޣ�bΪ�������ޣ�nΪ�ȷ���

h=(b-a)/n; %hΪ��ⲽ��

for i=1:1:n+1
    xdata(i)=a+(i-1)*h; %��[a,b]�ȷ�Ϊn��ֵ
end

ydata=subs(f,'x',xdata);   %������������У�������ָ
 
for k=1:n+1   %���ѭ���ڵ�cotesϵ��ֵ
    l=1;
    for j=1:1:n+1
        if(j~=k)
            l=l*(t-xdata(j))/(xdata(k)-xdata(j));  %���cotesϵ���ı�������
        end
    end
    s(k)=int(l,a,b);  %��� cotesϵ��
end

ydata=double(ydata); %ת��Ϊ˫������ֵ
s=double(s);
I=sum(s*ydata'); %����ţ��-��˹�ع�ʽ��ӣ�Ȼ�����ܺ�
Ifinall=['��Newton_Cotes�����ʽ����������Ϊ��',num2str(I)];
disp(Ifinall) %������ս��