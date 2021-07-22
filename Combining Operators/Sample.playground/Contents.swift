import UIKit
import RxSwift

//with the latest 순서와 반대 . 동일한 넥스트 이벤트를 반복해서 방출하지 않는다

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let trigger = PublishSubject<Void>()
let data = PublishSubject<String>()

data.sample(trigger)
    .subscribe{ print($0) }
    .disposed(by: bag)

data.onNext("hi")
trigger.onNext(())

data.onCompleted()
trigger.onNext(())
//data completed되면 trigger도 completed 방출
