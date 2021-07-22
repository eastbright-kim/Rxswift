import UIKit
import RxSwift

let bag = DisposeBag()
let arr = ["apple", "dpple", "banana", "canana", "a", "ab"]

Observable.from(arr)
//    .groupBy { $0.count }
    .groupBy{$0.first ?? Character(" ")}
    .flatMap{$0.toArray()}
    .subscribe{print($0)}
    .disposed(by: bag)


Observable.range(start: 1, count: 10)
    .groupBy {$0.isMultiple(of: 2)}
    .flatMap {$0.toArray()}
    .subscribe{print($0)}
    .disposed(by: bag)
