#1. 개발환경

##1-1. Xcode 둘러보기
* Xcode는 iOS 앱 개발을 위한 기본 IDE.
* 'Welcome to Xcode' 윈도우 설명
* 'New Project' 를 위한 설정
 * Master-Detail
 * Page-Based
 * Single View
 * Tabbed
 * Game
* 'Single View' 선택 후
 * 이름은 'BareBasic'
 * Bundle ID의 구성
 * Language는 Swift로
 * Device는 일단 iPhone으로
 * Core Data, Unit Tests, UI Tests에 대한 간략 설명
* Window 구성
 * Navigator Panel
    * 일단 Project Navigator만 알면 된다
 * Utilities Panel
    * Project Navigator의 선택에 따라 달라진다.
    * File Inspector와 Quick Help Inspector는 비교적 덜 중요
    * 스토리보드 파일을 선택하면 나오는 Identity , Attribute , Size, Connections Inspector가 더 중요함
    * 아래쪽에 붙어있는 4개의 라이브러리 패널중 가장 활용도 높은 건 Object Library
 * Debug Area
    * Variables View는 실행이 멈췄을 때 Heap과 Stack의 오브젝트들을 보여줌
    * Console은 로그 메시지를 보여줌
 * Editor Mode 라디오 버튼
    * Standard Editor
    * Assistant Editor - 주로 UI와 코드를 연결할 때 사용
    * Version Editor - Git나 Mercurial 같은 소스코드 버전 컨트롤을 할 때 사용.

##1-2. 시뮬레이터
 * Run 버튼과 시뮬레이터 선택
 * Window > Scale 메뉴
 * Hardware 메뉴
    * Device
    * Rotate
    * Shake
    * Home
    * TouchID 관련
    * Force Touch 관련
    * 메모리 워닝 발생
    * 전화 걸려온 상황의 시뮬레이션
    * 키보드와 외부 디스플레이
 
##1-3. 스토리보드
 * 캔바스, 씬, 도큐멘트 아웃라인 설명
 * 뷰 선택 후 Attribute Inspector에서 배경색 변경 
 * 레이블 추가한 뒤 Attribute Inspector에서 글자색과 크기, 정렬방식 변경
 * 뷰 추가한 뒤 Attribute Inspector에서 배경색 변경
 * 시뮬레이터 실행
 * 도큐멘트 아웃라인에서 Front/Back 설명
 * Initial View Controller 화살표
 * 작업을 많이 한 스토리보드 보여주며 씬 연결에 대한 개념 설명

##1-4. 오토레이아웃 우회
 * 
