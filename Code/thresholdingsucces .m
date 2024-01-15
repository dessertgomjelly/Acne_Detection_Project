clear;
clc;

% 이미지 로드
img = imread("cropped_face_0 image2.png");

% 사각형 좌표 지정 (볼 부위)
x = 50;  % 시작 x 좌표
y = 55;  % 시작 y 좌표
width = 170;  % 잘라낼 영역의 가로 길이
height = 50;  % 잘라낼 영역의 세로 길이


% 사각형 영역 crop
cropImg = imcrop(img, [x, y, width, height]);
figure(1);
title("crop");
imshow(cropImg);


% 그레이 이미지 변환
if size(cropImg, 3) == 1
    gray = cropImg;
else
    gray = rgb2gray(cropImg);
end

figure(1);
imshow(gray);

% 배경제거
se = strel('disk',8);
background = imopen(gray,se);
R1 = gray - background;
R2 = imadjust(R1);

figure(2);
subplot(1, 2, 1);
imshow(R1);
title('Filtering IMAGE');
subplot(1, 2, 2);
imshow(R2);
title('Adjusted Image');

% 히스토그램
values = double(R2(:));
bin = 256;
histogram = histcounts(values, bin);
% PDF 계산
pdf = histogram / numel(values);

figure(3);
bar(pdf);
title('Probability Density Function (PDF)');
xlabel('Pixel Value');
ylabel('Probability');

% 이진화
%bw = imbinarize(R2);
%bw = bwareaopen(bw,5);

% 이진화(threshold 직접 설정)
threshold = 30; % threshold 값을 80으로 설정
bw = R2 > threshold;
% 개체 제거
bw = bwareaopen(bw, 5);

figure(4);
imshow(bw);

% 면적값, 중앙픽셀값
stats = regionprops(bw, {'Area', 'Centroid'});
% 스트럭처를 테이블로 변환
tab = struct2table(stats);
% 면적을 기준 정렬
ordered = sortrows(tab, 'Area', 'descend');



% 여드름 검출
thresholdArea = 5; % 여드름 객체 면적 임계값 설정
acneMask = [stats.Area] > thresholdArea; % 면적이 임계값보다 큰 객체만 선택
acneCentroids = cat(1, stats(acneMask).Centroid); % 여드름 객체 중심점 좌표

% 결과 출력
figure(5);
imshow(cropImg);
hold on;
plot(acneCentroids(:,1), acneCentroids(:,2), 'rO', 'MarkerSize', 30);
title('여드름 검출 결과');
hold off;