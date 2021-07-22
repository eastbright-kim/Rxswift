import UIKit
import RxSwift

//반드시 인덱스를 기준으로 짝을 일치시켜서 전달

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let number = PublishSubject<Int>()
let string = PublishSubject<String>()

Observable.zip(number, string) { (lhs, rhs) -> String in
    return "\(lhs) - \(rhs)"
}
.subscribe{print($0)}
.disposed(by: bag)

number.onNext(1)
string.onNext("one")

number.onNext(2)
string.onNext("two")

number.onCompleted()
string.onNext("three")

string.onCompleted()
