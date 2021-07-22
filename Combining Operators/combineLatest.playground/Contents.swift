import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let greetings = PublishSubject<String>()
let languages = PublishSubject<String>()



Observable.combineLatest(greetings, languages) { lhs, rhs -> String in
    return "\(lhs) \(rhs)"
}
.subscribe{print($0)}
.disposed(by: bag)


greetings.onNext("hi")
languages.onNext("korean")

greetings.onNext("hello")
languages.onNext("rxSwift")
greetings.onError(MyError.error)

greetings.onCompleted()
languages.onNext("swiftUI")

languages.onCompleted()
