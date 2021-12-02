//
//  DetailFavoriteViewController.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit
import SnapKit

class DetailFavoriteViewController: UIViewController {

    private let buttonBack = CustomButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorBackGraund
        initialize()
        title = "Favorite Detail"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: false)
    }
}

extension DetailFavoriteViewController {
    
    private func initialize() {
        addingSubview()
        makeConstraints()
        
        buttonBack.configure(with: "pop") { [unowned self] in
            self.buttonBackTapped()
        }
    }

    private func addingSubview() {
        view.addSubview(buttonBack)
    }

    private func makeConstraints() {
        buttonBack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
    }
}

extension DetailFavoriteViewController {
    @objc private func buttonBackTapped() {
        navigationController?.popViewController(animated: true)
    }
}
