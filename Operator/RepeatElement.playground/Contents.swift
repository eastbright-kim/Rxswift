import UIKit
import RxSwift

let bag = DisposeBag()

Observable<Int>.repeatElement(1)
    .take(7)
    .subscribe{print($0)}
    .disposed(by: bag)
