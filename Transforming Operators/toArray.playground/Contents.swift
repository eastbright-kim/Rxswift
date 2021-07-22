import UIKit
import RxSwift

let bag = DisposeBag()
let subject = PublishSubject<Int>()

subject.toArray()
    .subscribe{print($0)}
    .disposed(by: bag)

subject.onNext(1)
subject.onNext(2)
subject.onCompleted()
//컴플리티드 전달되야, 이전까지 전달됐던 이벤트들이 배열로 구독자에 전달 됨
