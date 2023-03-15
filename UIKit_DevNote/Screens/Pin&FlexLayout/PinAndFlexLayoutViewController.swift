//
//  PinAndFlexLayoutViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/12/20.
//

import UIKit

import FlexLayout
import PinLayout
import SnapKit

final class PinAndFlexViewController: BaseViewController {
    
    // MARK: - property
  
    private let flexExamView = FlexExamView()
    
    override func loadView() {
        view = flexExamView
    }
}

final class FlexExamView: UIView {
    fileprivate let flexContainer = UIView()
    
    private let examView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    private let examLabel: UILabel = {
        let label = UILabel()
        label.text = "example example example example example example example example example example example example example example "
        return label
    }()
    private let mainButton = MainButton()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(flexContainer)
        
        flexContainer.flex.direction(.column).padding(20).define { flex in
            flex.addItem(examView).grow(1)
            flex.addItem(examLabel).grow(1)
            flex.addItem(mainButton).grow(1)
        }
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func layoutSubviews() {
        flexContainer.pin.all(pin.safeArea)
        flexContainer.flex.layout()
        self.examView.setGradient(colorTop: .systemBlue, colorBottom: .systemRed)
    }
}

extension UIView {
    func setGradient(colorTop: UIColor, colorBottom: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradient.locations = [0.0, 1,0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

final class MainButton: UIButton {
    private enum Size {
        static let width: CGFloat = UIScreen.main.bounds.width - (20 * 2)
        static let height: CGFloat = 54
    }
    
    var title: String? {
        didSet { setupAttribute() }
    }
    
    var isDisabled: Bool = false {
        didSet { setupAttribute() }
    }
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func configUI() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
//        titleLabel?.font = .font(.bold, ofSize: 18)
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .disabled)
        setBackgroundColor(.systemBlue, for: .normal)
        setBackgroundColor(.systemGray, for: .disabled)
    }
    
    private func render() {
        self.snp.makeConstraints {
            $0.width.equalTo(Size.width)
            $0.height.equalTo(Size.height)
        }
    }
    
    // MARK: - func
    
    private func setupAttribute() {
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        isEnabled = !isDisabled
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
