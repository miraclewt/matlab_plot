% @Name: CustomColormap
% @Date: 2024/03/29
% @Encoding: UTF-8
% @Author: WT
% @Version: 1.0
% @Note: 若中文注释显示有问题，请确保文件编码为UTF-8并在支持该编码的编辑器中打开。
% 
% 功能描述：
% - 根据指定的索引返回自定义颜色映射中的颜色RGB值。
% - 提供了一个选项，用于控制是否以色卡形式展示所有颜色。
%
% 使用示例：
% - 获取颜色RGB值：color = CustomColormap(5, 0)
% - 展示色卡： CustomColormap(任意值, 1)
%
% 输入参数：
% - index：颜色索引，若要展示色卡，这个参数将被忽略。
% - displayCard：控制显示色卡的参数。1表示展示色卡，0表示不展示。
%
% 输出参数：
% - Color：若displayCard为0，则返回对应索引的RGB颜色值。若displayCard为1,则不返回任何值。

function Color = CustomColormap(index, displayCard)
    % 根据索引返回自定义颜色集中的颜色或展示色卡
    % 输入参数：
    % - index：颜色集中的颜色索引（若展示色卡，此参数不起作用）
    % - displayCard：是否展示色卡的标志（1表示展示，0表示不展示）
    % 输出参数：
    % - Color：颜色RGB值的三元组，或展示色卡时不返回任何值
    
    % 定义颜色集合
    colorset = Colorset();
    
    % 根据displayCard的值确定行为
    if displayCard == 1
        % 展示色卡
        DisplayColorCard(colorset);
        return;
    else
        % 根据索引返回颜色
        if index < 1 || index > numel(colorset)
            error('索引超出范围：应在1到%d之间，输入值为%d。', numel(colorset), index);
        end
        
        % 从颜色集合中获取相应颜色并转换为RGB值
        hexColor = colorset{index};
        Color = Hex2rgb(hexColor);
    end
end

function rgb = Hex2rgb(hexStr)
    % 将16进制颜色代码转换为RGB颜色值
    % 输入参数:
    % - hexStr: 以 '#' 开头的16进制颜色字符串
    % 输出参数:
    % - rgb: 对应的RGB颜色值数组
    
    % 去掉16进制颜色字符串前的'#'字符
    hexStr = hexStr(2:end);
    
    % 分别转换红(R)，绿(G)和蓝(B)的16进制值到十进制
    r = hex2dec(hexStr(1:2));
    g = hex2dec(hexStr(3:4));
    b = hex2dec(hexStr(5:6));
    
    % 将RGB值转换为MATLAB中使用的范围[0, 1]
    rgb = [r, g, b] / 255;
end

function colorset = Colorset()
    % 定义一个颜色集合
    % 返回值:
    % - colorset: 一个含有多个16进制颜色代码的单元格数组
    
    colorset = {
        '#934B43';  % 棕色
        '#D76364';  % 粉红色
        '#EF7A6D';  % 桃红色
        '#F1D77E';  % 金色
        '#B1CE46';  % 青色
        '#63E398';  % 草绿色
        '#14517C';  % 藏青色
        '#2F7FC1';  % 天蓝色
        '#D8383A';  % 红色
        '#C82423';  % 鲜红色
        '#54B345';  
        '#B883D4';  
        '#3B0BEB';  
        '#000000';  
        '#7303BA';  
    };
end

function DisplayColorCard(colorset)
    % 展示颜色集合中的所有颜色
    % 输入参数:
    % - colorset: 包含颜色的单元格数组，用于展示
    
    figure;
    for i = 1:numel(colorset)
        subplot(1, numel(colorset), i);
        rgb = Hex2rgb(colorset{i});
        patch([0, 1, 1, 0], [0, 0, 1, 1], rgb);
        axis off; % 关闭坐标轴显示
        title(['NO.', num2str(i)]); % 显示色块编号
    end
end