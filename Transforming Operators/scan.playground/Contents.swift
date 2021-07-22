import UIKit
import RxSwift

let bag = DisposeBag()
let arr = [1,2,3,4,5,6,7,8]

Observable.from(arr)
    .scan(0, accumulator: {$0 + $1})
    .subscribe{print($0)}
    .disposed(by: bag)
