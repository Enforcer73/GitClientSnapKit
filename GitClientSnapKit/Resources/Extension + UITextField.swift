//
//  Extension + UITextField.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit

extension UITextField {
    
    static func authenticationTextField(_ placeholder: String, secureText: Bool) -> UITextField {
        let view = UITextField()
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.font = UIFont.systemFont(ofSize: 17)
        view.isSecureTextEntry = secureText
        view.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        view.backgroundColor = UIColor.clear
        return view
    }
    
    static func lineTextField() -> UIView {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }
}

extension UITextField {
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {return self.placeHolderColor}
        set {self.attributedPlaceholder = NSAttributedString(
            string: placeholder != nil ? self.placeholder! : "",
            attributes: [NSAttributedString.Key.foregroundColor : newValue!])
        }
    }
}
