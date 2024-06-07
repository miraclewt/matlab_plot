clc;clear;close all
x=0:0.1:100;
y1=sin(x);
y2=cos(x);
figure('Name','单图');
% 单个子图绘制
t0=tiledlayout("flow");
nexttile
plot(x,y1,'LineStyle','-','LineWidth',1,'Color',CustomColormap(14,0));
hold on
plot(x,y2,'LineStyle','-','LineWidth',1,'Color',CustomColormap(2,0));
scienceplot2D(gcf, 8.8,6, 8, [0,10],[-2,2],'Time','Amp',{'sin','cos'},'on');
t0.Padding='tight'; % 缩小空白

% 多子图绘制
hFig2=figure('Name','子图');
t=tiledlayout(2,1); % 布局
nexttile
plot(x,y1,'LineStyle','-','LineWidth',1,'Color',CustomColormap(2,0));
scienceplot2D(gcf,8.8,6,8,[0,10],[-2,2],'T (s)',{'\fontname{Simsun}曲线1'},{'sin'},'on')
nexttile
plot(x,y2,'LineStyle','--','LineWidth',1,'Color',CustomColormap(4,0));
scienceplot2D(gcf,8.8,6,8,[0,10],[-2,2],'T (s)',{'\fontname{Simsun}曲线2'},{'cos'},'on')
t.Padding='tight';

% 三维绘制

% 定义3D数据
[X, Y] = meshgrid(-5:0.5:5, -5:0.5:5); % 生成一个网格
Z = sin(sqrt(X.^2 + Y.^2)); % 使用网格点计算Z值来创建一个3D曲面数据
% 创建一个新的图形窗口
hFig3=figure('Name','3D绘图');
% 绘制3D曲面图
surf(X, Y, Z);
colormap(jet); % 设置色彩映射
colorbar; % 显示颜色条
shading interp; % 插入着色，使颜色在表面上平滑过渡
% 调用我们自定义的3D绘图设置函数
scienceplot3D(hFig3, 8.8, 6, 8, [-5 5], [-5 5], [-1 1], 'X\fontname{宋体}轴标签', 'Y\fontname{宋体}轴标签', 'Z\fontname{宋体}轴标签', {'\fontname{宋体}3D曲面示例'}, 'on');
% 为更好的视觉效果调整视角
view(-30, 30);


