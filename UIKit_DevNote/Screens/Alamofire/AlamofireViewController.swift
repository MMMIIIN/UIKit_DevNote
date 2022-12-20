//
//  AlamofireViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/11/13.
//

import UIKit

import Alamofire
import Then
import SnapKit

final class AlamofireViewController: BaseViewController {
    let manager = AlamofireManager()
    // MARK: - property
    
    private lazy var getButton = UIButton().then {
        $0.backgroundColor = .systemCyan
        $0.setTitle("GET", for: .normal)
        let action = UIAction { [weak self] _ in
            Task {
                await self?.getAlamofire()
            }
        }
        $0.addAction(action, for: .touchUpInside)
    }
    
    // MARK: - life cycle
    
    override func render() {
        view.addSubview(getButton)
        getButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(40)
            $0.height.equalTo(60)
        }
    }
    
    // MARK: - func
    
    private func getAlamofire() async {
        do {
            try await manager.fecthTestData()
        } catch {
            print("ERROR")
        }
    }
}
