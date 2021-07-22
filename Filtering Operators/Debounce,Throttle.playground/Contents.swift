import UIKit
import RxSwift

let bag = DisposeBag()

let buttonTap = Observable<String>.create { observer -> Disposable in
    DispatchQueue.global().async {

        for i in 1...10 {
            observer.onNext("buttonTap \(i)")
            Thread.sleep(forTimeInterval: 0.3)
        }

        Thread.sleep(forTimeInterval: 1)

        for i in 11...20 {
            observer.onNext("buttonTap \(i)")
            Thread.sleep(forTimeInterval: 0.5)
        }

        observer.onCompleted()
    }


    return Disposables.create {}
}

buttonTap
    .throttle(.milliseconds(1000), scheduler: MainScheduler.instance)
    .subscribe{ print($0) }
    .disposed(by: bag)



//let buttonTap = Observable<String>.create { observer -> Disposable in
//
//    for i in 1...10 {
//        observer.onNext("buttonTap \(i)")
//        Thread.sleep(forTimeInterval: 0.3)
//    }
//
//    Thread.sleep(forTimeInterval: 1)
//
//    for i in 11...20 {
//        observer.onNext("buttonTap \(i)")
//        Thread.sleep(forTimeInterval: 0.5)
//    }
//
//    observer.onCompleted()
//
//
//
//    return Disposables.create {}
//}
//
//buttonTap
//    .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
//    .subscribe{ print($0) }
//    .disposed(by: bag)


//throttle은 지정된 주기 동안 하나의 이벤트만 구독자에 전달


