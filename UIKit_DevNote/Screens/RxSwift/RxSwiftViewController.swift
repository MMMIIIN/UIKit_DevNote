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
    private var disposeBag = DisposeBag()
    private let countRelay = BehaviorRelay<Int>(value: 10)
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        return button
    }()
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        return button
    }()
    
    // MARK: - life cycle
    
    override func configUI() {
        super.configUI()
        bind()
    }
    
    override func render() {
        view.addSubview(countLabel)
        countLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
        }
        
        view.addSubview(minusButton)
        minusButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(100)
            $0.width.equalTo(100)
        }
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(100)
            $0.width.equalTo(100)
        }
    }
    
    private func bind() {
        minusButton.rx.tap
            .map { -1 }
            .bind(to: countRelay)
            .disposed(by: disposeBag)
        
        addButton.rx.tap
            .map { 1 }
            .bind(to: countRelay)
            .disposed(by: disposeBag)
        
        countRelay
            .scan(0, accumulator: { $0 + $1 })
            .withUnretained(self)
            .map { "\($1)"}
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
