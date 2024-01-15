clear;
clc;

% 이미지 로드
img = imread("cropped_face.png");

% 사각형 좌표 지정 (볼 부위)
x = 100;  % 시작 x 좌표
y = 30;  % 시작 y 좌표
width = 170;  % 잘라낼 영역의 가로 길이
height = 60;  % 잘라낼 영역의 세로 길이


% 사각형 영역 crop
cropImg = imcrop(img, [x, y, width, height]);
figure(1);
title("crop");
imshow(cropImg);

% 그레이스케일 변환
grayImg = rgb2gray(cropImg);
figure(2);
title("그레이 스케일");
imshow(grayImg);

% 전처리: 블러링(가우스필터링)
blurImg = imgaussfilt(grayImg, 3);  % 블러링을 통해 부드러운 피부 영역을 보존

% 에지 검출
lowThreshold = 0.05;  % 낮은 임계값
highThreshold = 0.5;  % 높은 임계값
edgeImg = edge(blurImg, 'Canny', [lowThreshold highThreshold], 'thinning');
figure(3);
title("에지검출");
imshow(edgeImg);

% 여드름 검출
thresholdArea = 5; % 여드름 객체 면적 임계값 설정
cc = bwconncomp(edgeImg); % 객체들을 연결된 구성 요소로 분리
stats = regionprops(cc, 'Area', 'Centroid'); % 객체의 특성 추출 (면적, 중심점)
acneMask = [stats.Area] > thresholdArea; % 면적이 임계값보다 큰 객체만 선택
acneCentroids = cat(1, stats(acneMask).Centroid); % 여드름 객체 중심점 좌표

% 결과 출력
figure(4);
imshow(cropImg);
hold on;
plot(acneCentroids(:,1), acneCentroids(:,2), 'rO', 'MarkerSize', 30);
title('여드름 검출 결과');
hold off;