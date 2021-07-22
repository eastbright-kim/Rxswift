import UIKit
import RxSwift

enum MyError: Error {
    case error
}

let bag = DisposeBag()

Observable.create { (observer) -> Disposable in
    
    guard let url = URL(string: "https://www.apple.com") else {
        observer.onError(MyError.error)
        return Disposables.create()
    }
    
    guard let html = try? String(contentsOf: url, encoding: .utf8) else {
        observer.onError(MyError.error)
        return Disposables.create()
    }
    
    observer.onNext(html)
    
    
    return Disposables.create()
}
.subscribe{print($0)}
.disposed(by: bag)
