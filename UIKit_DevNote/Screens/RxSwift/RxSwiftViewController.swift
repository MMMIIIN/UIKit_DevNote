//
//  RxSwiftViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2023/01/01.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class RxSwiftViewController: BaseViewController {
    private let stackView: UIStackView = {
        let view = UIStackView()
        return view
    }()
    private lazy var counterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Counter", for: .normal)
        button.backgroundColor = .systemPurple
        let action = UIAction { [weak self] _ in
            self?.pushCounterViewController()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemPurple
        let action = UIAction { [weak self] _ in
            self?.pushLoginViewController()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    override func render() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.addSubview(counterButton)
        counterButton.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(60)
        }
        
        stackView.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.top.equalTo(counterButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    private func pushCounterViewController() {
        self.navigationController?.pushViewController(RxCounterViewController(), animated: true)
    }
    
    private func pushLoginViewController() {
        self.navigationController?.pushViewController(RxLoginViewController(), animated: true)
    }
}
