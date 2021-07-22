import UIKit
import RxSwift

//원하는 형식으로 리턴

let arr = ["RxSwift", "Swift", "SwiftUI"]
let bag = DisposeBag()

let ob = Observable<String>.from(arr)
    
    
let o1: Observable<Int> = ob.map{$0.count}
    
let oba = o1.subscribe{print($0)}
    .disposed(by: bag)

