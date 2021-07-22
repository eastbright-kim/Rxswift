import UIKit
import RxSwift

//filter 연산자는 클로저를 파라미터로 받음

let bag = DisposeBag()
let arr = [1,2,3,4,5,6,7,8,9,10]

Observable.from(arr)
    .filter{$0.isMultiple(of: 2)}
    //트루를 리턴하는 요소가 연산자가 리턴하는 옵저버블에 포함됨
    .subscribe{print($0)}
    .disposed(by: bag)

