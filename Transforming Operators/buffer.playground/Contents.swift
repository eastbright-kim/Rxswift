import UIKit
import RxSwift

//지정된 시간동안 모인 항목들을 배열을 통해 리턴
//지정된 시간이 다 되지 않았더라도, count 만큼 모이면 바로 방출

let bag = DisposeBag()

Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .buffer(timeSpan: .seconds(10), count: 3, scheduler: MainScheduler.instance)
    .take(3)
    .subscribe{print($0)}
    .disposed(by: bag)
