
disp('��ȡѵ������...')
disp('......') 
[train_faceContainer,train_label] = ReadFace(41,0);

disp('ѵ������PCA��ά...') 
disp('......') 
[pcaA ,V]=fastPCA(train_faceContainer,20);

disp('��ʾ���ɷ���...') 
disp('.......') 
visualize(V);%��ʾ��������  ,��������

disp('ѵ�����ݹ�һ��...');
disp('.........') 
[ scaledface] = scaling( pcaA,-1,1 );

disp('SVM����ѵ��...')  
model = svmtrain(train_label,scaledface,'-t 0 ');

disp('��ȡ��������...')  
[test_faceContainer,test_label]=ReadFace(40,1);

disp('��������pca��ά...') 
disp('.......') 
load 'ORL/PCA.mat'
testData = (test_faceContainer - repmat(meanVec,200,1)) * V;

disp('�������ݹ�һ��...')  
disp('.......')  
scaled_testData = testscaling( testData,-1,1);

disp('SVM��������Ԥ��...')
disp('......')  
[predict_label,accuracy,prob_estimates]=svmpredict(test_label,scaled_testData,model);

