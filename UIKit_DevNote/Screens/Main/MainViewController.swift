//
//  ViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/27.
//

import UIKit

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
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(60)
        }
    }

    // MARK: - func

    private func pushDispatchViewController() {
        self.navigationController?.pushViewController(DispatchQueueExampleViewController(), animated: true)
    }

}

