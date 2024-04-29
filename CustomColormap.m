% @Name：CustomColormap
% @Date：2024/3/29
% @Encoding：UTF-8
% @Note：若中文注释显示不正确，请切换到正确编码。

function Color = CustomColormap(index)
    % 返回指定索引的颜色RGB值
    % index: 颜色集中的颜色索引
    
    % 定义一个16进制颜色集合
    colorset = Colorset();
    
    % 检查输入索引是否在有效范围内
    if index < 1 || index > numel(colorset)
        error('索引超出范围: 应该在1到%d之间，而您输入的是%d。', numel(colorset), index);
    end
    
    % 从colorset中取出颜色，并将16进制颜色代码转换成RGB值
    hexColor = colorset{index};
    Color = Hex2rgb(hexColor);
end

function rgb = Hex2rgb(hexStr)
    % 将16进制颜色字符串转换为RGB向量
    % hexStr: 以 '#' 开头的16进制颜色字符串

    % 去掉字符串开头的'#'字符
    hexStr = hexStr(2:end);
    
    % 分别转换红色、绿色、蓝色分量
    r = hex2dec(hexStr(1:2));
    g = hex2dec(hexStr(3:4));
    b = hex2dec(hexStr(5:6));
    
    % 将得到的RGB值组合为一个向量，并将其标准化到[0, 1]区间
    rgb = [r, g, b] / 255;
end


function colorset = Colorset()
    % 返回颜色集合
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