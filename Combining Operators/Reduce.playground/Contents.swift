import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let o = Observable.range(start: 1, count: 5)

o.scan(0, accumulator: +)
    .subscribe{print($0)}
    .disposed(by: bag)
//과정


//결과만
o.reduce(0, accumulator: +)
    .subscribe{print($0)}
    .disposed(by: bag)

