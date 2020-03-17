clear
clc
N = (10-5)/0.01; %1修改
a = 1;
for i = 3 : 15   %2此处修改人数,如果人数是30至50人，则修改为30 ： 50
    n = i;
    H = i * 4176846;      %3此处修改资金
    Y = mod(H+n,1+N);
    k1 = Y*0.0001 + 0.05;  %4 第四步：计算K1值。K1值计算式为K1＝Y×0.01%＋a%
    m = 1;
    for k2 = 0.05 : 0.001 : 0.1  %5此处修改K2区间
        for d = 0.1: 0.1: 0.9
            k(m,1) = k2;
            k(m,2) = d;
            k(m,3) = k1*d+k2*(1-d);
            k(m,4) = m;
            m = m + 1;
        end
    end
%     for ii = 1:length(k)
%         if k(ii,3) < 0.08 | k(ii,3) > 0.12  %此处修改区间范围
%             k(ii,3) = NaN;
%         end
%     end    
%     figure
%     histogram(k(:,3))
%     xlabel('k值');ylabel('频数（次）');    
%     k(k(:,3) < 0.08,:) = [];% 小于8的剔除   
%     k(k(:,3) > 0.1,:) = []; % 大于10剔除
    
    KK(a,1) = mode(k(:,3));
    k(k(:,3)==KK(a,1),:) = [];
    KK(a,2) = mode(k(:,3));
    k(k(:,3)==KK(a,2),:) = [];
    KK(a,3) = mode(k(:,3));
    a = a + 1;
end
xlswrite('k结果.xlsx',KK)

