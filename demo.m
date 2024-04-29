clc;clear;close all
x=0:0.1:10;
y1=sin(x);
y2=cos(x);
figure('Name','DEMO');
t=tiledlayout(2,1); % 创建任意数量的图块
nexttile
plot(x,y1,'LineStyle','-','LineWidth',1,'Color',CustomColormap(2));
customIEEE(gcf,8.8,6,8,'','','T (s)',{'\fontname{Simsun}幅值'},{'sin'},'on')
nexttile
plot(x,y2,'LineStyle','--','LineWidth',1,'Color',CustomColormap(4));
customIEEE(gcf,8.8,6,8,'','','T (s)',{'\fontname{Simsun}幅值'},{'cos'},'on')
t.Padding='tight';