//
//  LetterViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/27.
//

import UIKit

import SnapKit

class LetterViewController: BaseViewController {

    var segmentIndex: Int = 0 {
        didSet {
            letterSegmentCotrol.selectedSegmentIndex = segmentIndex
        }
    }

    // MARK: - property

    private let letterLabel: UILabel = {
        let label = UILabel()
        label.text = "쪽지함"
        label.textColor = .white
        label.font = .font(.regular, ofSize: 34)
        return label
    }()

    private lazy var letterSegmentCotrol: UISegmentedControl = {
        let control = UISegmentedControl(items: ["받은 쪽지", "보낸 쪽지"])
        let font = UIFont.font(.regular, ofSize: 14)
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, .font: font]
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, .font: font]
        control.selectedSegmentIndex = segmentIndex
        control.setTitleTextAttributes(normalTextAttributes, for: .normal)
        control.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        control.selectedSegmentTintColor = .white
        control.backgroundColor = .darkGrey004
        control.addTarget(self, action: #selector(changedIndexValue(_:)), for: .valueChanged)
        return control
    }()

    @objc
    private func changedIndexValue(_ sender: UISegmentedControl) {
        segmentIndex = sender.selectedSegmentIndex
    }


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

        view.addSubview(letterSegmentCotrol)
        letterSegmentCotrol.snp.makeConstraints {
            $0.top.equalToSuperview().inset(126)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
    }

}
