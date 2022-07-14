//
//  DispatchQueueExampleViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/07/13.
//

import UIKit

import SnapKit

class DispatchQueueExampleViewController: UIViewController {
    let imageUrl = "https://picsum.photos/1280/720/?random"

    private lazy var testUIImage = UIImage() {
        didSet {
            DispatchQueue.main.async {
                self.testImage.image = self.testUIImage
            }
        }
    }

    private enum Size {
        static let collectionHorizontalSpacing: CGFloat = 16.0
        static let collectionVerticalSpacing: CGFloat = 18.0
        static let cellWidth: CGFloat = UIScreen.main.bounds.size.width - collectionHorizontalSpacing * 2
        static let collectionInset = UIEdgeInsets(top: collectionVerticalSpacing,
            left: collectionHorizontalSpacing,
            bottom: collectionVerticalSpacing,
            right: collectionHorizontalSpacing)
    }

    // MARK: - property

    private lazy var testImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private let flowLayOut: UICollectionViewFlowLayout = {
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.scrollDirection = .vertical
        collectionViewLayer.sectionInset = Size.collectionInset
        return collectionViewLayer
    }()
    private lazy var exampleCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayOut)
        collectionView.backgroundColor = .white.withAlphaComponent(0.8)
        collectionView.register(DispatchCell.self, forCellWithReuseIdentifier: DispatchCell.className)
        return collectionView
    }()
    private lazy var fetchButton: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            self.loadImage(from: self.imageUrl)
        }
        button.layer.backgroundColor = UIColor.red.cgColor
        button.setTitle("Start", for: .normal)
        button.addAction(action, for: .touchUpInside)
        return button
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        setupCollectionView()
    }

    private func render() {
        view.addSubview(testImage)
        testImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(200)
        }

        view.addSubview(exampleCollectionView)
        exampleCollectionView.snp.makeConstraints {
            $0.top.equalTo(testImage.snp.bottom).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        view.addSubview(fetchButton)
        fetchButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }

    deinit {
        print("deinit")
    }

    // MARK: - func

    private func setupCollectionView() {
        exampleCollectionView.delegate = self
        exampleCollectionView.dataSource = self
    }

    private func loadImage(from imageUrl: String) -> Void {
        DispatchQueue.global(qos: .default).async {
            guard let url = URL(string: imageUrl) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            self.testUIImage = image
        }
    }
}

extension DispatchQueueExampleViewController: UICollectionViewDelegate { }
extension DispatchQueueExampleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = exampleCollectionView.dequeueReusableCell(withReuseIdentifier: DispatchCell.className, for: indexPath)
        guard let dispatchQueueCollectionViewCell = cell as? DispatchCell else {
            assert(false, "Wrong DispatchCell")
        }
        return dispatchQueueCollectionViewCell
    }
}

extension DispatchQueueExampleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Size.cellWidth, height: 50)
    }
}
