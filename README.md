# 🫥 Acne_Detection_Project
Matlab과 Python을 활용한 얼굴 인식 및 여드름 객체 검출 분류 프로젝트


##  주요 기능
1. 얼굴 인식

<img width="550" alt="얼굴인식" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/a14486b2-6f5b-4754-b30c-344f15dfaeaf">

2. 여드름 객체 검출 분류
<img width="600" alt="1단계 2단계" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/d48b73f3-c4c7-480c-acc8-3536234598ee">
  <img width="600" alt="3단계" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/a76e12b0-6c18-4ea6-abef-90281a4a215d">

## 사용 언어 및 기술
- Python
  - MTCNN 라이브러리
- Matlab 
  - 얼굴 인식 : Cascade Object Detector 라이브러리
  - 여드름 객체 검출 : HSV영역 변환, 주파수 영역검출, 이진화, 에지 검출

## Team
201810866 김 건
201810876 문성준
201810890 정우성

## Description
- 개발 목적 및 필요성
-  <img width="500" alt="개발목적 및 필요성" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/4e5720f3-c618-465f-be6e-35eeb334c4f6">
- 주파수 영역 탐지는 주파수 성분을 분석하여 비염증성 여드름을, 색상 탐지는 붉은 색상을 활용하여 염증성 여드름을, 에지 검출은 윤곽을 추출하여 화농성 여드름을 잘 검출하는 특징을 가지고 있었습니다. 따라서 복합적으로 이러한 탐지 방법을 사용하면 얼굴에서 여드름을 종류에 따라 정확하게 검출할 수 있을 것이다.
