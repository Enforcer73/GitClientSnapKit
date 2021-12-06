//
//  DetailTableViewCell.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 02.12.2021.
//

import UIKit
import SnapKit

final class DetailTableViewCell: UITableViewCell {

    //MARK: - Properties
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = colorBackGraund
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let imagesView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    private let fullNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 16),
                        color: .darkGray,
                        textAlignment: .left,
                        ofLine: 1
        )
        return label
    }()
    
    private let loginLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 17),
                        color: .black ,
                        textAlignment: .left,
                        ofLine: 1
        )
        return label
    }()
    
    private let dateLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .systemFont(ofSize: 15),
                        color: .black,
                        textAlignment: .right,
                        ofLine: 1
        )
        return label
    }()
    
    private let commitsLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .systemFont(ofSize: 16),
                        color: .black,
                        textAlignment: .left,
                        ofLine: 0
        )
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(model: TableDetailModel) {
        imagesView.image = model.image
        fullNameLabel.text = model.fullName
        loginLabel.text = model.login
        dateLabel.text = model.date
        commitsLabel.text = model.commits
    }
}

extension DetailTableViewCell {
    
    func initialize() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectedBackgroundView?.layer.cornerRadius = 10
        addingSubview()
        setConstraints()
    }
    
    func addingSubview() {
        contentView.addSubview(containerView)
        containerView.addSubview(imagesView)
        containerView.addSubview(loginLabel)
        containerView.addSubview(fullNameLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(commitsLabel)
    }
    
    func setConstraints() {
        //MARK: - Set owner view
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2.5)
            make.bottom.equalToSuperview().inset(2.5)
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().inset(3)
        }
        
        imagesView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(40)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(imagesView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(15)
            
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(imagesView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.bottom.equalTo(commitsLabel.snp.top).offset(-15)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(15)
//            make.bottom.equalTo(commitsLabel.snp.top).offset(-15)
        }
        
        commitsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
