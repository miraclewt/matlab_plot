function scienceplot3D(hFig, figureWidth, figureHeight, figurefontsize, varargin)
    % scienceplot3D ����
    % �ú������ڴ���3D��ѧ��ͼ��������������ͼ�εĳߴ硢�����С���������ǩ��ͼ���ȡ�
    % ʹ��MATLABͼ�ζ������ԣ���һ���Զ�����Ż��ķ�ʽ���ֿ�ѧ���ݡ�
    %
    % ���������
    % hFig - MATLABͼ�ξ������
    % figureWidth - ͼ�εĿ�ȣ�������Ϊ��λ��
    % figureHeight - ͼ�εĸ߶ȣ�������Ϊ��λ��
    % figurefontsize - ͼ����ʹ�õ������С��
    %
    % �ɱ������varargin����
    % varargin{1} - ָ��X��Ľ��ޡ�
    % varargin{2} - ָ��Y��Ľ��ޡ�
    % varargin{3} - ָ��Z��Ľ��ޡ�
    % varargin{4} - �Զ���X���ǩ��
    % varargin{5} - �Զ���Y���ǩ��
    % varargin{6} - �Զ���Z���ǩ��
    % varargin{7} - �Զ���ͼ�����ݡ�
    % varargin{8} - ����ͼ������ʾ״̬��ȡֵ 'on' �� 'off'��
    %
    % ʾ���÷��������ʵ��3D���ݵ�������
    % scienceplot3D(fig, 15, 10, 12, [0 100], [0 10], [0 5], 'X��', 'Y��', 'Z��', {'����1'}, 'on');

    % ����Ĭ��ֵ
    xAxisLabel = ''; % Ĭ�ϵ�X���ǩ
    yAxisLabel = ''; % Ĭ�ϵ�Y���ǩ
    zAxisLabel = ''; % Ĭ�ϵ�Z���ǩ
    legendContent = {}; % Ĭ�ϵ�ͼ������Ϊ��
    legendSwitch = 'off'; % Ĭ�Ϲر�ͼ����ʾ
    
    % Ӧ���ṩ�Ŀɱ����
    if nargin > 4 % �ж��Ƿ����ṩ����Ĳ���������Ӧ����������
        if ~isempty(varargin{1}), xlim(varargin{1}); end % ����X�᷶Χ
        if ~isempty(varargin{2}), ylim(varargin{2}); end % ����Y�᷶Χ
        if ~isempty(varargin{3}), zlim(varargin{3}); end % ����Z�᷶Χ
        if ~isempty(varargin{4}), xAxisLabel = varargin{4}; end % ����X���ǩ
        if ~isempty(varargin{5}), yAxisLabel = varargin{5}; end % ����Y���ǩ
        if ~isempty(varargin{6}), zAxisLabel = varargin{6}; end % ����Z���ǩ
        if ~isempty(varargin{7}), legendContent = varargin{7}; end % ����ͼ������
        if ~isempty(varargin{8}), legendSwitch = varargin{8}; end % ����ͼ����ʾ״̬
    end
    
    % ȫ�ֲ�������
    set(hFig, 'Units', 'centimeters', 'Position', [0, 0, figureWidth, figureHeight]);
    set(hFig, 'Color', [1, 1, 1]); % ����ͼ�α���Ϊ��ɫ
    set(groot, 'defaultTextInterpreter', 'tex'); % �������ı�Ԫ���趨Ĭ�Ͻ�����Ϊ 'tex'
    
    % ����������
    ax = gca; % ��ȡ��ǰ��������
    set(ax, 'Units', 'centimeters');
    set(ax, 'Box', 'on', 'XGrid', 'on', 'YGrid', 'on', 'ZGrid', 'on', 'TickDir', 'in', ...
        'TickLength', [.01, .015], 'XMinorTick', 'on', 'YMinorTick', 'on', 'ZMinorTick', 'on', ...
        'XColor', [.1, .1, .1], 'YColor', [.1, .1, .1], 'ZColor', [.1, .1, .1], 'LineWidth', 1);
    set(ax, 'GridAlpha', 0.1, 'GridLineStyle', '--'); % ������������ʽ
    set(ax, 'FontName', 'Times New Roman', 'FontSize', figurefontsize); % ��������������ʹ�С
    
    % �������ǩ����ʹ�С
    hXLabel = xlabel(xAxisLabel);
    set(hXLabel, 'FontName', 'Times New Roman', 'FontSize', figurefontsize);
    hYLabel = ylabel(yAxisLabel);
    set(hYLabel, 'FontName', 'Times New Roman', 'FontSize', figurefontsize);
    hZLabel = zlabel(zAxisLabel);
    set(hZLabel, 'FontName', 'Times New Roman', 'FontSize', figurefontsize);
    
    % ͼ������
    if strcmpi(legendSwitch, 'on') && ~isempty(legendContent)
        hLegend = legend(legendContent, 'Location', 'best'); % ����ͼ�����ݺ�λ��
        set(hLegend, 'FontSize', figurefontsize, 'EdgeColor', 'none', 'Color', 'none'); % �Զ���ͼ����ʽ
    elseif strcmpi(legendSwitch, 'off')
        legend('hide'); % ����ͼ��
    end
end