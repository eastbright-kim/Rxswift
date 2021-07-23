import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

//Observable<Int>.timer(.seconds(1), scheduler: MainScheduler.instance)
//    .subscribe{print($0)}
//    .disposed(by: bag)

Observable<Int>.timer(.seconds(2), period: .milliseconds(500), scheduler: MainScheduler.instance)
    .subscribe{print($0)}
    .disposed(by: bag)
