import UIKit
import RxSwift

let bag = DisposeBag()
let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

a.onNext(5)

subject
    .flatMap{$0.asObserver()}
    .subscribe{ print($0) }
    .disposed(by: bag)

subject.onNext(a)
subject.onNext(b)

