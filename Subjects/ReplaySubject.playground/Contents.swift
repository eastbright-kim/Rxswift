import UIKit
import RxSwift

enum MyError: Error {
    case error
}

let bag = DisposeBag()

let subject = ReplaySubject<Int>.create(bufferSize: 4)

(1...10).forEach{subject.onNext($0)}

subject.subscribe{
    print("first \($0)")
}
.disposed(by: bag)

//subject.onCompleted()
//subject.onError(MyError.error)
//onCompleted onError 이후에 이벤트는 전달 안됨

//두번째 구독자는 마지막 세개 전달받음
subject.subscribe{
    print("second \($0)")
}
.disposed(by: bag)


//새로운 이벤트가 전달되면 기존에 있던 이벤트들 버퍼에서 다 지우고 새로운 이벤트만 전달
//onNext에는 요소 하나면 전달
(11...14).forEach{subject.onNext($0)}

//이전 구독자들한테 있던 데이터 모두 지워지고 하나씩 전달되고, 이후 구독자에게는 모아뒀다가 한꺼번에 전달
subject.onCompleted()

//종료 여부와 상관없이 *새로운 구독자는* 버퍼에 있는 가장 최신 데이터들과 onCompleted전달됨. 이전 구독자는 onCompleted 실행으로 새로운 이벤트 전달 못받음. onCompleted는 버퍼 크기와 상관 없음
subject.subscribe{
    print("third \($0)")
}

//onComplete이후의 이벤트는 버퍼에 저장 안됨
subject.onNext(18)

//onNext 전달되는 시점에서 이전에 구독자들에게는 새로운 이벤트 하나 전달되고 이후의 구독자에게는 마지막 것까지 누적시켜서 전달
subject.subscribe{
    print("fourth \($0)")
}
