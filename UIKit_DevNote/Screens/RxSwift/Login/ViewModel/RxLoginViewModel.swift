//
//  RxLoginViewModel.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2023/01/02.
//

import RxSwift
import RxRelay

class RxLoginViewModel {
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailObserver, passwordObserver)
            .map { email, password in
                print("email : \(email), password : \(password)")
                return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 0
            }
    }
}
