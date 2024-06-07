clc;clear;close all
x=0:0.1:100;
y1=sin(x);
y2=cos(x);
figure('Name','��ͼ');
% ������ͼ����
t0=tiledlayout("flow");
nexttile
plot(x,y1,'LineStyle','-','LineWidth',1,'Color',CustomColormap(14,0));
hold on
plot(x,y2,'LineStyle','-','LineWidth',1,'Color',CustomColormap(2,0));
scienceplot2D(gcf, 8.8,6, 8, [0,10],[-2,2],'Time','Amp',{'sin','cos'},'on');
t0.Padding='tight'; % ��С�հ�

% ����ͼ����
hFig2=figure('Name','��ͼ');
t=tiledlayout(2,1); % ����
nexttile
plot(x,y1,'LineStyle','-','LineWidth',1,'Color',CustomColormap(2,0));
scienceplot2D(gcf,8.8,6,8,[0,10],[-2,2],'T (s)',{'\fontname{Simsun}����1'},{'sin'},'on')
nexttile
plot(x,y2,'LineStyle','--','LineWidth',1,'Color',CustomColormap(4,0));
scienceplot2D(gcf,8.8,6,8,[0,10],[-2,2],'T (s)',{'\fontname{Simsun}����2'},{'cos'},'on')
t.Padding='tight';

% ��ά����

% ����3D����
[X, Y] = meshgrid(-5:0.5:5, -5:0.5:5); % ����һ������
Z = sin(sqrt(X.^2 + Y.^2)); % ʹ����������Zֵ������һ��3D��������
% ����һ���µ�ͼ�δ���
hFig3=figure('Name','3D��ͼ');
% ����3D����ͼ
surf(X, Y, Z);
colormap(jet); % ����ɫ��ӳ��
colorbar; % ��ʾ��ɫ��
shading interp; % ������ɫ��ʹ��ɫ�ڱ�����ƽ������
% ���������Զ����3D��ͼ���ú���
scienceplot3D(hFig3, 8.8, 6, 8, [-5 5], [-5 5], [-1 1], 'X\fontname{����}���ǩ', 'Y\fontname{����}���ǩ', 'Z\fontname{����}���ǩ', {'\fontname{����}3D����ʾ��'}, 'on');
% Ϊ���õ��Ӿ�Ч�������ӽ�
view(-30, 30);


