import UIKit
import RxSwift

//일정한 주기마다 방출. Observerble<꼭 써줘야함>
//interval 연산자가 생성하는 observerble은 내부에 타이머 갖고 있음
//타이머는 옵저버가 생성될 때 생기는 게 아니라, 구독을 시작할 때 생김.
//구독 때마다 새로운 타이머가 계속 생김

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let o = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
// 1초 있다가 처음 next이벤트 방출
//    .take(3)

let sub = o.subscribe{print($0)}
//    .disposed(by: bag)

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {

    sub.dispose()
    //disposed bag은 completed하고 나서 나머지 들을 넣는거
//    dispose는 바로 종료
}

var subscription2: Disposable?

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    subscription2 = o.subscribe{print("sub 2 \($0)")}
}

DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
    subscription2?.dispose()
}



