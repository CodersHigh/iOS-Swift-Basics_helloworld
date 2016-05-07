# 4. TableView 기초
이번 세션에서는 iOS 앱에서 가장 널리 사용되는 UI요소인 테이블 뷰에 대해 알아보자.



## 4-1. 테이블 뷰 소개
이번 시간에는 테이블 뷰를 알아보자.

좁은 화면에 큰 콘텐트를 표시하기 위한 UIScrollView를 서브클래스해서 많은 데이터를 효율적이고 빠르게 표시할 수 있도록 만든 서브클래스이다.

Plain 스타일과 Grouped 스타일

구성요소

* 테이블 헤더
* 테이블 푸터
* 섹션
	* 섹션 헤더
	* 섹션 푸터
	* 테이블 셀

테이블 셀은 4가지 형태

* Basic
* Subtitle
* RightDetail
* LeftDetail
* **+ Custom Cell**

UITableViewCell은

* UIView의 서브클래스
* 테이블 뷰 안에서 반복적으로 표시
* 재사용성에 초점

UITableViewCell의 구성

* Background View
* Selected Background View
* Content View
* Editing Control , Accessory View, Reordering Control

테이블 뷰의 셀 스타일

* Static Cell : 앱 실행 중 내용이 변동되지 않을 때
* Dynamic Prototype : 앱 실행 중 셀이 수정/삭제 등 변경될 때

## 4-2. Static 테이블 뷰
스태틱 테이블 뷰 를 만들어 봄으로써 테이블 뷰에 익숙해 지는 시간을 가지자.


### 테이블 뷰 컨트롤러
* SingleView 프로젝트를 만든 뒤 TableViewController를 하나 더한다. 스태틱한 테이블 뷰는 TableViewController를 이용하는 경우에만 만들 수 있다.
* **TableView 오브젝트**를 선택한 뒤, Static Cells 를 선택한다. 
* 테이블 뷰 셀의 스타일을 선택한 뒤, 내용을 변경한다.
* 기본으로 제공되는 것 외에 원하는 모양의 테이블 뷰 셀을 만들고 싶다면 커스텀 셀을 선택한다.

### 테이블 뷰 구성요소
* 섹션을 추가할 수 있다. 섹션의 헤더와 섹션의 푸터를 넣어본다.
* 테이블 의 헤더와 테이블 푸터를 더해본다.
* 그룹드 스타일의 테이블 뷰를 만들어 본다.
 
 
 
## 4-3. Dynamic 테이블 뷰
다이나믹 테이블 뷰가 우리가 배워야 하는 진짜 테이블 뷰. 

스태틱은 가끔 그런식으로 쓸 때도 있다. 또는 간략하게 앱을 프로토타입 해  볼 때 사용.
애초에 스태틱이 나오게 된 것도 테이블 뷰를 표시하기가 그만큼 어렵기 때문.

테이블 뷰가 여타 다른 UI들과 다른 부분은 우리가 직접 값을 넣어주는 게 아니라 테이블 뷰의 응답에 대응하는 방식으로 표시한다는 것이다.

레이블에는 직접 String을 넣어주면 되고, 이미지 뷰에는 직접 UIImage 오브젝트를 넣어주면 된다. 하지만 테이블 뷰는 우리가 직접 셀을 꾸며서 넣어주는 방식이 아니라 테이블 뷰의 요청에 대한 응답을 준비하는 방식으로 표시한다.

테이블 뷰의 표시 방법을 알아보자.

### 다이나믹 테이블 뷰의 동작방식

1. 테이블 뷰가 리로드될 때 자신을 뿌릴 책임을 가진 데이터소스에게 섹션의 갯수를 물어본다.
2. 각 섹션에 필요한 로우의 갯수를 물어본다.
3. 각 로우에 뿌릴 테이블 뷰 셀을 만들어 달라고 요청한다. 


왜 테이블 뷰는 이런 방식으로 표시할까?

테이블 뷰의 속성에 대해 생각해 보자. 테이블 뷰는 유사한 형태의 뷰가 반복적으로 엄청 많이 표시될 것을 전제로 디자인 된 뷰 오브젝트이다. 

예를 들어 10개 섹션에 섹션당 1~200개의 셀을 가진 테이블 뷰가 있다고 가정하자. 

