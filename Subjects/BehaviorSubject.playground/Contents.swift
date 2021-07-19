import UIKit
import RxSwift

let bag = DisposeBag()

let subject = BehaviorSubject<Int>(value: 1)

subject.subscribe{
    print($0)
}.disposed(by: bag)

subject.subscribe{
    print("second subscribe \($0)")
}

subject.onCompleted()
//completed이벤트 이후에는 onNext전달 안됨

subject.onNext(6)
subject.onNext(8)
