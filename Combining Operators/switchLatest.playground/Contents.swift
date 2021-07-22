import UIKit
import RxSwift

//가장 최근에 방출된 옵져버블을 구독하고, 이 옵저버블이 전달하는 이벤트를 구독자에게 전달


let bag = DisposeBag()

enum MyError: Error {
    case error
}

let a = PublishSubject<String>()
let b = PublishSubject<String>()

let source = PublishSubject<Observable<String>>()

source
    .switchLatest()
    .subscribe{print($0)}
    .disposed(by: bag)


a.onNext("hh")
b.onNext("bb")

source.onNext(a)
a.onNext("new")

source.onNext(b)
b.onNext("old")

//a,b 따로 하면 컴플리티드 안먹고. 전부 다 컴플리트드하고 마지막으로 소스까지 컴플리티드해야 먹음
a.onCompleted()
b.onCompleted()
source.onCompleted()
