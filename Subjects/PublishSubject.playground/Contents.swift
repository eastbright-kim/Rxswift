import UIKit
import RxSwift

let bag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("bye")
//구독 이후에 onNext로 전달되는 이벤트가 구독자로 전달된다

subject.subscribe{
    print($0)
}
.disposed(by: bag)

subject.onCompleted()

subject.onNext("hi")

subject.onNext("kim")
