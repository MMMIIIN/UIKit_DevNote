//
//  DispatchCell.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/07/13.
//

import UIKit

import SnapKit

class DispatchCell: UICollectionViewCell {

    // MARK: - property

    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "testing"
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - life cycle

    private func render() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
