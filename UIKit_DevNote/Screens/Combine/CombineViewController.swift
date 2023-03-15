//
//  CombineViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2023/01/02.
//

import UIKit

import SnapKit

final class CombineViewController: BaseViewController {
    
    // MARK: - property
    
    private lazy var counterNavigatorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Counter ViewController", for: .normal)
        button.backgroundColor = .systemOrange
        let action = UIAction { [weak self] _ in
            self?.pushCombineCounterViewController()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    override func render() {
        view.addSubview(counterNavigatorButton)
        counterNavigatorButton.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(60)
        }
    }
    
    // MARK: - func
    
    private func pushCombineCounterViewController() {
        self.navigationController?.pushViewController(CombineCounterViewController(), animated: true)
    }
}
