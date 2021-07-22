import UIKit
import RxSwift

let bag = DisposeBag()

Observable.range(start: 1, count: 10)
    .subscribe{ event in
        print(event)
    }
    .disposed(by: bag)
