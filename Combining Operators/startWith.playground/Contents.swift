import UIKit
import RxSwift

let bag = DisposeBag()
let numbers = [1,2,3,4,5,6]

Observable.from(numbers)
    .startWith(7)
    .subscribe{ print($0) }
    .disposed(by: bag)


