//
//  SimpleBadge.swift
//  SimpleBadge
//
//  Created by Rattee Wariyawutthiwat on 2/2/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

@IBDesignable class SimpleBadge:UIView {
    private let label = UILabel()
    private var gradientLayer:CAGradientLayer?
    
    @IBInspectable var isHorizontalGradient:Bool = true {
        didSet {
            setColor()
        }
    }
    @IBInspectable var startColor:UIColor =
        UIColor(colorLiteralRed: 218.0/255.0, green: 153.0/255.0, blue: 27.0/255.0, alpha: 1.0) {
        didSet {
            setColor()
        }
    }
    @IBInspectable var endColor:UIColor =
        UIColor(colorLiteralRed: 247.0/255.0, green: 190.0/255.0, blue: 22.0/255.0, alpha: 1.0) {
        didSet {
            setColor()
        }
    }
    @IBInspectable var cornerRadius:CGFloat = 3.0 {
        didSet {
            setCornerRadius()
        }
    }
    @IBInspectable var text:String = "Premium" {
        didSet {
            setText()
        }
    }
    @IBInspectable var textColor:UIColor = UIColor.white {
        didSet {
            setupLabel()
        }
    }
    
    @IBInspectable var fontSize:CGFloat = 15 {
        didSet {
            setFont()
        }
    }
    @IBInspectable var font:UIFont = UIFont.systemFont(ofSize: 15) {
        didSet {
            setFont()
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        setColor()
        setupLabel()
    }
    
    func setupLabel() {
        label.textAlignment = .center
        label.textColor = textColor
        addSubview(label)
    }
    
    func setCornerRadius() {
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.masksToBounds = true
    }
    
    func setColor() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        if isHorizontalGradient {
            gradientLayer?.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer?.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        layer.insertSublayer(gradientLayer!, at: 0)
        gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    func setText() {
        label.text = text
    }
    
    func setFont() {
        label.font = label.font.withSize(fontSize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
        label.frame = bounds
    }
}
