//
//  RxLoginViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2023/01/02.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class RxLoginViewController: BaseViewController {
    let viewModel = RxLoginViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - property
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 50)))
        textField.leftViewMode = .always
        textField.placeholder = "abc@email.com"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 5
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 50)))
        textField.leftViewMode = .always
        textField.placeholder = "password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    // MARK: - life cycle
    
    override func configUI() {
        super.configUI()
        bind()
    }
    
    override func render() {
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(60)
        }
    }
    
    private func bind() {
        emailTextField.rx.text
            .orEmpty
            .bind(to: viewModel.emailObserver)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map { $0 ? 1 : 0.3 }
            .bind(to: loginButton.rx.alpha)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map { $0 ? UIColor.red : UIColor.blue }
            .bind(to: loginButton.rx.backgroundColor)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.subscribe(
            onNext: { [weak self] _ in
                if "abc@email.com" == self?.viewModel.emailObserver.value &&
                    "password" == self?.viewModel.passwordObserver.value {
                    let alert = UIAlertController(title: "로그인 성공", message: "환영합니다", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    self?.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호를 다시 확인해주세요", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    self?.present(alert, animated: true, completion: nil)
                }
            }
        ).disposed(by: disposeBag)
    }
}

// 참고: https://pino-day.tistory.com/15
