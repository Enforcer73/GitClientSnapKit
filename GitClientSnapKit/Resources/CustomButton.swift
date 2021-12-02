//
//  CustomButton.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit

typealias VoidBlock = () -> ()

class CustomButton: UIButton {

    private var action: VoidBlock?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with title: String, action: @escaping VoidBlock) {
        self.action = action
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        addTarget(self, action:#selector(tapButton) , for: .touchUpInside)
    }
}

private extension CustomButton {

    func setupUI() {
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.462745098, blue: 0.6705882353, alpha: 1)
        layer.cornerRadius = 18
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 7)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 3
    }

    @objc func tapButton() {
        action?()
    }
}
