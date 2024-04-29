function customIEEE(hFig, figureWidth, figureHeight, figureFont, varargin)
% customIEEE - 自定义IEEE投稿绘图代码
%
% 语法:  customIEEE(hFig, figureWidth, figureHeight, figureFont, varargin)
%
% 输入参数:
%    hFig         - 图形的句柄。
%    figureWidth  - 图形的宽度，单位是厘米。
%    figureHeight - 图形的高度，单位是厘米。
%    figureFont   - 坐标轴标签和图例的字号。
%    varargin     - 可变输入参数（详见下文）。
%
%    可变输入参数:
%    1. xAxisRange     - 一个两元素向量，指定x轴的范围。
%    2. yAxisRange     - 一个两元素向量，指定y轴的范围。
%    3. xAxisLabel     - 字符串，指定x轴的标签。
%    4. yAxisLabel     - 字符串，指定y轴的标签。
%    5. legendContent  - cell或字符串数组，定义图例标签内容。
%    6. legendSwitch   - 为'on'或'off'，控制图例的显示与否。

% 矫正和优化的部分
% 设置默认值
xAxisLabel = ''; % 默认的X轴标签
yAxisLabel = ''; % 默认的Y轴标签
legendContent = {}; % 默认的图例内容为空
legendSwitch = 'off'; % 默认关闭图例显示

% 应用提供的可变参数
if nargin > 4 % 判断是否有提供额外的参数，并相应地设置它们
    if ~isempty(varargin{1}), xlim(varargin{1}); end
    if ~isempty(varargin{2}), ylim(varargin{2}); end
    if ~isempty(varargin{3}), xAxisLabel = varargin{3}; end
    if ~isempty(varargin{4}), yAxisLabel = varargin{4}; end
    if ~isempty(varargin{5}), legendContent = varargin{5}; end % 设置图例内容
    if ~isempty(varargin{6}), legendSwitch = varargin{6}; end % 设置图例显示状态
end

% 全局参数设置
set(hFig, 'Units', 'centimeters', 'Position', [0, 0, figureWidth, figureHeight]);
set(hFig, 'Color', [1, 1, 1]); % 设置背景为白色
set(groot, 'defaultTextInterpreter', 'tex'); % 对所有文本元素设定默认解释器
% 坐标区调整
ax = gca;
set(ax, 'Units', 'centimeters');
set(ax, 'Box', 'on', 'XGrid', 'on', 'YGrid', 'on', 'TickDir', 'in', ...
    'TickLength', [.01, .015], 'XMinorTick', 'on', 'YMinorTick', 'on',...
    'XColor', [.1, .1, .1], 'YColor', [.1, .1, .1], 'LineWidth', 1);
set(ax, 'GridAlpha', 0.1, 'GridLineStyle', '--');
set(ax, 'FontName', 'Times New Roman', 'FontSize', figureFont);

% 坐标轴标签字体和大小
hXLabel = xlabel(xAxisLabel);
set(hXLabel, 'FontName', 'Times New Roman', 'FontSize', figureFont);
hYLabel = ylabel(yAxisLabel);
set(hYLabel, 'FontName', 'Times New Roman', 'FontSize', figureFont);

% 图例设置
if strcmpi(legendSwitch, 'on') && ~isempty(legendContent)
    hLegend = legend(legendContent, 'Location', 'best');
    set(hLegend, 'FontSize', figureFont, 'EdgeColor', 'none', 'Color', 'none');
end
if strcmpi(legendSwitch, 'off')
    legend('hide');
end
end