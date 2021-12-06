//
//  TableReposModel.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//

import UIKit

class TableReposModel {
    var image: UIImage?
    var login: String
    var nameContent: String
    var descript: String
    var language: String
    var fork: Int
    var star: Int
    
    init(image: String = "unknown", login: String, nameContent: String, descript: String, language: String, fork: Int, star: Int) {
        self.image = UIImage(named: image) ?? UIImage(named: "unknown")
        self.login = login
        self.nameContent = nameContent
        self.descript = descript
        self.language = language
        self.fork = fork
        self.star = star
    }
}
