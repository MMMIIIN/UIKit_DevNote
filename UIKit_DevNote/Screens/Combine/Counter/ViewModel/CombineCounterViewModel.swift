//
//  CombineCounterViewModel.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2023/01/02.
//

import Combine

class CombineCounterViewModel {
    @Published var count: Int = 0
    
    func plus() {
        count += 1
    }
    
    func minus() {
        count -= 1
    }
}
