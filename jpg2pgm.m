%�ı�ͼ��ߴ�͸�ʽ������
temp = 'C:\Users\Administrator\Desktop\';
for i = 1:10
    path1 = strcat(temp,num2str(i),'.jpg');
    I = imread(path1);
    I = rgb2gray(I);
    I = imresize(I,[112,92]);%�ı�ͼ��ߴ�
    path2 = strcat('D:\',num2str(i),'.pgm');
    imwrite(I,path2);  %�����pgm��ʽ
end