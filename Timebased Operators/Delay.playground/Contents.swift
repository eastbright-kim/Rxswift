import UIKit
import RxSwift

//next이벤트 방출된 다음에 구독자로 전달되는 시간을 늦춤 그 후에는 큐 형식으로 같은 방출 페이스로 방출.

let bag = DisposeBag()

func currentTimeString() -> String {
    let f = DateFormatter()
    f.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    return f.string(from: Date())
}
//
Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//    .debug()
    .delay(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe{ print("delay \($0)") }
    .disposed(by: bag)

Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .take(5)
//    .debug()
    .delaySubscription(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe{print(" sub \($0)")}
    .disposed(by: bag)


//Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//    .take(5)
//    .debug()
//    .delaySubscription(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe{print($0)}
//    .disposed(by: bag)
