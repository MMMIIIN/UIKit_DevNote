//
//  LetterViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/27.
//

import UIKit

import SnapKit

class LetterViewController: BaseViewController {

    // MARK: - property

    private let letterLabel: UILabel = {
        let label = UILabel()
        label.text = "쪽지함"
        label.textColor = .white
        label.font = .font(.regular, ofSize: 34)
        return label
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - render
    override func render() {
        view.addSubview(letterLabel)
        letterLabel.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(66)
        }
    }

}
