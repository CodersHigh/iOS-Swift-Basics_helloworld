# 1. 개발환경

## 1-1. Xcode 살펴보기
안녕, 링고스타 윤성관
이번 시간을 통해 여러분은 Xcode에서 새로운 프로젝트를 만들고, 프로젝트 윈도우의 구성과 시뮬레이터를 구동하는 것을 배우게 됩니다.


* Xcode는 iOS 앱 개발을 위한 기본 IDE. 현재 7.01이 최신. 항상 최신버전을 사용하므로 중간에 업데이트할 수 있다.
* 'Welcome to Xcode' 윈도우 설명, playground는 swift 언어 연습장. 새로운 Xcode 프로젝트를 만들거나 이미 만들어진  원격 저장소의 협업 프로젝트를 불러오기 할 수 있다. 제외.
* 'New Project' 를 누르면 템플리트 목록이 나온다. 템플리트는 일종의 틀이다. 앱을 만드는 데 필요한 기본 구성요소들을 제공해 줌으로서 보다 쉽게 앱 개발을 시작하도록 한다.
 * Master-Detail : 흔히 프러덕티비티 타입의 앱이라고 하는 업무용 앱을 제작하기 위한 템플리트
 * Page-Based : 책 형태의 앱을 만들기 위한 템플리트, 여러장의 페이지를 넘길 수 있는 뷰 구조.
 * Single View : 기본 뷰 하나가 제공되는 템플리트. 우리가 간단한 기능을 구현해 볼 때 가장 많이 사용해 볼 템플리트.
 * Tabbed : 화면 아래에 탭을 가지는 형태의 뷰 구조를 제공하는 템플리트.
 * Game : 게임 제작을 위한 템플리트. 이번 과정과는 무관.

템플리트는 말 그대로 '틀'이다. 시작점을 제공할 뿐 우리가 얼마든지 확장해 나갈 수 있다.
가장 기본적인 형태를 제공하는 SingleView 템플리트를 선택하자.

* 'Single View' 선택 후
 * 이름은 'BareBasic'
 * 회사 이름과 회사 URL의 역순으로 Bundle ID의 구성. 앱스토어 수백만개 앱들 중에서 나의 앱을 구별할 수 있게 해 준다.
 * Language는 Swift로
 * Device는 일단 iPhone으로
 * Core Data는 sqlite 데이터베이스를 사용할 수 있도록 하는 기술, Unit Tests는 프로그램을 보다 안정적으로 만들어주는 단위 테스트 기술을 제공, UI Tests는 앱의 UI가 정상적으로 동작하는 지 확인할 수 있는 기술. 언젠가 이 기술들의 사용법에 대해서도 알려드릴 기회가 있길 바란다.


* Window 구성
 * Navigator Panel
    * Project Navigator를 주로 사용. 프로젝트를 구성하는 파일들의 목록
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


 * 시뮬레이터
     * Run 버튼을 누르면 시뮬레이터에서 열림

## 1-2. 스토리보드
프로젝트 네비게이터에는 프로젝트 구성요소들이 있다. 이 중 Main.storyboard는 인터페이스 설계 파일.
우리는 대부분의 앱 디자인을 여기에 한다.
 * 캔바스, 씬, 도큐멘트 아웃라인 설명
 * 뷰 선택 후 Attribute Inspector에서 배경색 변경

 미디어 라이브러리. 자주 사용하는 UI 요소들이 모여있는 곳. 드래그 앤 드랍.
 * 뷰 추가한 뒤 색상 변경.
 * 레이블 추가한 뒤 Attribute Inspector에서 글자색과 크기, 정렬방식 변경
 * 시뮬레이터 실행
 * 도큐멘트 아웃라인에서 Front/Back 설명
 * Initial View Controller 화살표
 * 작업을 많이 한 스토리보드 보여주며 씬 연결에 대한 개념 설명

###  오토레이아웃 우회
 * 지금까지 시뮬레이터로 실행했을 때 위치가 이상.
 * 현재의 씬 크기는 추상적인 크기. 이런 사이즈의 장치는 없다.
 * 오토레이아웃이라는 기술을 전제로 한 디자인. 여러 종류의 아이폰 화면 크기와 아이패드 화면 크기를 고려해서 레이아웃을 디자인 할 수 있다.
 * 하지만 오토레이아웃을 배우기 전까지는 임의로 Simulated Matrix 라는 애트리뷰트 값을 시뮬레이터 타겟 디바이스 크기로 맞춰서 단일 사이즈의 아이폰을 대상으로 디자인 하자.


## 1-3 인터렉션
이번 시간엔 스토리보드에서 디자인한 뷰를 코드를 통해 수정해 보자.
코드를 통해 수정하고자 하는 뷰 오브젝트에는 IBOutlet이라는 연결이 있어야 한다. 레이블을 수정하고 싶다면 그 레이블에 이름을 주는 것이다.
버튼 오브젝트는 사용자가 탭 했을 때 액션 함수를 실행하도록 되어 있다. 바로 IBAction으로 연결된 함수다.
연결 실수를 했을 때 수정하는 방법도 알아보자.

* SingleView 템플리트로 프로젝트 생성. HelloiPhone이라고 이름 준다.
*



 ## 1-3. 멀티테스킹


 ## 1-4. 샌드박스



 ### 시뮬레이터
  * Run 버튼을 누르면 시뮬레이터에서 열림
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
