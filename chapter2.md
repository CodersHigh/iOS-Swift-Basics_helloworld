# 2. Swift 기본

## 2-1. Swift 와 Playgrounds
안녕, 링고스타 윤성관

### Swift에 대해 알아보자.
 * 2014년 6월 WWDC를 통해 공개
 * 세련된 문법. 스크립트처럼 보여서 쉽게 접근
 * 막상 해 보니 어렵더라. 이건 몇가지 이유가 있겠지만 Swift가 안전을 위한 장치를 가지고 있고 엄격한 타이핑을 하기 때문.
 * 추가로 말씀드리고 싶은 건, 함수형 언어. 생각의 방식이 바뀌어야 한다.

 동영상을 보시는 분들 중에는 Obj-C로 개발을 하고 계신 분들이 있겠지만, 이 코스의 목표는 iOS App을 Swift로 만들어 보는 것.
 Swift 언어에 대해 깊이 파고들지는 않는다.
 Swift를 통해 iOS앱 개발에 처음 발딛는 분들은 물론이고 Obj-C 개발을 경험하신 분들 모두에게 말씀드리고 싶은 것은, Swift로 단지 iOS App 만드는 것에 만족하지 마시고 Swift언어 자체, iOS API를 사용하기 위한 Swift가 아닌 알고리즘 문제 해결을 위한 Swift에 관심을 가져 주길 바란다.

### Playgrounds
플레이그라운즈는 Swift 연습을 위한 연습장 역할을 한다. 실시간 컴파일되며, 실행 결과를 즉각 보여준다.

* New Playgrounds 선택
* Source editor, Results sidebar
* Quick Look 버튼과 Results 버튼
* Assistant editor 는 XCPlayground의 결과를 보여주는 용도
* print 문의 결과는 Console에

* 이미지, 컬러, File은 리터럴로 간단히 추가 가능
* Playgrounds는 Page 기능도 제공. 앞으로 책처럼 엮여 있는 대용량의 Playgrounds 파일도 보게 될 것.


## 2-2. 기본 타입에 대한 let 과 var
let은 상수이며 var는 변수이다. let으로 정의한 값은 불변. var로 정의한 값은 변경 가능.
우리가 변수를 정의하면 Type은 Inferring 된다.

### let 과 var
* let으로 상수 선언하기
* var로 변수 선언하기
* 선언의 원형 & 생략한 타입 추론
* let을 많이 사용하고 var를 줄이는 게 좋다. 컴파일러도 그렇게 권장한다.

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



## 2-3. Collections
* Array
 * Array 정의 방법
 * Array 의 let과 var
 * Array 의 Type


* Dictionary
