%Read an image
fname = 'people2_after.jpg';
cropImg = imread(fname);

% 그레이스케일 변환
gray = rgb2gray(cropImg);

% FFT 적용
fftImage = fft2(double(gray));
fftShiftImage = fftshift(fftImage);

% 필터링을 위한 주파수 도메인 마스크 생성
[M, N] = size(fftShiftImage);
centerX = round(M / 2);
centerY = round(N / 2);
radius = 10; % 필터링을 위한 원의 반지름 설정 (예시로 60으로 설정)
mask = ones(M, N);
[x, y] = meshgrid(1:N, 1:M);
dist = sqrt((x - centerX).^2 + (y - centerY).^2);
mask(dist <= radius) = 0;

% 주파수 영역에서 필터링
filtered = fftShiftImage .* mask;

% 역 FFT 적용
filteredShifted = ifftshift(filtered);
filteredImage = ifft2(filteredShifted);
filteredImage = abs(filteredImage);

filteredImage = mat2gray(filteredImage);

% 결과 이미지 출력
subplot(1, 2, 1);
imshow(cropImg);
title('원본 이미지');

subplot(1, 2, 2);
imshow(filteredImage);
title('여드름 추출 결과');

% 사각형 좌표 지정 (볼 부위)
x = 50;  % 시작 x 좌표
y = 20;  % 시작 y 좌표
width = 130;  % 잘라낼 영역의 가로 길이
height = 35;  % 잘라낼 영역의 세로 길이

% 사각형 영역 crop
croppedImage = imcrop(filteredImage, [x, y, width, height]);
croppedImage1 = imcrop(cropImg, [x, y, width, height]);

% 결과 이미지 출력
figure(2);
subplot(1, 2, 1);
imshow(croppedImage1);
title('원본 이미지');

subplot(1, 2, 2);
imshow(croppedImage );
title('여드름 추출 결과');

% 이미지 이진화를 위한 임계값 설정
threshold = 0.1;

% 이미지 이진화
binaryImage = imbinarize(croppedImage, threshold);


% 결과 이미지 출력
figure(4);
imshow(binaryImage);
title('여드름 추출 결과');

% 면적값, 중앙픽셀값 확인
stats = regionprops(binaryImage,{'Area','Centroid'});

% 스트럭처를 테이블로 바꾹기
tab = struct2table(stats);

% sorting 면적을 기준으로
ordered = sortrows(tab, 1, "descend");

figure(5);
imshow(croppedImage1);

% 쌀알 객체 검출
hold on;
num = 20;
title(['Detected pimple : ', num2str(num)]);

for n=1:num
    r = ordered.Centroid(n,1);
    c = ordered.Centroid(n,2);
    text(r, c, '+', 'Color', 'red', 'FontSize', 15);
    %text(r, c, num2str(n));
end

hold off;