화면에 테이블 뷰가 나타날 때 3번 섹션의 85번 셀 부터 95번 셀까지 표시될 예정이라면 다른 영역의 데이터는 필요 없이 해당 셀을 표시할 수 있는 데이터만 필요할 것이다. 

이것은 우리가 직접 알 수 있는 정보는 아니며, 테이블 뷰가 화면을 갱신하면서 스스로 판단할 수 있는 정보이다. 그래서 테이블 뷰가 데이터와 뷰를 요청하고 우리는 거기에 응답하는 방식으로 테이블 뷰가 업데이트 되는 것이다.

이 구현들을 **테이블 뷰 데이터소스 프로토콜** 이라고 한다.

## 4-4. Master-Detail 템플리트 분석 - 1
Master-Detail 프로젝트 템플리트는 항목을 나열하는 테이블 뷰와 선택시 자세한 뷰를 보여주는 일반적인 업무용(프러덕티비티 타입) 앱의 전형을 보여준다.

*스플릿 뷰 컨트롤러는 아이패드나 iPhone 6 Plus에서 좌우로 나눠진 UI를 표시하기 위한 것이므로 일단은 무시하자*

앞쪽의 테이블 뷰는 UITableViewController의 서브클래스인MasterViewController가 관리하는 씬이다.

테이블 뷰 데이터 소스 프로토콜 메소드들을 찾아보자.



## 4-5. Master-Detail 템플리트 분석 - 2

테이블 뷰의 데이터 소스는 어떻게 지정되는지 살펴보자.

테이블 뷰를 선택한 뒤, **유틸리티 패널**에서 **커넥션스 탭**을 보면 테이블 뷰에 대한 dataSource와 delegate 연결을 확인할 수 있다.

섹션의 갯수와 로우의 갯수를 임의로 조정해서 테이블 뷰가 변하는 것을 확인해 보자.



## 4-6. Dynamic 테이블 뷰 구현 - MeetingRooms1

###SingleView Application 만들기
* 단순한 스토리보드를 위해 SingleView Application에서 시작하자.
* 기존의 ViewController를 없애고 UITableViewController를 하나 추가한다.


###UITableViewController 추가하기
File > New File > CocoaTouch Class로 UITableViewController의 서브클래스를 만든다.

* meetingRooms는 [String:Int]형태의 딕셔너리로 만든다.
* 섹션 1짜리 테이블 뷰를 요청하고 meetingRooms의 갯수만큼의 로우를 만든다.
* 셀에 표시할 룸의 정보를 읽어온 뒤 cell의 textLabel과 detailTextLabel에 각각 뿌린다.

###셀의 재사용 identifier 설정
* 스토리보드에서 Cell의 attribute 인스펙터에서 재사용 identifier 로 MyCell 설정
* 데이터 소스 프로토콜에서 셀의 재사용 identifier를 MyCell로 설정


## 4-7. Dynamic 테이블 뷰 구현 - MeetingRooms2

###섹션구분
* meetingRooms는 섹션을 표시하기 위해 **[String:[String:Int]]** 형태의 딕셔너리로 만든다.
* 섹션의 갯수는 meetringRooms에 있는 딕셔너리의 갯수
* 로우의 갯수는 meetringRooms의 값(MeetingRoom 또는 Seminar 의 값)으로 이루어진 배열에서 섹션에 해당하는 항목 갯수
* 셀의 표시할 항목은 meetringRooms의 값으로 이루어진 배열에서 섹션에 해당하는 항목중 로우 번째에 있는 항목


## 4-8. Dynamic 테이블 뷰 구현 - MeetingRooms3 

###데이터소스 문서 보기
* 데이터소스 프로토콜이 선언된 레퍼런스 문서 찾아보기 : option - 클릭 후 레퍼런스 열기
* required는 프로토콜 준수시 반드시 구현해야 하는 메소드

###헤더와 푸터 구분
* tableView:titleForHeaderInSection: 을 통해 헤더 문자열을 리턴할 수 있고 tableView:titleForFooterInSection:을 통해 푸터 문자열을 리턴할 수 있다.

###델리게이트 문서 보기
델리게이트에는 데이터소스만으로는 얻을 수 없는 다양한 테이블 뷰의 기능들이 나열되어 있다.
델리게이트 문서의 메소드들을 확인해서 우리가 테이블뷰로 할 수 있는 다양한 기능의 목록을 살펴보자.
