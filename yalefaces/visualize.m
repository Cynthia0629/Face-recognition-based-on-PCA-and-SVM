function visualize(V)  
%��ʾ���������任�ռ��еĻ�����������λ����������  
figure  
img=zeros(112,92);  
for i=1:20  
    img(:)=V(:,i);  
    subplot(4,5,i);  
    imshow(img,[])  
end  
