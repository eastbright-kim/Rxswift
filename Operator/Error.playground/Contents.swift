import UIKit
import RxSwift

let bag = DisposeBag()
//넥스트 이벤트 전달하지 않음
enum MyError: Error {
    case error
}

Observable<Void>.error(MyError.error)
