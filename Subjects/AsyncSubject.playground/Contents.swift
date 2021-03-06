import UIKit
import RxSwift

let bag = DisposeBag()
let sub = AsyncSubject<Int>()

sub.onNext(1)
sub.onCompleted()

sub.subscribe{
    print($0)
}
.disposed(by: bag)

//oncompleted 이후의 onNext는 전달 안됨
sub.onNext(5)
sub.onNext(6)
sub.onNext(7)
sub.onCompleted()
