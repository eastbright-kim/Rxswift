import UIKit
import RxSwift

//첫번째로 변환된 옵저버블이 방출하는 항목만 구독자에 전달됨
//
let bag = DisposeBag()
//
//let a = BehaviorSubject<Int>(value: 1)
//let b = BehaviorSubject(value: 2)
//
//let subject = PublishSubject<BehaviorSubject<Int>>()
//
//subject
//    .flatMapFirst{$0.asObservable()}
//    .subscribe{print($0)}
//    .disposed(by: bag)
//
//subject.onNext(a)
//subject.onNext(b)
//a.onNext(5)

//최근 변환된 옵저버블에 관심
//let c = BehaviorSubject(value: 1)
//let d = BehaviorSubject(value: 2)
//
//let sub = PublishSubject<BehaviorSubject<Int>>()
//
//
//sub
//    .flatMapLatest{$0.asObservable()}
//    .subscribe{print($0)}
//    .disposed(by: bag)
//
//
//sub.onNext(c)
//c.onNext(5)
//
//d.onNext(7)
//sub.onNext(d)
//d.onNext(9)


let c = PublishSubject<Int>()
let d = PublishSubject<Int>()

let sub = PublishSubject<PublishSubject<Int>>()


sub
    .flatMapLatest{$0.asObservable()}
    .subscribe{print($0)}
    .disposed(by: bag)


sub.onNext(c)
c.onNext(6)
d.onNext(8)

sub.onNext(d)


