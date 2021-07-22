import UIKit
import RxSwift

let bag = DisposeBag()
let numbers = [1,2,3,4,5,6,7,8,9,10]

Observable.from(numbers)
    .takeWhile{ !$0.isMultiple(of: 2) }//false리턴하면 그 이후에 리턴 안함
    .subscribe{ print($0) }
    .disposed(by: bag)


let subject = PublishSubject<Int>()
let trigger = PublishSubject<Int>()

subject.takeUntil(trigger) //트리거가 onnext방출하면 completed 전달됨
    .subscribe{
        print($0)
    }
    .disposed(by: bag)

subject.onNext(1)
subject.onNext(2)

trigger.onNext(5)
subject.onNext(43)




let sub = PublishSubject<Int>()

sub.takeLast(2)
    .subscribe{
        print($0)
    }
    .disposed(by: bag)

numbers.forEach{ sub.onNext($0) }

sub.onCompleted() //onCompleted 전달 되어야 구독자에 최근 것이 전달됨

