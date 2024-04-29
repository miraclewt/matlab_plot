function DisplayCustomColorPalette()
    % 显示颜色集合中所有的颜色色块，并在每个色块下标出其索引号

    % 创建一个图形窗口用于显示色块
    figure('Name', 'Custom Color Palette', 'NumberTitle', 'off', 'Position', [100, 100, 800, 200]);

    % 获取定义好的16进制颜色集合
    colorset = Colorset();

    % 将16进制颜色值转换为RGB颜色矩阵
    colormapMatrix = cell2mat(cellfun(@Hex2rgb, colorset, 'UniformOutput', false));

    % 获取颜色数量
    numColors = size(colormapMatrix, 1);

    % 计算每个色块的宽度和位置
    cardWidth = 1 / numColors;
    gap = cardWidth * 0.05;  % 色块之间的间隙，设置为色块宽度的5%
    cardWidth = cardWidth - gap;  % 调整色块宽度以留出间隙

    for i = 1:numColors
        % 计算当前色块的位置
        xPos = (i-1) * (cardWidth + gap);

        % 创建一个新的坐标区域用于绘制色块
        axes('Position', [xPos, 0.3, cardWidth, 0.4]);
        rectangle('Position', [0, 0, 1, 1], 'FaceColor', colormapMatrix(i, :), 'EdgeColor', 'none');
        axis off; % 关闭坐标轴显示

        % 在每个色块下面的中心位置标上颜色的索引号，索引号颜色设为黑色
        text(0.5, -0.5, num2str(i), 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Top', 'FontSize', 10, 'Color', 'k');
    end
end

function colorset = Colorset()
    % 返回一个定义好的颜色集合，每个颜色由其16进制表示

    colorset = {
        '#934B43';
        '#D76364';
        '#EF7A6D';
        '#F1D77E';
        '#B1CE46';
        '#63E398';
        '#14517C';
        '#2F7FC1';
        '#D8383A';
        '#C82423';
        '#54B345';
        '#B883D4';
        '#3B0BEB';
        '#000000';
        '#7303BA';
    };
end

function rgb = Hex2rgb(hexStr)
    % 将16进制颜色字符串转换为RGB颜色向量

    % 输入参数:
    % hexStr - 以 '#' 开头的16进制颜色字符串

    % 去掉字符串开头的 '#' 字符
    hexStr = hexStr(2:end);

    % 分别转换红色（R）、绿色（G）、蓝色（B）分量
    r = hex2dec(hexStr(1:2));
    g = hex2dec(hexStr(3:4));
    b = hex2dec(hexStr(5:6));

    % 组合RGB值为一个向量，并将分量值标准化到 [0, 1] 区间
    rgb = [r, g, b] / 255;
end