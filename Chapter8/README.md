# 8. 저장
iOS 에서 사용하는 다양한 저장방식을 알아보고 구현해 봅시다

## 8-1. 저장하기 오버뷰

###시리얼라이즈
* 간단한 데이터 저장을 위한 방식
* 참조점을 기록하지 않으므로 읽어낼 때 동일 오브젝트를 직접 매칭해야 함
* XML , text 파일, UserDefault

###아카이브
* 오브젝트 간 관계를 저장하므로 복잡한 오브젝트 그래프를 복구할 수 있음
* NSCoding 프로토콜 준수
* NSKeyedArchiver , NSKeyedUnarchiver
* UIDocument

## 8-2. 앱 수명 주기

###Fast App Switching
앱은 홈 버튼을 누르면 종료되지 않고 메모리에 서스펜드 되거나 백그라운드에서 특정 동작을 하는 상태로 남아있다.
이 상태에 있는 앱들은 우리가 다시 앱을 불러들이면 빠르게 재개된다.
애플리케이션의 다양한 수명 주기와 그 특징에 대해 알아보자

###Not Running
* 앱은 화면을 점유하지 않고 메모리도 점유하지 않은 상태
* 즉, 앱이 실행되기 전 상태

###Foreground
* 앱이 메모리를 점유하고 있으며, 화면도 점유하고 있는 상태
* Active
	* 사용자가 앱을 컨트롤할 수 있는 상태
	* 앱이 일반적으로 실행중인 상태
* Inactive
	* 앱이 화면을 점유하고 있으나
	* 사용자가 컨트롤할 수 없는 상태
	* 외부 노티피케이션, 알람, 전화 수신등

###Background
* 앱이 메모리에는 올라가 있으나, 화면을 점유하지 못한 상태
* Suspend
	* 일반적으로 백그라운드 모드에 들어간 앱들은 메모리를 차지하고 대기상태로 있다
* Running
	* 몇 몇 앱의 경우 백그라운드에서 특정한 작업을 할 수 있도록 허락받았다


###AppDelegate
* 애플리케이션의 델리게이트 역할을 맡은 오브젝트
* 애플리케이션의 라이프 사이클의 각 단계에서 델리게이트 프로토콜 메소드 호출을 받게 된다.
* 앱에서 가장 먼저 만들어지고 가장 마지막까지 남아있는 오브젝트



## 8-3. User Default 1
UserDefault는 싱글턴으로 접근가능하며 자동으로 저장되는 수정가능한 Dictionary라고 생각할 수 있다

User Dafault는 시리얼라이즈 방식으로 저장하므로 조그만 데이터만 저장할 수 있다.

###앱의 Global Tint Color 저장
* Tint Color를 변경할 수 있는 세그먼티드 컨트롤 
* 컬러 값 저장을 위한 Enum 생성
* 세그먼티드 컨트롤의 값과 매칭되도록 Raw 값을 Int로 설정



## 8-4. User Default 2

###Tint Color 값을 User Default 에 저장하기
* 세그먼티드 컨트롤의 설정값은 정수형태로 User Default에 저장
* Tint Color의 변경 값은 윈도우에 설정하는 것이므로 
	* UIApplication 싱글턴에 접근해서 
	* keyWindow를 얻어온 뒤 globalTintColor 설정
* applicationDidFinishLaunchingWithOption: 메소드에서는 아직 윈도우가 만들어지지 않았으므로 applicationDidBeconActive: 메소드에서 Tint Color를 설정해야 함


## 8-5. Plist 읽기
Plist, Property List 는 Apple이 선언한 XML 의 데이터 타입이다.

* Plist를 읽으면 Array또는 Dictionary로 읽어지며, 
* Array나 Dictionary를 writeToFile:로 시리얼라이즈하면 Plist가 만들어진다

###장비리스트 Plist 읽기
* 스태틱하게 표시했던 장비 리스트 탭의 내용을 Plist로부터 읽어서 표시
* File > New File 을 한 뒤, iOS - Resource에서 Property List를 찾는다.
* 장비 리스트 씬을 관리할 EquipmentListViewController를 UITableViewController의 서브클래스로 만든다
* NSBundle.mainBundle() 로부터 plist 경로 확인
* Plist를 읽으면 NSDictionary가 읽어짐
	* NSDictionary는 Dictionary<String, AntObject>로 타입 캐스팅 가능

## 8-6. 아카이브 1
우리의 데이터 모델 클래스들은 서로간에 포함관계를 가지고 있다.
이 포함관계를 유지한 채로 저장하고 읽어내려면 아카이빙을 해야 한다.

아카이브를 만들기 위해서는 NSCoding 프로토콜을 준수해야 한다. 우리가 만든 클래스들은 기본적으로 NSCoding 프로토콜을 준수하지 않는다.

###NSCoding
* NSObject의 서브클래스만 NSCoding프로토콜 준수 가능
* encodeWithCoder:에 저장할 테이터를 넘긴다
 * 아카이브에 포함되는 모든 오브젝트들은 NSCoding을 준수해야 함
* initWithCoder:에서 필요한 데이터를 가져온다.


## 8-7. 아카이브 2

###도큐멘트 폴더에 접근하기
* 샌드박스 내에서 우리 데이터를 저장하기 가장 좋은 장소
* NSSearchPathForDirectoriesInDomain 함수를 통해 경로를 얻어와야 함
	* 샌드박스의 절대 경로는 다른 방법으로 얻어올 수 없다
	* 배열이 리턴되는데, 정상적인 경우라면 하나의 경로 값만 있다

### NSFileManager로 파일 존재 확인
* 파일의 이동, 삭제, 폴더의 생성 등을 위한 클래스
* 기존에 저장한 파일이 있는지 확인
	* 있으면 읽고
	* 없으면 초기 데이터를 만든다

## 8-8. 아카이브 3

###NSCoding 준수 확인
* 코코아 클래스중 저장이 필요한 대부분의 클래스들은 이미 NSCoding 프로토콜 준수
	* NSString, NSData, NSArray, NSDate 등
	* UIView, UIViewController 등
	* 하지만 NSTimer, NSFIleManager 등은 준수하지 않음
* NScoding 프로토콜의 준수 확인은 레퍼런스 문서를 통해 할 수 있다

###저장하기
* 사용자의 데이터는 중요하므로 애플리케이션의 각 단계마다 저장하자 
	* 종료될 때
	* 백그라운드로 들어갈 때
	* 새로운 데이터를 만들 때
	* 데이터를 수정할 때
* 가능한 자주 저장하자


