# 3. Single View App
이번 세션에서는 앞서 공부한 개발환경과 Swift언어를 이용해 간단한 예제를 만들어 보려 한다. 이번에 다룰 예제는 MoneyConverter라는 환전 앱이다.



## 3-1. Money Converter 시작하기

### UI 구성
 * 세그먼티드 컨트롤 : 몇 개의 항목 중 하나를 선택해야 할 때. 주로 정렬 방식 정의.
 * 텍스트 필드 : 문자열 입력을 받는다. 다양한 키보드 종류.
 * 버튼 : 사용자의 이벤트를 받는 기본적인 UI 컨트롤. 상태값을 가지고 있다.
 * 레이블  : 문자열 표시를 위한 뷰 오브젝트. 여기서는 결과값을 표시할 것이다.

### 도큐멘트 아웃라인
도큐멘트 아웃라인은 우리가 디자인한 뷰를 계층적으로 보여준다.
어떤 구성요소들이 있는지 자세히 살펴보자

### 아이덴티티 인스펙터
유틸리티 패널의 아이덴티티 인스펙터는 UI요소가 어떤 클래스로 만들어진 오브젝트인지를 보여준다.
작은 화살표로 헤더를 확인한 뒤
레퍼런스 문서를 열어보자


## 3-2. Money Class 제작하기

### 애트리뷰트 인스펙터
* 애트리뷰트 인스펙터는 UI요소들의 설정값을 변경할 수 있다.
* 우리가 디자인한 UI에 있는 구성 요소 하나하나의 설정 값을 변경해서 우리가 원하는 디자인을 구현해 보자.

### 슈퍼클래스의 존재 확인
* 애트리뷰트를 확인하다 보면 유사점을 발견하게 된다.
* 모두 뷰 설정 영역이 있다는 것이고, 사용자 인터렉션을 가지는 오브젝트들은 컨트롤 설정 영역 또한 가지고 있다는 것이다.

### UIKit의 클래스 계층도
* UIKit은 화면 표시를 하는 클래스들이 모여있느 프레임워크이다.
	* UIView에서 화면표시가 시작된다
	* 그러므로 모든 UI들은 UIView 의 자식이다.

* UIControl에서 사용자 인터렉션이 시작된다.
	* 그러므로 모든 사용자 인터렉션을 가지는 오브젝트는 UIControl의 자식이다.
 
 
 
## 3-3. Views & Controls


### 유틸리티 패널의 애트리뷰트 인스펙터
스토리 보드에서 선택한 오브젝트에 대한 설정가능.
상속 계층에 대한 정보 제공.

 * 버튼은 Button - Control - View
 * 레이블은 Label - View
 * 텍스트 필드는 TextField - Control - View

### UIKit의 클래스 계층도
* UIView는 화면 표시의 시작점
 * UILabel은 문자열 표시를 위한 UIView
 * UIImageView는 이미지 표시를 위한 UIView
 * UIWindow는 앱 시작시에 화면을 채우는 UIView
 * UIScrollView는 좁은 화면에 큰 콘텐트를 표시하는 UIView
   
* UIControl은 이벤트 처리를 추상화한 클래스
   * UIButton, UISlider 등 사용자와 인터렉션을 가지는 컨트롤들


## 3-4. Money Structure

### Money 구조체
모든 돈은 기준화폐인 usdollar로 값을 가진다.
usdollar로 그냥 초기화할 수 있는 초기화 메소드와 KRW으로 초기화 할 수 있는 초기화 메소드 만들자.

### Currency Enum
Enum은 RawValue를 가질 수 있다.
USD, KRW, JPY, EUR에 0부터 시작하는 rawValue를 주자.
symbol 변수를 computed property로 문자열 리턴하게 만듬.
ratio 변수도 computed property로 환율을 Double로 리턴하게 만듬.

## 3-5. Money Converter UI

정의한 Enum을 활용해  Money 구조체를 확장한다.

  * 초기화 메소드에 amount와 currency를 함께 받아서 usdollar로 가진다
  * 금액과 화폐 단위를 함께 문자열로 리턴하는 메소드를 추가한다.

소스 파트와 결과 출력 파트를 나눈다.
 
 * 소스 금액을 입력하고 화폐 단위를 세그먼티드 컨트롤에서 선택한다.
 * 변환 버튼을 누르면 4가지 화폐로 환전한 금액을 보여준다.


## 3-6. Money Converter Implment


### guard let의 사용
 * 옵셔널 바인딩인 if let과 유사하게 옵셔널을 해제한 상수를 생성.
 * else 에서 예외적인 부분을 처리하므로 guard let 문을 통과한 경우는 정상적인 경우
 
 
### Source Money에서 Target Money로 변환
 * 세그먼티드 컨트롤의 선택에 따라 소스 Money를 생성.
 * for 문을 이용해 모든 화폐로의 결과값을 생성해서
 * 레이블에 입력

