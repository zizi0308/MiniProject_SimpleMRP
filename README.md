# MiniProject_SimpleMRP

## 공정관리 with RaspberryPi
C#과 WPF, Python을 활용하여 라즈베리파이에서 센싱된 컬러값을 통해 성공(Green)/실패(Red)에 따라 생산공정이 실시간으로 제대로 이루어지는지 확인할 수 있는 프로그램을 만들었습니다.
데이터(컬러센싱값)를 터미널인 클라이언트에서 데이터를 수집할 서버로 전달하기 위해 MQTT를 활용했습니다. 수집된 데이터는 프로그램에 적용될 뿐만아니라 DB에서도 연동되게 만들었습니다.


-------------------------------
## 1. 초기화면

![First_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EC%B4%88%EA%B8%B0%ED%99%94%EB%A9%B4.png)

첫 화면입니다. 공장의 스케줄을 지정할 수 있는 공정계획, 생산공정을 실시간으로 확인하기 위한 공정 모니터링, 공정에 대한 전체값을 차트로 나타낸 리포트부분, 공장을 추가/제거 할 수 있는 설정부분으로 구성했습니다. 

</br>
</br>


## 2. 공정 계획

![Plan_Images_1](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EC%8A%A4%EC%BC%80%EC%A4%84%EC%9E%85%EB%A0%A5.gif)</br></br>
![Plan_Images_2](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EC%8A%A4%EC%BC%80%EC%A4%84_%EC%9E%85%EB%A0%A5%EA%B2%BD%EA%B3%A0.gif)

공정계획화면입니다. 공정일자 검색기능과 공정의 신규(추가), 입력(저장), 수정(변경)기능으로 구성되어 있으며, ValidationCheck를 통해 잘못된 데이터가 들어오는 것이 방지하도록 구현했습니다.

</br>
</br>

## 3. 공정 모니터링

![Monitor_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EA%B3%B5%EC%A0%95%EC%8B%9C%EC%9E%91%EC%95%8C%EB%A6%BC.png)

공정 모니터링 화면입니다. 처음 누르면 날짜와 시작알림 창이 나오도록 만들었습니다.
</br>
</br>

## 4. 공정 진행

![MQTT_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/mqtt.gif)

#### 공정 진행 순서</br>
1. 라즈베리파이에 컬러감지 센서 모듈 연결
2. 라즈비안Os와 vncServer를 활용해 라즈베리파이 내부의 파이썬 코드실행
3. MQTT Explorer에 만들어둔 Connections에 connect
4. Visual Studio에서 FrmMain과 공정모니터링 실행 (FrmMain을 통해 DB에 센싱값 반영)
5. 센싱이 성공되어 값이 반영되면 위에 있는 센서이미지가 깜빡임
6. 2초 이후 성공과 실패여부가 박스색깔에 반영됨 (GREEN : 성공 / RED : 실패)

### 4-1. 공정 성공

![Success_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4_%EC%84%B1%EA%B3%B5.gif)

공정이 성공했을때 나타나는 애니메이션입니다. 박스가 초록색으로 변합니다. 

</br>
</br>

### 4-2. 공정 실패

![Fail_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4_%EC%8B%A4%ED%8C%A8.gif)

공정이 실패했을때 나타나는 애니메이션 입니다. 박스가 빨간색으로 변합니다.

</br>
</br>

## 5. 공정 리포트

![Report_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EB%A6%AC%ED%8F%AC%ED%8A%B8_%EB%B7%B0.png)

공정의 결과를 LiveChart를 이용해 나타내었습니다. 날짜별 검색이 가능하며, ValidationCheck를 통해 현재 날짜까지만 검색이 가능하도록 만들었습니다. 

</br>
</br>

## 6. 설정

![Setting_Images_1](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EC%84%A4%EC%A0%95%EC%9E%85%EB%A0%A5%EB%B0%8F%EC%82%AD%EC%A0%9C.gif)</br></br>
![Setting_Images_2](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/%EC%84%A4%EC%A0%95_%EC%9E%85%EB%A0%A5%EA%B2%BD%EA%B3%A0.gif)


설정페이지를 통해 공장과 생산설비의 신규, 입력, 수정, 삭제가 가능하며 ValidationCheck를 통해 잘못된 데이터가 들어오는 것을 방지하도록 만들었습니다. 또한, 코드명 검색기능을 통해 설비나 공장의 검색이 가능하도록 만들었습니다.

</br>
</br>

## 7. DB화면

![DB_Image](https://github.com/zizi0308/MiniProject_SimpleMRP/blob/main/images/DB%ED%99%94%EB%A9%B4%EA%B2%B0%EA%B3%BC.png)

공정실행 후의 DB화면입니다.

[DB 스키마 바로가기](https://github.com/zizi0308/MiniProject_SimpleMRP/tree/main/MRPApp/Query)
</br>
</br>





