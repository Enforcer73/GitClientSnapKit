//
//  CustomLabel.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with font: UIFont, color: UIColor, textAlignment: NSTextAlignment, ofLine: Int) {
        text = ""
        textColor = color
        self.font = font
        self.textAlignment = textAlignment
        numberOfLines = ofLine
    }
}

extension CustomLabel {
    
    func setupUI() {
        text = ""
        textColor = .black
        font = .systemFont(ofSize: 17)
        textAlignment = .left
        numberOfLines = 1
    }
}
