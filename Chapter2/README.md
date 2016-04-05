# 2. Swift 기본

## 2-1. Swift
안녕, 링고스타 윤성관
이번 시간에는 Swift 언어에 대한 기본적인 배경, Obj-C가 아닌 Swift 를 배워야 하는 이유에 대해 알아보자

### Swift에 대해 알아보자.
 * 2014년 6월 WWDC를 통해 공개
 * 세련된 문법. 스크립트처럼 보여서 쉽게 접근
 * 막상 해 보니 어렵더라. 이건 몇가지 이유가 있겠지만 Swift가 안전을 위한 장치를 가지고 있고 엄격한 타이핑을 하기 때문.
 * 추가로 말씀드리고 싶은 건, 함수형 언어. 생각의 방식이 바뀌어야 한다.


 * 애플은 왜 Swift를 만들었을까?
  * Objective-C가 언어 사용빈도 순위를 막 치고 올라가는 시점. 1982년 언어 탄생이후 30년 만에 빛 좀 보나?
  * 개발자 커뮤니티에 혼란을 주면서. 발표 당시 개발자들의 표정. 환호 반 멀뚱 반.


* 함수형 프로그래밍이라는 화두
  * 사실 Objective-C도 이미 GCD와 Block 문법을 통해 함수형 언어의 특성을 일부 받아들인 상태.
  * 멀티코어 시대에 Async 한 병렬 처리는 선택이 아닌 필수
  * 수정 가능한 상태의 공유에 대한 위험성을 회피하고자 하는 공감대
  * 시대에 맞는 방식의 프로그래밍 언어 필요


* 하지만 현실은
  * iOS 앱 개발을 위한 API는 대부분 Objective-C 와 C로 작성
    * API를 얼마나 뜯어고쳐야 할까
  * 모든 개발자가 빠르게 따라오지 않는다
    * 개발자 커뮤니티와 함께 가지 않으면 의미 없음


* 그래서 결론은
  * 다양한 채널 블로그, WWDC 비디오 세션등을 통해 개발자 교육
  * Swift 라이브러리 확충
  * 애플이 코딩 패러다임을 바꾸고 싶어하는 것은 확실하나, 개발자들이 얼마나 잘 받아주느냐에 달렸다
  * 우리도 길게 보고 공부하자.


 동영상을 보시는 분들 중에는 Obj-C로 개발을 하고 계신 분들이 있겠지만, 이 코스의 목표는 iOS App을 Swift로 만들어 보는 것.
 Swift 언어에 대해 깊이 파고들지는 않는다.

 Swift를 통해 iOS앱 개발에 처음 발딛는 분들은 물론이고 Obj-C 개발을 경험하신 분들 모두에게 말씀드리고 싶은 것은, Swift로 단지 iOS App 만드는 것에 만족하지 마시고 Swift언어 자체, iOS API를 사용하기 위한 Swift가 아닌 알고리즘 문제 해결을 위한 Swift에 관심을 가져 주길 바란다.



## 2-2. let 과 var
Swift 연습을 위해 Playgrounds를 사용한다. Swift의 연습장이다.
let은 상수이며 var는 변수이다. let으로 정의한 값은 불변. var로 정의한 값은 변경 가능.
우리가 변수를 정의하면 Type은 Inferring 된다.

### Playground
플레이그라운즈는 Swift 연습을 위한 연습장 역할을 한다. 실시간 컴파일되며, 실행 결과를 즉각 보여준다.

* New Playground 선택
* Source editor, Results sidebar
* Quick Look 버튼과 Results 버튼
* Assistant editor 는 XCPlayground의 결과를 보여주는 용도
* print 문의 결과는 Console에

* 이미지, 컬러, File은 리터럴로 간단히 추가 가능
* Playgrounds는 Page 기능도 제공. 앞으로 책처럼 엮여 있는 대용량의 Playgrounds 파일도 보게 될 것.

### let 과 var
* let으로 상수 선언하기
* var로 변수 선언하기
* 선언의 원형 & 생략한 타입 추론
* let을 많이 사용하고 var를 줄이는 게 좋다. 컴파일러도 그렇게 권장한다.

## 2-3. 기본 타입들

