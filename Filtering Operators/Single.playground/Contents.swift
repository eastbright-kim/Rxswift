import UIKit
import RxSwift

let numbers = [1,2,3,4,5,6,7,8,9,10]
let bag = DisposeBag()

Observable.from(numbers)
    .single{$0 == 3}
    .subscribe{
        print($0)
    }
    .disposed(by: bag)
    

let sb = PublishSubject<Int>()

sb.single()
    .subscribe{ print($0) }
    .disposed(by: bag)

sb.onNext(5)
sb.onNext(6)
