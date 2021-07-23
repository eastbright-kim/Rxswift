import UIKit
import RxSwift

//시간안에 이벤트 전달 안하면 에러 전달

let bag = DisposeBag()

let subject = PublishSubject<Int>()

subject.timeout(.seconds(3), other: Observable.just(1), scheduler: MainScheduler.instance)
    .subscribe{print($0)}
    .disposed(by: bag)

//Observable<Int>.interval(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe(onNext:{
//        subject.onNext($0)
//    })
//    .disposed(by: bag)

Observable<Int>.timer(.seconds(1), period: .seconds(5), scheduler: MainScheduler.instance)
    .subscribe(onNext:{
        subject.onNext($0)
    })
    .disposed(by: bag)
