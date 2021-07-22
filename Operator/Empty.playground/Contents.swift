import UIKit
import RxSwift

let disposebag = DisposeBag()

Observable<Void>.empty()
    .subscribe{print($0)}
    .disposed(by: disposebag)
