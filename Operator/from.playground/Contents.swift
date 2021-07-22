import UIKit
import RxSwift

let bag = DisposeBag()

Observable.from([1,2,3,4,5,6])
    .subscribe{event in
        print(event)
    }
    .disposed(by: bag)
