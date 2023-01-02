//
//  ViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/27.
//

import UIKit

import Then
import SnapKit

class MainViewController: BaseViewController {

    // MARK: property
    
    private lazy var dispatchNavigatorButton: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.pushDispatchViewController()
        }
        button.setTitle("DispatchQueue ViewController", for: .normal)
        button.layer.backgroundColor = UIColor.red.cgColor
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var letterNavigationButton: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.pushLetterViewController()
        }
        button.setTitle("Letter ViewController", for: .normal)
        button.layer.backgroundColor = UIColor.red.cgColor
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var alamofireNavigatorButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Alamofire ViewController", for: .normal)
        let action = UIAction { [weak self] _ in
            self?.pushAlamofireViewController()
        }
        $0.addAction(action, for: .touchUpInside)
    }
    private lazy var pinAndFlexNavigatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("PinAndFlex ViewController", for: .normal)
        let action = UIAction { [weak self] _ in
            self?.pushPinAndFlexViewController()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var bezierPathNavigatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("BezierPath ViewController", for: .normal)
        let action = UIAction { [weak self] _ in
            self?.pushBezierPathViewController()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var rxswiftNavigatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("RxSwift ViewController", for: .normal)
        let action = UIAction { [weak self] _ in
            self?.pushRxSwiftViewController()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    // MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        print("MainViewController deinit")
    }

    override func render() {
        view.addSubview(dispatchNavigatorButton)
        dispatchNavigatorButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.height.equalTo(60)
        }
        
        view.addSubview(letterNavigationButton)
        letterNavigationButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(dispatchNavigatorButton.snp.bottom).offset(40)
            $0.height.equalTo(60)
        }
        
        view.addSubview(alamofireNavigatorButton)
        alamofireNavigatorButton.snp.makeConstraints {
            $0.top.equalTo(letterNavigationButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        view.addSubview(pinAndFlexNavigatorButton)
        pinAndFlexNavigatorButton.snp.makeConstraints {
            $0.top.equalTo(alamofireNavigatorButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        view.addSubview(bezierPathNavigatorButton)
        bezierPathNavigatorButton.snp.makeConstraints {
            $0.top.equalTo(pinAndFlexNavigatorButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        view.addSubview(rxswiftNavigatorButton)
        rxswiftNavigatorButton.snp.makeConstraints {
            $0.top.equalTo(bezierPathNavigatorButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }

    // MARK: - func

    private func pushDispatchViewController() {
        self.navigationController?.pushViewController(DispatchQueueExampleViewController(), animated: true)
    }

    private func pushLetterViewController() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(LetterViewController(), animated: true)
    }
    
    private func pushAlamofireViewController() {
        self.navigationController?.pushViewController(AlamofireViewController(), animated: true)
    }
    
    private func pushPinAndFlexViewController() {
        self.navigationController?.pushViewController(PinAndFlexViewController(), animated: true)
    }
    
    private func pushBezierPathViewController() {
        self.navigationController?.pushViewController(BezierPathViewController(), animated: true)
    }
    
    private func pushRxSwiftViewController() {
        self.navigationController?.pushViewController(RxSwiftViewController(), animated: true)
    }
}
