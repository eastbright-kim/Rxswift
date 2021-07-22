import UIKit
import RxSwift

let disposeBag = DisposeBag()
let red = "🔴"
let blue = "🔵"

Observable<String>.generate(initialState: red, condition: {$0.count <= 10}, iterate: {$0.count.isMultiple(of: 2) ? $0 + red : $0 + blue})
    .subscribe{print($0)}
    .disposed(by: disposeBag)


let subject = PublishSubject<Int>()


