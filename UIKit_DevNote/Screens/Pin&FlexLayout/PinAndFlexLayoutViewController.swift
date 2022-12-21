//
//  PinAndFlexLayoutViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/12/20.
//

import UIKit

import FlexLayout
import PinLayout

final class PinAndFlexViewController: BaseViewController {
    
    // MARK: - property
    
    private let flexView = UIView()
    private let examView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    // MARK: - life cycle
    
    override func render() {
        view.addSubview(flexView)
        flexView.flex.define { flex in
            flex.addItem(examView)
        }
        
        view.addSubview(examView)
        examView.pin.all(10)
    }
}
