//
//  BezierPathViewController.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/12/24.
//

import UIKit

import SnapKit

final class BezierPathViewController: BaseViewController {
    private let bezierView = BezierExamView()
    
    override func render() {
        view.addSubview(bezierView)
        bezierView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        bezierView.layoutIfNeeded()
    }
}

final class BezierExamView: UIView {
    private enum Size {
        static let width = UIScreen.main.bounds.width
    }
    
    // MARK: - property
    
    private let firstTreeBezierPath: UIBezierPath = {
        let bezier = UIBezierPath()
        bezier.lineWidth = 2
        bezier.lineJoinStyle = .round
        bezier.usesEvenOddFillRule = true
        return bezier
    }()
    private let secondTreeBezierPath: UIBezierPath = {
        let bezier = UIBezierPath()
        bezier.lineWidth = 2
        bezier.lineJoinStyle = .round
        bezier.usesEvenOddFillRule = true
        return bezier
    }()
    private let thirdTreeBezierPath: UIBezierPath = {
        let bezier = UIBezierPath()
        bezier.lineWidth = 2
        bezier.lineJoinStyle = .round
        bezier.usesEvenOddFillRule = true
        return bezier
    }()
    private let woodBezierPath: UIBezierPath = {
        let bezier = UIBezierPath()
        bezier.lineWidth = 2
        bezier.lineJoinStyle = .round
        bezier.usesEvenOddFillRule = true
        return bezier
    }()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func draw(_ rect: CGRect) {
        UIView.animate(withDuration: 2, delay: 1) {
            self.drawWood()
            self.drawThirdTree()
            self.drawSecondTree()
            self.drawFirstTree()
        }
    }
    
    // MARK: - func
    
    private func drawFirstTree() {
        firstTreeBezierPath.move(to: CGPoint(x: Size.width / 2, y: 200))
        firstTreeBezierPath.addLine(to: CGPoint(x: 60, y: 350))
        firstTreeBezierPath.addLine(to: CGPoint(x: Size.width - 60, y: 350))
        drawStrokeAndFill(firstTreeBezierPath, fillColor: .systemGreen)
    }
    
    private func drawSecondTree() {
        secondTreeBezierPath.move(to: CGPoint(x: Size.width / 2, y: 250))
        secondTreeBezierPath.addLine(to: CGPoint(x: 40, y: 450))
        secondTreeBezierPath.addLine(to: CGPoint(x: Size.width - 40, y: 450))
        drawStrokeAndFill(secondTreeBezierPath, fillColor: .systemGreen)
    }
    
    private func drawThirdTree() {
        thirdTreeBezierPath.move(to: CGPoint(x: Size.width / 2, y: 300))
        thirdTreeBezierPath.addLine(to: CGPoint(x: 20, y: 550))
        thirdTreeBezierPath.addLine(to: CGPoint(x: Size.width - 20, y: 550))
        drawStrokeAndFill(thirdTreeBezierPath, fillColor: .systemGreen)
    }
    
    private func drawWood() {
        woodBezierPath.move(to: CGPoint(x: Size.width / 2 - 50, y: 500))
        woodBezierPath.addLine(to: CGPoint(x: Size.width / 2 - 50, y: 680))
        woodBezierPath.addLine(to: CGPoint(x: Size.width / 2 + 50, y: 680))
        woodBezierPath.addLine(to: CGPoint(x: Size.width / 2 + 50, y: 500))
        drawStrokeAndFill(woodBezierPath, fillColor: .systemBrown)
    }
    
    private func drawStrokeAndFill(_ bezierPath: UIBezierPath, fillColor: UIColor) {
        bezierPath.close()
        UIColor.black.set()
        bezierPath.stroke()
        fillColor.set()
        bezierPath.fill()
    }
}
