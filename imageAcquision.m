%������Ƶ����
vid = videoinput('winvideo', 1, 'YUY2_160x120');
%��������ֵ���������ϻ�ȡͼ��
vid.FramesPerTrigger = Inf;
%������ͷ
start(vid);

[faceContainer,label]=ReadFace(41,0);
[pcaA ,V]=fastPCA(faceContainer,20);
[ scaledface] = scaling( pcaA,-1,1 ); 
model = svmtrain(label,scaledface,'-t 0 ');
load ORL\PCA.mat
container = zeros(1,112*92);%һ��Ҫ��ѵ��ʱһ���ȳ�ʼ�����������������ʹ����������һ����������ֱ��ת����double��
faceDetector = vision.CascadeObjectDetector; 
while 1
    frame = getsnapshot(vid);%ץȡͼ��
    I = ycbcr2rgb(frame);%ycbcr��ɫ�ʿռ��һ�֣������ҵļ������ȡͼ�������ָ�ʽ������ת��Ϊrgb��ת��Ϊgray
    I = rgb2gray(I);
    bboxes = step(faceDetector, I);%�����������
    [m,n] = size(bboxes);
    if(m>0)
        crop = imcrop(I,bboxes);%�۳�����ͼ��
        crop_normalize = imresize(crop,[112,92]);%���¶���ߴ磬���ߴ��һ��
        container(1,:) = crop_normalize(:)';%���������
        faceData = (container - meanVec)*V;%��ѵ�����ݵ����������н�ά
        faceData = testscaling( faceData,-1,1 );%��һ��
        [predict_label,accuracy,prob_estimates]=svmpredict(41,faceData,model);%Ԥ��
        if predict_label == 41 
            exp_face = imresize(crop_normalize,[224,184]); 
            imshow(exp_face);
            hold on;
            text(92,15,'ͯС��','horiz','center','FontSize',15,'color','g'); 
        else
            exp_face = imresize(crop_normalize,[224,184]);
            imshow(exp_face);
            hold on;
            text(92,15,'ʶ�����','horiz','center','FontSize',15,'color','g');   
        end         
    end
    if strcmp(get(gcf,'SelectionType'),'alt')%�Ҽ�����¼�
            break;
    end 
end
stop(vid);
