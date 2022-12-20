//
//  LetterCollectionViewCell.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/28.
//

import UIKit

import SnapKit

class LetterCollectionViewCell: UICollectionViewCell {

    // MARK: - property

    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "testing"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        render()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func render() {
        self.addSubview(testLabel)
        testLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.height.equalTo(30)
        }
    }
    
    func setLabelText(_ text: String) {
        testLabel.text = text
    }
}
