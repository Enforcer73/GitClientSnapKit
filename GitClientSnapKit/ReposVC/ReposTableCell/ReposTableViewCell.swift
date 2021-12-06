//
//  ReposTableViewCell.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit
import SnapKit

final class ReposTableViewCell: UITableViewCell {

    private let tableView = UITableView()
    
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
        image.layer.cornerRadius = 30
        return image
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let loginLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 20),
                        color: .black ,
                        textAlignment: .left,
                        ofLine: 1
        )
        return label
    }()
    
    private let nameContentLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 18),
                        color: .darkGray,
                        textAlignment: .left,
                        ofLine: 1
        )
        return label
    }()
    
    private let languageLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(red: 0.462745098, green: 0.6235294118, blue: 0.8039215686, alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        return label
    }()
    
    private let forkLabel: CustomLabel = {
       let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(red: 0.462745098, green: 0.6235294118, blue: 0.8039215686, alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        return label
    }()
    
    private let starLabel: CustomLabel = {
       let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(red: 0.462745098, green: 0.6235294118, blue: 0.8039215686, alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        return label
    }()
    
    private let descriptLabel: CustomLabel = {
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
        setStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCell(model: TableReposModel) {
        imagesView.image = model.image
        loginLabel.text = model.login
        nameContentLabel.text = model.nameContent
        descriptLabel.text = model.descript
        languageLabel.text = model.language
        forkLabel.text = "\(model.fork) forks"
        starLabel.text = "\(model.star) stars"
    }
    
    private func setStack() {
        stackView.addArrangedSubview(languageLabel)
        stackView.addArrangedSubview(forkLabel)
        stackView.addArrangedSubview(starLabel)
    }
}

extension ReposTableViewCell {
    
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
        containerView.addSubview(nameContentLabel)
        containerView.addSubview(stackView)
        containerView.addSubview(languageLabel)
        containerView.addSubview(forkLabel)
        containerView.addSubview(starLabel)
        containerView.addSubview(descriptLabel)
    }
    
    func setConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2.5)
            make.bottom.equalToSuperview().inset(2.5)
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().inset(3)
        }
        
        imagesView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(60)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(imagesView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(15)
            
        }
        
        nameContentLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(5)
            make.leading.equalTo(imagesView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imagesView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(descriptLabel.snp.top).offset(-15)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.height.equalTo(15)
        }

        forkLabel.snp.makeConstraints { make in
            make.height.equalTo(15)
        }

        starLabel.snp.makeConstraints { make in
            make.height.equalTo(15)
        }
        
        descriptLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
