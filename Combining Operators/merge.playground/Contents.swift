import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let oddNumbers = BehaviorSubject(value: 1)
let evenNumbers = BehaviorSubject(value: 2)
let negativeNumbers = BehaviorSubject(value: -1)

let source = Observable.of(oddNumbers, evenNumbers, negativeNumbers)

source
    .merge(maxConcurrent: 2)
    .subscribe{print($0)}
    .disposed(by: bag)

evenNumbers.onNext(6)
oddNumbers.onNext(5)

evenNumbers.onCompleted()

negativeNumbers.onNext(-5)
evenNumbers.onNext(8)
oddNumbers.onNext(9)
