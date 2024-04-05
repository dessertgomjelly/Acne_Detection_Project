# 🫥 Acne_Detection_Project <영상 처리>
Matlab과 Python을 활용한 얼굴 인식 및 여드름 객체 검출 분류 프로젝트
[자세한 프로젝트 리뷰](https://github.com/dessertgomjelly/Acne_Detection_Project/blob/main/acne_detection_%20report.pdf)
<br>

## [배경]
- ### 개발 목적 및 필요성

<img width="500" alt="개발목적 및 필요성" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/4e5720f3-c618-465f-be6e-35eeb334c4f6">

##### 여드름은 비염증성 여드름, 염증성 여드름, 화농성 여드름 3가지 단계로 구성이 되어있습니다. 
##### 단계별로 치료법을 달리 해야한다는 논문에 따라 다양한 영상 처리 기법을 사용하여 여드름을 단계별로 검출해보고자 프로젝트 주제로 선정하게 되었습니다.

<br>

##  [주요 기능]

<br>

### 1. 얼굴 인식

<img width="550" alt="얼굴인식" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/a14486b2-6f5b-4754-b30c-344f15dfaeaf">

<br>

### 2. 여드름 객체 검출 분류
<img width="600" alt="1단계 2단계" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/d48b73f3-c4c7-480c-acc8-3536234598ee">
<img width="600" alt="3단계" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/a76e12b0-6c18-4ea6-abef-90281a4a215d">

<br>

## [프로젝트 진행 기간]
2023.06.12 ~ 2023.06.26 (2주간 진행)

<br>

## [사용 언어 및 기술]
- ### Python
  - MTCNN 라이브러리
- ### Matlab 
  - 얼굴 인식 : Cascade Object Detector 라이브러리
  - 여드름 객체 검출 : HSV영역 변환, 주파수 영역검출, 이진화, 에지 검출

<br>

## [프로젝트 결과]
- ### 주파수 영역 탐지
  - 주파수 성분을 분석하여 1단계인 비염증성 여드름 검출 가능
- ### 색상 탐지
  - 붉은 색상을 활용하여 2단계인 염증성 여드름 검출 가능
- ### 에지 검출 
  - 윤곽을 추출하여 3단계인 화농성 여드름 검출 가능

#### 복합적으로 이러한 탐지 방법을 사용하면 얼굴에서 여드름을 종류에 따라 정확하게 검출할 수 있습니다.

<br>

## [유저 시나리오]
<img width="700" alt="유저 시나리오" src="https://github.com/dessertgomjelly/Acne_Detection_Project/assets/127851446/5cf79c6f-2aa3-4f57-9d05-ebf0de45cb82">

