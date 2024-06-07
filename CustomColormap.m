% @Name: CustomColormap
% @Date: 2024/03/29
% @Encoding: UTF-8
% @Author: WT
% @Version: 1.0
% @Note: ������ע����ʾ�����⣬��ȷ���ļ�����ΪUTF-8����֧�ָñ���ı༭���д򿪡�
% 
% ����������
% - ����ָ�������������Զ�����ɫӳ���е���ɫRGBֵ��
% - �ṩ��һ��ѡ����ڿ����Ƿ���ɫ����ʽչʾ������ɫ��
%
% ʹ��ʾ����
% - ��ȡ��ɫRGBֵ��color = CustomColormap(5, 0)
% - չʾɫ���� CustomColormap(����ֵ, 1)
%
% ���������
% - index����ɫ��������Ҫչʾɫ������������������ԡ�
% - displayCard��������ʾɫ���Ĳ�����1��ʾչʾɫ����0��ʾ��չʾ��
%
% ���������
% - Color����displayCardΪ0���򷵻ض�Ӧ������RGB��ɫֵ����displayCardΪ1,�򲻷����κ�ֵ��

function Color = CustomColormap(index, displayCard)
    % �������������Զ�����ɫ���е���ɫ��չʾɫ��
    % ���������
    % - index����ɫ���е���ɫ��������չʾɫ�����˲����������ã�
    % - displayCard���Ƿ�չʾɫ���ı�־��1��ʾչʾ��0��ʾ��չʾ��
    % ���������
    % - Color����ɫRGBֵ����Ԫ�飬��չʾɫ��ʱ�������κ�ֵ
    
    % ������ɫ����
    colorset = Colorset();
    
    % ����displayCard��ֵȷ����Ϊ
    if displayCard == 1
        % չʾɫ��
        DisplayColorCard(colorset);
        return;
    else
        % ��������������ɫ
        if index < 1 || index > numel(colorset)
            error('����������Χ��Ӧ��1��%d֮�䣬����ֵΪ%d��', numel(colorset), index);
        end
        
        % ����ɫ�����л�ȡ��Ӧ��ɫ��ת��ΪRGBֵ
        hexColor = colorset{index};
        Color = Hex2rgb(hexColor);
    end
end

function rgb = Hex2rgb(hexStr)
    % ��16������ɫ����ת��ΪRGB��ɫֵ
    % �������:
    % - hexStr: �� '#' ��ͷ��16������ɫ�ַ���
    % �������:
    % - rgb: ��Ӧ��RGB��ɫֵ����
    
    % ȥ��16������ɫ�ַ���ǰ��'#'�ַ�
    hexStr = hexStr(2:end);
    
    % �ֱ�ת����(R)����(G)����(B)��16����ֵ��ʮ����
    r = hex2dec(hexStr(1:2));
    g = hex2dec(hexStr(3:4));
    b = hex2dec(hexStr(5:6));
    
    % ��RGBֵת��ΪMATLAB��ʹ�õķ�Χ[0, 1]
    rgb = [r, g, b] / 255;
end

function colorset = Colorset()
    % ����һ����ɫ����
    % ����ֵ:
    % - colorset: һ�����ж��16������ɫ����ĵ�Ԫ������
    
    colorset = {
        '#934B43';  % ��ɫ
        '#D76364';  % �ۺ�ɫ
        '#EF7A6D';  % �Һ�ɫ
        '#F1D77E';  % ��ɫ
        '#B1CE46';  % ��ɫ
        '#63E398';  % ����ɫ
        '#14517C';  % ����ɫ
        '#2F7FC1';  % ����ɫ
        '#D8383A';  % ��ɫ
        '#C82423';  % �ʺ�ɫ
        '#54B345';  
        '#B883D4';  
        '#3B0BEB';  
        '#000000';  
        '#7303BA';  
    };
end

function DisplayColorCard(colorset)
    % չʾ��ɫ�����е�������ɫ
    % �������:
    % - colorset: ������ɫ�ĵ�Ԫ�����飬����չʾ
    
    figure;
    for i = 1:numel(colorset)
        subplot(1, numel(colorset), i);
        rgb = Hex2rgb(colorset{i});
        patch([0, 1, 1, 0], [0, 0, 1, 1], rgb);
        axis off; % �ر���������ʾ
        title(['NO.', num2str(i)]); % ��ʾɫ����
    end
end