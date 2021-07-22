import UIKit
import RxSwift

//옵저버블을 리턴하는 클로저 전달

let bag = DisposeBag()

let arr = [1,2,3,4,5]
let brr = [6,7,8,9,10]
var bool = false


let observerble: Observable<[Int]> = Observable<[Int]>.deferred {
    bool.toggle()
    if bool {
       return Observable.just(arr)
    }else{
       return Observable.just(brr)
    }
}

observerble.subscribe{ event in
    print(event)
}


.disposed(by: bag)
