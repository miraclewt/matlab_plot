function scienceplot2D(hFig, figureWidth, figureHeight, figurefontsize, varargin)
    % scienceplot2D 函数
    % 该函数用于创建2D科学绘图，允许灵活地设置图形的尺寸、字体大小、坐标轴标签、图例等。
    % 使用MATLAB图形对象属性，以一种自定义和优化的方式呈现科学数据。
    %
    % 输入参数：
    % hFig - MATLAB图形句柄对象。
    % figureWidth - 图形的宽度，以厘米为单位。
    % figureHeight - 图形的高度，以厘米为单位。
    % figurefontsize - 图形中使用的字体大小。
    %
    % 可变参数（varargin）：
    % varargin{1} - 指定X轴的界限。
    % varargin{2} - 指定Y轴的界限。
    % varargin{3} - 自定义X轴标签。
    % varargin{4} - 自定义Y轴标签。
    % varargin{5} - 自定义图例内容。
    % varargin{6} - 控制图例的显示状态，取值 'on' 或 'off'。
    %
    % 示例用法：
    % scienceplot2D(fig, 15, 10, 12, [0 100], [0 10], '时间 (s)', '位移 (m)', {'数据1', '数据2'}, 'on');
    % 注意：使用中文字符可能需要MATLAB支持相应的字体或设置。
    % scienceplot2D(gcf, 8.8, 6, 8, [], [], '', 'T (s)', {'\fontname{Simsun}中文'}, {'cos'}, 'on');
    % 设置默认值
    xAxisLabel = ''; % 默认的X轴标签
    yAxisLabel = ''; % 默认的Y轴标签
    legendContent = {}; % 默认的图例内容为空
    legendSwitch = 'off'; % 默认关闭图例显示
    
    % 应用提供的可变参数
    if nargin > 4 % 判断是否有提供额外的参数，并相应地设置它们
        if ~isempty(varargin{1}), xlim(varargin{1}); end % 设置X轴范围
        if ~isempty(varargin{2}), ylim(varargin{2}); end % 设置Y轴范围
        if ~isempty(varargin{3}), xAxisLabel = varargin{3}; end % 设置X轴标签
        if ~isempty(varargin{4}), yAxisLabel = varargin{4}; end % 设置Y轴标签
        if ~isempty(varargin{5}), legendContent = varargin{5}; end % 设置图例内容
        if ~isempty(varargin{6}), legendSwitch = varargin{6}; end % 设置图例显示状态
    end
    
    % 全局参数设置
    set(hFig, 'Units', 'centimeters', 'Position', [0, 0, figureWidth, figureHeight]);
    set(hFig, 'Color', [1, 1, 1]); % 设置图形背景为白色
    set(groot, 'defaultTextInterpreter', 'tex'); % 对所有文本元素设定默认解释器为 'tex'
    
    % 坐标区调整
    ax = gca; % 获取当前坐标轴句柄
    set(ax, 'Units', 'centimeters');
    set(ax, 'Box', 'on', 'XGrid', 'on', 'YGrid', 'on', 'TickDir', 'in', ...
        'TickLength', [.01, .015], 'XMinorTick', 'on', 'YMinorTick', 'on',...
        'XColor', [.1, .1, .1], 'YColor', [.1, .1, .1], 'LineWidth', 1);
    set(ax, 'GridAlpha', 0.1, 'GridLineStyle', '--'); % 设置网格线样式
    set(ax, 'FontName', 'Times New Roman', 'FontSize', figurefontsize); % 设置坐标轴字体和大小
    
    % 坐标轴标签字体和大小
    hXLabel = xlabel(xAxisLabel);
    set(hXLabel, 'FontName', 'Times New Roman', 'FontSize', figurefontsize);
    hYLabel = ylabel(yAxisLabel);
    set(hYLabel, 'FontName', 'Times New Roman', 'FontSize', figurefontsize);
    
    % 图例设置
    if strcmpi(legendSwitch, 'on') && ~isempty(legendContent)
        hLegend = legend(legendContent, 'Location', 'best'); % 设置图例内容和位置
        set(hLegend, 'FontSize', figurefontsize, 'EdgeColor', 'none', 'Color', 'none'); % 自定义图例样式
    elseif strcmpi(legendSwitch, 'off')
        legend('hide'); % 隐藏图例
    end
end