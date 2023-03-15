//
//  PlayGroundViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2023/03/15.
//

import UIKit

import SnapKit

final class PlayGroundViewController: BaseViewController {
    
    let viewHeight = 300
    
    private let scrollView = UIScrollView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.backgroundColor = .systemGray
        return stackView
    }()
    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    private let view3: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    private let testButton: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func render() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.width.leading.trailing.equalToSuperview()
            $0.bottom.greaterThanOrEqualToSuperview().inset(200).priority(751)
//            $0.height.greaterThanOrEqualTo(250)
        }
        
        stackView.addSubview(view1)
        view1.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(viewHeight)
        }
        
        stackView.addSubview(view2)
        view2.snp.makeConstraints {
            $0.top.equalTo(view1.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(viewHeight)
        }
        
        stackView.addSubview(view3)
        view3.snp.makeConstraints {
            $0.top.equalTo(view2.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(viewHeight)
            $0.bottom.equalTo(stackView.snp.bottom).priority(750)
        }
        
        scrollView.addSubview(testButton)
        testButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
