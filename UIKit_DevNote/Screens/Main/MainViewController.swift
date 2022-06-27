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

    private let textLabel: UILabel = {
        let label = UILabel()
//        label.textColor = .white
        label.text = "testing"
        return label
    }()

    // MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func render() {
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }


}

