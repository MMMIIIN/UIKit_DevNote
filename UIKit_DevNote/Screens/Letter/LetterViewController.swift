//
//  LetterViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/27.
//

import UIKit

import SnapKit

class LetterViewController: BaseViewController {

    let data: [String] = ["abc", "asdf", "abc", "asdf", "abc", "asdf", "abc", "asdf"]

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
    private let letterLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 18, left: 16, bottom: 18, right: 16)
        flowLayout.minimumLineSpacing = 33
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 32, height: 48)
        return flowLayout
    }()
    private lazy var letterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: letterLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(LetterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
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
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(66)
        }

        view.addSubview(letterSegmentCotrol)
        letterSegmentCotrol.snp.makeConstraints {
            $0.top.equalToSuperview().inset(126)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }

        view.addSubview(letterCollectionView)
        letterCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalTo(letterSegmentCotrol.snp.bottom).inset(32)
        }
    }

    // MARK: - func

    @objc
    private func changedIndexValue(_ sender: UISegmentedControl) {
        segmentIndex = sender.selectedSegmentIndex
    }

}

extension LetterViewController: UICollectionViewDelegate { }

extension LetterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LetterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LetterCollectionViewCell
        cell.setLabelText(data[indexPath.row])
        return cell
    }
}

extension LetterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 500)
    }
}
