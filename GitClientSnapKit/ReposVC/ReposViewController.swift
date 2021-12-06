//
//  ReposViewController.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit
import SnapKit

final class ReposViewController: UIViewController {
    
    private let tableView = UITableView()
    private var data = Database.shared.data
    private var reposData: TableReposModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorTabel
        tableView.backgroundColor = colorTabel
        setNavigationBar()
        setTableView()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
   
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReposTableViewCell.self, forCellReuseIdentifier: "ReposTableViewCell")
        tableView.separatorStyle = .none
    }
    
    //MARK: - Navigation Bar
    private func setNavigationBar() {
        title = "Repositories"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor : UIColor.black
        ]
        
        let signOutButton = UIBarButtonItem(
            title: "Sign Out",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(signOutButton)
        )
        
        let goButton = UIBarButtonItem(
            title: "Go",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(goButton)
        )
        navigationItem.leftBarButtonItem = signOutButton
        navigationItem.rightBarButtonItem = goButton
    }
}

//MARK: - Table
extension ReposViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReposTableViewCell", for: indexPath) as? ReposTableViewCell {
            cell.setCell(model: data[indexPath.row])
            return cell
        } else {
            return  UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reposData = data[indexPath.row]
        let detailVC = DetailViewController()
        
        guard let reposData = reposData else { return }
        detailVC.getData(model: reposData)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - Actions
extension ReposViewController {
    
    @objc private func goButton() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        detailVC.modalPresentationStyle = .fullScreen
        print("Ok")
    }
    
    @objc private func signOutButton(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
