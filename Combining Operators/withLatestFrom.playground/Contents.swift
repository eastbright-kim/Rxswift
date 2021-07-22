import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let trigger = PublishSubject<Void>()
let data = PublishSubject<String>()

trigger.withLatestFrom(data)
    .subscribe{print($0)}
    .disposed(by: bag)

data.onNext("hi")
data.onNext("bye")
data.onNext("ko")
//최신 것만 전달
trigger.onNext(())
trigger.onNext(())

data.onCompleted()
trigger.onNext(())
//컴플리티드 돼도 트리거 하면 최신 것 방출

