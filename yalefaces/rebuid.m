%�������ɷַ����������ؽ���kΪ�ؽ�������ά
function rebuid(y,k)
load ORL/PCA.mat%����ƽ������meanVec�����ɷ�����V
temp = meanVec;
for i = 1:k    
    xi = (y - meanVec) * V(:,i);%ĳ����y�ڵ�iά��ͶӰֵ
    yi =  xi * V(:,i)';%ĳ����y�ڵ�iά������ֵ
    temp = temp + yi ;%�Ը�����ͶӰ������ά����������һ��ʸ����ӣ��õ�������������һ������ֵ
end
%��ʾ�ؽ�����
I = zeros(112,92);
I(:) = temp';
imshow(I,[]);
