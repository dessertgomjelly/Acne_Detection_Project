clear;
clc;

% 이미지 로드
img = imread("cropped_face_01.png");

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

% 색상 공간 변환 (예: RGB에서 HSV로 변환)
hsvImg = rgb2hsv(cropImg);

figure(2);
imshow(hsvImg);

% 여드름을 대표하는 색도 범위 정의 (예: 적절한 색도 범위를 선택하여 설정)
lowerHue = 0.005;  % 여드름 색도 범위의 하한값
upperHue = 0.028;  % 여드름 색도 범위의 상한값

% 색도 범위 내에 있는 픽셀 탐지
mask = (hsvImg(:, :, 1) >= lowerHue & hsvImg(:, :, 1) <= upperHue);

% 탐지된 여드름 영역 표시
detectedImg = cropImg;

% "+" 모양으로 여드름 영역 표시
[row, col] = find(mask);
for i = 1:length(row)
    detectedImg(row(i), col(i), :) = [255, 0, 0];  % 여드름인 영역을 빨간색으로 표시
    detectedImg(max(1, row(i)-1), col(i), :) = [255, 0, 0];  % 세로 + 표시 (위쪽 픽셀)
    detectedImg(min(size(detectedImg, 1), row(i)+1), col(i), :) = [255, 0, 0];  % 세로 + 표시 (아래쪽 픽셀)
    detectedImg(row(i), max(1, col(i)-1), :) = [255, 0, 0];  % 가로 + 표시 (왼쪽 픽셀)
    detectedImg(row(i), min(size(detectedImg, 2), col(i)+1), :) = [255, 0, 0];  % 가로 + 표시 (오른쪽 픽셀)
end

% 결과 출력
figure(3);
subplot(1, 2, 1);
imshow(cropImg);
title('Original Image');
subplot(1, 2, 2);
imshow(detectedImg);
title('Detected Acne');