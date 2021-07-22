import UIKit
import RxSwift

//요소 하나만 방출하는 옵저버블

let bag = DisposeBag()

Observable<Int>.just(1)
    .subscribe{
        print($0)
    }
    .disposed(by: bag)

Observable<[Int]>.just([1,2,3,4])
    .subscribe{
        print($0)
    }
    .disposed(by: bag)
