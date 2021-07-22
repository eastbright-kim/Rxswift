import UIKit
import RxSwift

let bag = DisposeBag()
let arr = [1,2,3,4,5]

Observable<Int>.from(arr)
    .element(at: 1)
    .subscribe{
        print($0) //2
    }
    .disposed(by: bag)
