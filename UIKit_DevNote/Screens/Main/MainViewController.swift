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
            $0.top.equalTo(dispatchNavigatorButton.snp.bottom).offset(30)
            $0.height.equalTo(60)
        }
        
        view.addSubview(alamofireNavigatorButton)
        alamofireNavigatorButton.snp.makeConstraints {
            $0.top.equalTo(dispatchNavigatorButton.snp.bottom).offset(40)
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
}

