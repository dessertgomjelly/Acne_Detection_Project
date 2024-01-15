% 이미지 불러오기
img = imread('rice1.png');

% 얼굴 검출기 생성
faceDetector = vision.CascadeObjectDetector();

% 얼굴 검출
bbox = step(faceDetector, img);

% 검출된 얼굴 표시
imgWithFaces = insertShape(img, 'Rectangle', bbox);

% 검출된 얼굴 저장
for i = 1:size(bbox, 1)
    % 검출된 얼굴의 좌표
    x = bbox(i, 1);
    y = bbox(i, 2);
    w = bbox(i, 3);
    h = bbox(i, 4);
    
    % 검출된 얼굴 이미지 추출
    face = img(y:y+h-1, x:x+w-1, :);
    
    % 얼굴 이미지 저장
    imwrite(face, ['detected_face_' num2str(i) '.jpg']);
end