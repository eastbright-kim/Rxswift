import UIKit
import RxSwift

let bag = DisposeBag()
let numbers = [5,1,2,9,1,67,87,28,1,3]

Observable.from(numbers)
    .skip(4)//개 스킵
    .subscribe{print($0)}
    .disposed(by: bag)


Observable.from(numbers)
    .skip { element in
        return element < 7 //여기까지 스킵하고 그 뒤에 요소들 다 방출
    }
    .subscribe{print($0)}
    .disposed(by: bag)

let subject = PublishSubject<Int>()
let trigger = PublishSubject<Int>()

subject.skipUntil(trigger)
    .subscribe{print($0)}
    .disposed(by: bag)

subject.onNext(5)
trigger.onNext(3)
subject.onNext(2)


