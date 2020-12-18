clc; close all; clear all;
syms x t %定义x为符号变量

f = 4/(1+x^2);  %定义求积函数
a=0;b=1;n=1; %a为积分下限，b为积分上限，n为等分数

h=(b-a)/n; %h为求解步长

for i=1:1:n+1
    xdata(i)=a+(i-1)*h; %将[a,b]等分为n个值
end

ydata=subs(f,'x',xdata);   %带入求积函数中，求解具体指
 
for k=1:n+1   %求解循环内的cotes系数值
    l=1;
    for j=1:1:n+1
        if(j~=k)
            l=l*(t-xdata(j))/(xdata(k)-xdata(j));  %求解cotes系数的被积函数
        end
    end
    s(k)=int(l,a,b);  %求解 cotes系数
end

ydata=double(ydata); %转换为双精度数值
s=double(s);
I=sum(s*ydata'); %根据牛顿-科斯特公式相加，然后求总和
Ifinall=['用Newton_Cotes求积公式求得这个积分为：',num2str(I)];
disp(Ifinall) %输出最终结果