### String
문자열 데이터를 다루는 작업은 우리가 앱을 제작할 때 많은 비중을 차지한다. 앱이 다루는 많은 부분이 문자열로 이루어져 있을 뿐만 아니라 파일의 경로나 웹 주소 등도 문자열이기 때문이다.

* 빈 문자열 만들고 문자열 추가하기
* Character 타입의 배열로 변환하기. 글자 수 카운트 하기
* "\\()" 이용해서 문자열 구성하기
* hasPrefix와 hasSuffix


### Numbers
* Int 는 정수 (Int32, Int64) , UInt는 양의 정수
* Float는 32bit 소수, Double은 64bit 소수. 그냥 만들면 Double
* Int를  Float에 더하기

## 2-4. Tuple 타입

### Tuple
* 코마로 구분된 값의 리스트.
* 간단하게 만들어 쓰고 읽을 수 있다.
* element 번호로 접근하거나 만들 때 지정한 이름으로 접근 가능

### typealias
* 간단한 타입 지정
* 예를 들어, Int 타입으로 시간 간격을 나타내고 싶다면, 사실은 Int인 TimeInterval 값을 만들 수 있다.

## 2-5. Collections - 1
* Array
 * Array 정의 방법
   * `Array<Type>()` 또는 `[Type]`
 * Array 의 let과 var
   * Array도 let으로 만들면 수정불가
 * Array 의 Type
   * Array 안에는 동일한 타입의 인스턴스가 들어가야 함

## 2-6. Collections - 2
* Dictionary
	* 키와 값의 쌍으로 이루어진 컬렉션
	* 문자열 키에 정수 값을 가지는 Dictionary의 타입 선언은 [String:Int]
	* Dictionary에 값 추가하기
	* Dictionary에서 값 추출하기
	* keys 와 values로 키, 값 배열 추출하기
* Set
	* 순서를 가지지 않은 컬렉션
	* 주로 집합연산이 필요한 경우 사용한다
		* Intersect, Subtract, Union, ExclusiveOR


## 2-7. Control Flow
흐름제어문에는 조건 분기문과 반복문이 있다. if와 switch는 자주 사용하는 조건 분기문이며 for는 대표적인 반복문이다.

* if 문
	* if condition { ...1 } else { ...2 }
	* condition이 참이면 ...1 실행
	* condition이 거짓이면 ...2 실행
* for 문
	* 조건에 따라 일정 구문을 반복해서 실행
	* Array 컬렉션의 for 문
	* Dictionary 컬렉션의 for 문
* switch 문
	* 하나의 값에 다양한 상태에 대한 매칭.
	* switch 값
	 * case 조건
	* 모든 가능성 있는 조건에 대응하는 구문이 없으면 default로 처리




## 2-8 Optional - 1
옵셔널은 '값이 없는' 상태를 나타낸다. 스위프트를 처음 접하는 사람들을 곤혹스럽게 하는 파트.

* nil
	* '값이 없음'을 나타냄.
	* 모든 타입의 변수는 nil을 가질 수 있다 (Int, 구조체 인스턴스, 오브젝트)
	* nil에 접근시 프로그램이 크래시를 일으킨다.

* 옵셔널 만들기
	* 변수 타입 뒤에 ?를 붙이면 옵셔널이 된다
	* 옵셔널로 선언된 변수는 접근시에 특별한 문법이 필요하다


## 2-9 Optional - 2
옵셔널 변수안에 nil이 아닌 값이 존재한다고 확신할 때 사용하는 옵셔널 접근 방법

 * 하지만 개발자의 확신은 경험적으로 수많은 에러를 만들어 냄
 * 옵셔널을 무력화 하는 시도임

 * ! 가 많은 코드는 나쁜 코드다

## 2-10 Optional - 3
 * Optional Binding
  * if let 으로 옵셔널이 아닌 새로운 상수를 만들어 사용
  * 새롭게 만들어진 상수는 옵셔널이 아니므로 편하게 사용
 * Implicitly Unwrapped Optional
 	* 옵셔널 사용을 편하게 하기 위한 편의장치
 	* 어쩔 수 없이 옵셔널이지만 실행 중 항상 값을 가지는 게 거의 확실
 	* 선언시에 !를 사용하면 옵셔널이지만 옵셔널이 아닌 것 처럼 사용

