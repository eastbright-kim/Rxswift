import UIKit
import RxCocoa
import RxSwift

let bag = DisposeBag()
let prerelay = PublishRelay<Int>()

prerelay.accept(3)

prerelay.subscribe{
    print($0)
}
.disposed(by: bag)

prerelay.accept(6)

let brerelay = BehaviorRelay<Int>(value: 3)

brerelay.subscribe{
    print($0)
}
.disposed(by: bag)

brerelay.accept(8)
