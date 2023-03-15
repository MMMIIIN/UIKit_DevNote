# UIKit_DevNote


### UIKit 관련 다양한 실험과 테스트를 위한 프로젝트입니다. 
> 굉장히 두서가 없고, 정리가 안되어 있을 수 있습니다. 실제 프로젝트에 도입하기 전, 실험해보고 싶은 게 생겼을 때 이용하는 프로젝트입니다.

|View|스크린샷|목적|
|:---:|---|---|
|MainView|<img src="https://user-images.githubusercontent.com/78677571/209424563-1f139e6d-016e-4b01-ac9c-703dcb2c759a.png" width="300">|다양한 View로 이동하기 위한 트리거 MainView|
|DispatchQueueExample|<img src="https://user-images.githubusercontent.com/78677571/209424665-2498207c-97a9-4dcd-97bd-d6f826c528bf.gif" width="300">| 1. UI 변경은 Main Thread에서만 일어나야 한다는 것을 처음 알고, 다른 Thread에서 View를 변경해 봄 (에러가 나는걸 확인) <br> <br> 2. Image를 받아오는 작업을 Main Thread에서 진행하면 UI가 어떻게 되는지 테스트 해봄. (받아오는 동안 UI가 멈춤) <br> <br> 관련 포스팅 : https://dev-workplace.tistory.com/10|
|Letter|<img src="https://user-images.githubusercontent.com/78677571/209424839-27e4dca0-2d9e-45aa-bc17-3cbdf95f1c11.gif" width="300">|UIKit을 처음 하게 되었을 때, 다른 팀원이 짠 코드를 보고 "과연 난 저렇게 짤 수 있을까" 란 생각이 들어 똑같은 View를 만들어 봄.|
|Alamofire|<img src="https://user-images.githubusercontent.com/78677571/209425368-d2d5b9c2-88ac-49cc-98eb-91cfa7de2337.png" width="300">|Alamofire를 프로젝트에 적용하기 전 연습해봄.|
|PinAndFlex|<img src="https://user-images.githubusercontent.com/78677571/209425454-97bf309b-5da3-4dbd-b997-61b87c2102f0.png" width="300">|PinLayout, FlexLayout 을 연습해보기 위한 View (진행중)|
|BezierPath|<img src="https://user-images.githubusercontent.com/78677571/210167891-8ba1c4ad-1c37-48a2-bf29-72080765203d.gif" width="300">|UIBezierPath를 사용해보고 싶어서 만든 크리스마스 트리 <br> <br> 관련 포스팅 : https://dev-workplace.tistory.com/15|
