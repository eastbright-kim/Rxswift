import UIKit
import RxSwift
//여러 옵저버블 중에서 가장 먼저 이벤트를 방출하는 옵저버블을 선택

let bag = DisposeBag()

enum MyError: Error {
    case error
}


let a = PublishSubject<String>()
let b = PublishSubject<String>()
let c = PublishSubject<String>()

Observable.amb( [a, b, c] )
    .subscribe{ print($0) }
    .disposed(by: bag)

a.onNext("a")

b.onNext("b")

c.onNext("c")
