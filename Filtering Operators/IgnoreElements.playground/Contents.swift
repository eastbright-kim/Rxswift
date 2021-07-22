import UIKit
import RxSwift

let bag = DisposeBag()
let fruits = ["a","b","c","d","e"]

Observable.from(fruits)
    .ignoreElements()
    .subscribe{print($0)}
    .disposed(by: bag)
