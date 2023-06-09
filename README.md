![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&width=100%&height=300&section=header&text=AppStore&fontSize=90&descAlignY=70)

## 프로젝트 소개 📱
- Apple Itunes API를 사용하여, 앱스토어 내의 앱을 검색, 그리고 상세화면까지 보여줍니다.
- 진행기간: 2023.05 - 2023.06
- 개발환경
    - Swift
    - Deployment Target: 15.0
    - Architecture: MVVM-C
    - 프레임워크: Combine
## 한눈에 보기 👀
- 코드로 UI를 구현했습니다.
- MockURLSession을 활용하여 네트워크 테스트 및 테스트코드를 작성했습니다.
- 실제 앱스토어의 검색화면을 구현했습니다.
- 검색화면은 TableView와 SearchController로 구성되어 있습니다.
- 앱 평점을 별이미지로 나타냈고, 단위를 환산하여 보여줍니다.
- 상세화면은 CustomView, 가로 ScrollView, TextView, CollectionView, TableView로 구성되어있습니다. 
- 상세화면에서는 각 앱의 최소 구동 OS를 보여줍니다.
- 카테고리 항목별 이미지를 배치하여 손쉬운 이해를 돕습니다.
- 가로 ScrollView를 활용하여, 평점, 연령, 카테고리, 언어 등 주요 정보를 보여줍니다.
- CollectionView를 활용하여, 미리보기 이미지를 보여줍니다.
- TableView를 활용하여, 앱의 정보를 보여줍니다.
- 이미지 Cache를 구현하였습니다.
- 다크/라이트 모드에 대응합니다.



## 구동 화면 🖥

<img src="https://github.com/oksunwoo/Turtle_Neck/assets/55880539/707970fb-fde7-4f12-b523-c7e4544ca3fb" width="30%" height="30%"/> <img src="https://github.com/oksunwoo/Turtle_Neck/assets/55880539/a92a8094-38b7-404b-b1c9-e0b79764c5f1" width="30%" height="30%"/>





## 구현 내용 ✏️
> Part 1 - 전반적인 부분
### 1. MVVM-C
Coordinator 패턴을 적용하여 의존성 주입을 관리하고, 화면전환 역할을 하며, View끼리 의존관계를 낮추려고 했습니다. 이를 위해 navigationController를 생성자 주입 방식으로 하위 Coordinator에게 전달합니다.

검색 -> 상세 순으로 연결되므로 각 상위 Coordinator의 childCoordinator에 하위 Coordinator를 추가했습니다. 

### 2. Swift + Combine
Apple의 First-Party 프레임워크인 컴바인을 사용했습니다. 비동기 작업을 처리하였으며, 서버에서 받아온 데이터를 Publisher타입으로 반환하고, ViewModel 및 ViewController를 Binding 하여 화면에 나타내도록 구현하였습니다. 또한 사용자 이벤트 처리를 위해서 ViewController에서 PassthroughSubject를 활용했습니다.


### 3. Apple API
Apple의 [iTunes Search API](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html)를 활용하였습니다. 
API는 열거형으로 관리하는 경우, 새로운 case를 생성할때마다 관련된 switch문을 매번 수정해야하는 번거로움이 존재합니다. 이를 구조체 타입으로 만들고, Protocol을 활용함으로써 코드유지 보수가 용이하며, 문제 발생 시 빠르게 해결할 수 있는 장점이 존재합니다.

### 4. TestCode

올바르게 작동하는지 테스트를 위해, 디코딩테스트, MockURLSession 테스트, 실제 네트워크 테스트를 진행했습니다.

MockURLSession은 다음과 같은 이유로 작성했습니다.
- 실제 서버와 통신할 경우 테스트의 속도가 느려짐
- 인터넷 연결상태에 따라 테스트 결과가 달라지므로 테스트 신뢰도가 떨어짐


> Part 2 - 검색 화면 부분
### 1. UISearchController
검색창에 터치를 하게 되면, 검색창이 상단으로 올라가는 애니메이션을 위해 UISearchController로 구현하였습니다.

<img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/34981048-b96f-44d0-b91c-174412027e4c" width = "25%" height= "25%">    <img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/7798bb54-6989-4b9c-baf6-efd011ceb4d1" width = "25%" height= "25%">

### 2. ImageCache
앱의 썸네일을 매번 서버로부터 요청받아 화면에 띄우는 것은 비효율적이라고 생각을 하여, NSCache를 이용하여 메모리 캐시를 도입했습니다. 메모리에 이미지가 존재한다면 이미지를 반환해주고, 존재하지 않는다면 서버에 요청해 이미지를 받아옵니다. 요청 시 이미지를 성공적으로 받아왔다면 캐시에 저장하여 다음번에 이미지를 사용하는 경우 캐시에서 이미지를 받아올 수 있도록 했습니다.

### 3. StarImageView
앱 검색 시 나타나는 별점을 StarImageView를 통해 구현했습니다. 평점 데이터를 받아 필요한 개수만큼의 별을 생성하며 StackView에 추가하였습니다. 소수부의 자리가 0.5를 넘는다면 별이 반개가 표시되며, 넘지않으면 빈 별이 표시되도록 구현했습니다.

> Part 3 - 상세 화면 부분
### 1. 다양한 뷰의 조합
앱스토어의 상세화면을 다양한 뷰를 이용하여 ScrollView + StackView 안에 담아내었습니다. 

순서대로 `CustomView - ScrollView - Label - TextView - Label - CollectionView - TextView - Label - TableView` 입니다.
<img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/80d666cf-05ee-4b8f-b02a-a17b983de945" width = "25%" height= "25%"> <img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/e3ff25ff-2146-4d4a-9ca8-6a9764281ec1" width = "25%" height= "25%"> <img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/03383bb9-0dac-495a-b964-9bc37815a730" width = "25%" height= "25%">

### 2. Coordinator deinit
Detail화면을 5번 띄운 후의 모습입니다. DetailViewController가 메모리에서 해제되었음에도 불구하고, DetailCoordinator가 5개가 남아있는 모습입니다. DetailCoordinator의 할 일이 사라졌으므로, 메모리 누수를 방지하기 위해 viewController의 deinit시 같이 제거해주었습니다.

(수정 전) 

<img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/2aa66a9d-93e5-401c-891f-84e94ac90b89" width = "30%" height= "30%"> 

(수정 후) 

<img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/be08fc4a-f2b1-42d2-a49e-1f32f5425090" width = "30%" height= "30%"> 

### 3. 다크 모드/라이트 모드 지원
<img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/967f2933-b2e0-432d-9c8c-0b1e65a805d7" width = "20%" height= "30%"> <img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/e71d886e-8227-4e37-812d-3294c24aa0b2" width = "20%" height= "30%"> <img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/cc3cdac6-4721-4deb-a5f8-9002c87c2c59" width = "20%" height= "30%"> <img src = "https://github.com/oksunwoo/Turtle_Neck/assets/55880539/91860868-59e1-415f-9607-57d80328d9197" width = "20%" height= "30%"> 



