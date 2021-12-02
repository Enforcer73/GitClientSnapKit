//
//  DetailViewController.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    private let tableView = UITableView()
    private var model: TableReposModel?
    var data = [TableReposModel]()
    
    //MARK: - Properties
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = colorTabel
//        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = true
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
    
    private let descriptLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .systemFont(ofSize: 16),
                        color: .black,
                        textAlignment: .left,
                        ofLine: 0
        )
        return label
    }()
    
    private let languageLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(red: 0.462745098,
                                             green: 0.6235294118,
                                             blue: 0.8039215686,
                                             alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        return label
    }()
    
    private let forkLabel: CustomLabel = {
       let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(red: 0.462745098,
                                             green: 0.6235294118,
                                             blue: 0.8039215686,
                                             alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        return label
    }()
    
    private let starLabel: CustomLabel = {
       let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(red: 0.462745098,
                                             green: 0.6235294118,
                                             blue: 0.8039215686,
                                             alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorTabel
        title = "Detail"
        initialize()
        setStack()
        setTableView()
        
        setDataView(with: model)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: false)
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    private func setDataView(with model: TableReposModel?) {
        imagesView.image = model?.image
        loginLabel.text = model?.login
        nameContentLabel.text = model?.nameContent
        descriptLabel.text = model?.descript
        languageLabel.text = model?.language
        forkLabel.text = "\(model?.fork ?? 0) forks"
        starLabel.text = "\(model?.star ?? 0) stars"
    }
    
    func set(model: TableReposModel) {
        self.model = model
    }
    
    private func setStack() {
        stackView.addArrangedSubview(languageLabel)
        stackView.addArrangedSubview(forkLabel)
        stackView.addArrangedSubview(starLabel)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }
}

extension DetailViewController {
    
    func initialize() {
        addingSubview()
        setConstraints()
    }
    
    func addingSubview() {
        containerView.addSubview(imagesView)
        containerView.addSubview(loginLabel)
        containerView.addSubview(nameContentLabel)
        containerView.addSubview(stackView)
        containerView.addSubview(languageLabel)
        containerView.addSubview(forkLabel)
        containerView.addSubview(starLabel)
        containerView.addSubview(descriptLabel)
        view.addSubview(containerView)
    }
    
    func setConstraints() {
        //MARK: - Set owner view
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.bottom.equalTo(descriptLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(3)
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
            make.bottom.equalTo(descriptLabel.snp.top).inset(-15)
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

extension DetailViewController {
    
//    @objc private func buttonBackTapped() {
//        navigationController?.popViewController(animated: true)
//    }
}
