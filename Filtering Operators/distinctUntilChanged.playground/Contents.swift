import UIKit
import RxSwift

let bag = DisposeBag()
let numbers = [1,1,2,2,3,3,4,5,1]


Observable.from(numbers)
    .distinctUntilChanged()
    .subscribe{ print($0) }
    .disposed(by: bag)
