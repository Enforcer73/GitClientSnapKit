//
//  TableDetailModel.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit

class TableDetailModel {
    var image: UIImage?
    var fullName: String
    var login: String
    var date: String
    var commits: String
    
    init(image: String = "unknown", login: String, fullName: String, date: String, commits: String) {
        self.image = UIImage(named: image) ?? UIImage(named: "unknown")
        self.fullName = fullName
        self.login = login
        self.date = date
        self.commits = commits
    }
}
