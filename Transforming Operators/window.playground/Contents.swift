import UIKit
import RxSwift

let bag = DisposeBag()

Observable<Int>.interval(.seconds(2), scheduler: MainScheduler.instance)
    .window(timeSpan: .seconds(3), count: 3, scheduler: MainScheduler.instance)
    .take(5)
    .subscribe{print($0)
        
        if let observerble = $0.element {
            observerble
                .subscribe{print("element \($0)")}
        }
    }
    .disposed(by: bag)
