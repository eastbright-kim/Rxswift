import UIKit
import RxSwift

//둘 이상의 이벤드를 방출하는 옵저버블

let bag = DisposeBag()
Observable<Int>.of(1,2,4)
    .subscribe{event in
        print(event)
    }
    .disposed(by: bag)
