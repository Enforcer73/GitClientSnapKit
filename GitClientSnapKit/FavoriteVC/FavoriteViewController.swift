//
//  FavoriteViewController.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController {

    private let buttonToFavDetail = CustomButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorBackGraund
        
        initialize()
        configNavigation()
        
    }
    
    private func configNavigation() {
        title = "Favorite"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        let signOutButton = UIBarButtonItem(
            title: "Sign Out",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(signOutButton)
        )
        navigationItem.leftBarButtonItem = signOutButton
    }
}

extension FavoriteViewController {
    
    private func initialize() {
        addingSubview()
        makeConstraints()
        
        buttonToFavDetail.configure(with: "Go") { [unowned self] in
            self.buttonToFavDetailTapped()
        }
    }

    private func addingSubview() {
        view.addSubview(buttonToFavDetail)
    }

    private func makeConstraints() {
        buttonToFavDetail.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
    }
}

extension FavoriteViewController {
    
    @objc private func buttonToFavDetailTapped() {
        let favVC = DetailFavoriteViewController()
        navigationController?.pushViewController(favVC, animated: true)
        favVC.modalPresentationStyle = .fullScreen
        print("Ok")
    }
    
    @objc private func signOutButton(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