## 2-11 Function
함수는 입력되는 값에 특정한 작용을 해서 출력값을 만들어 주는 대응 관계이다.

 * Swift 함수의 선언
	* parameterName을 통해 함수로의 입력값이 들어가고, parameter로 사용할 수 있는 타입이 함수 선언시에 결정된다.
	* returnType은 이 함수의 실행결과로 돌려줄 값의 타입이며 이 역시 함수 선언시에 결정된다.

* ratingRecord 함수
	* 매개변수 : history라는 이름의 Double 타입 배열
	* 리턴타입 : 3개의 더블값으로 구성된 튜플

## 2-12 Structure

구조체는 Class와 함께 데이터 모델의 중요한 구성요소 중 하나.

 * 내부에 변수나 상수 또는 함수를  선언한 뒤 인스턴스(Instance)를 만들어서 사용한다.
 * 주로 좌표나 크기처럼 간단한 값을 표현하는 데 많이 사용되어 왔다
 * Swift에서 Class의 대안으로 그 역할이 커지고 있다

* 구조체는 Value Type
	* Value 타입의 인스턴스
		* Int나 Double 과 같이 직접 값을 가지는 것
	* Reference 타입의 인스턴스
		* 인스턴스가 있는 메모리 번지를 참조하는 것	
	* Value 타입은 할당시에 인스턴스가 복사되지만 
	* Reference 타입은 할당시에 참조하는 메모리번지만 전달된다


## 2-13 Class

데이터 모델의 중요한 구성요소로서 Object를 만든다. 
클래스는 객체지향 프로그래밍(OOP, Object Oriented Programming)의 근간을 이룬다.

* 클래스로 만든 오브젝트는 Reference Type으로 동작하며, 할당시 복사되지 않는다.
	* 하나의 인스턴스에 대한 레퍼런스를 공유한다.
	* 인스턴스를 할당한 뒤 수정하면 원본과 할당된 곳 모두 수정됨
	* let으로 정의 해도 프라퍼티가 var이면 수정 가능

## 2-14 Enumeration
연관성 있는 깂들의 그룹을 만들어 Type-Safe 하게 사용하는 것이다. 

* 여러 다른 언어에서 일련의 값에 일대 일 대응되는 Enum을 정의해서 사용
	* Task의 상태값을 나타내기 위해 0, 1, 2등의 정수값을 사용
	* 보다 직관적으로 0은 READY, 1은 COUNTING, 2는 PAUSED, 3은 DONE 과 같이 Enum으로 정의해서 사용하는 방식

* Swift에서 Enumeration은 보다 강력한 기능을 가진다
	* 1st class type
	* 매개변수나 리턴타입으로 사용
	* 메소드를 가진다거나 프로토콜을 준수



## 2-15 Initialize-1
초기화작업은 인스턴스가 가지고 있는 모든 스토어드 프라퍼티(Stored Property)들의 최초 값을 설정하는 것


 * 스토어드 프라퍼티
	 * 저장소를 가지고 있는 프라퍼티
 * 컴퓨티드 프라퍼티
	 * 저장소 없이 계산에 의해 값을 리턴하는 프라퍼티
 
 * 구조체의 초기화
	 * 여러개의 init 메소드 허용
	 * 상속을 허락하지 않으므로 Class에 비해 상대적으로 단순.

 * 클래스의 초기화
  * 하나의 지정초기화  메소드
  * 여러개의 편의 초기화 메소드 허용


## 2-16 Method
* 메소드란 인스턴스 안에 종속된 함수
* 인스턴스에서 필요한 기능들 함수로 만들어 넣은 것
* 클래스, 구조체, 이너머레이션 모두 인스턴스 메소드를 가질 수 있다.
* self는 그 자신을 가리킨다


## 2-17 Enum Associated Value

Enum Associated Value는 Enum의 각 케이스에 값을 할당해서 저장한 뒤 case 사용시 활용하는 것

* TaskType이라는 이너머레이션에 Associated Value를 설정
* Task 구조체 안에 선언한 doBasicTask( )라는 메소드
	* Task의 타입 값에 따라 switch문을 통해 각각 다른 작업을 수행
		* .Call 이면 전화번호를 number 상수로
		* .Report이면 receiver와 time이라는 값
		* .Meet과 .Support의 경우적당한 상수값