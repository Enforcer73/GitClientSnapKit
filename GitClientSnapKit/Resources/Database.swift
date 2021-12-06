//
//  Database.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 05.12.2021.
//

import UIKit

class Database {
    
    static var shared = Database()
        
    lazy var data: [TableReposModel] = [
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf gsdf hjjh hj jhjkk h kh khkwrwrwe wr wr wrwrwerwrgfdhdh hk rwerwjhhkjh", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf gsdf hjjh hj ", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf gsdf hjjh hj ", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1)
    ].map { (image, login, nameContent, descript, language, fork, star) -> TableReposModel in
    
        let data = TableReposModel(image: image, login: login, nameContent: nameContent, descript: descript, language: language, fork: fork, star: star)
        
        return data
    }
    
    lazy var commits: [TableDetailModel] = [
        ("buh", "Sunduk Kuznecov", "Buh",  "15.07.2021", "sdafkh sdh uiweru  ksfhlks fsdfsdfsdf f... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("valak", "Vasya Pupkin", "Tatarin",  "26.11.2021", "good! not errors..."),
        ("ava", "Jamshut Zelimhanov", "Jujaa",  "01.01.2020", "shnyaga shnyajnaya! hren polnaya... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("buh", "Sunduk Kuznecov", "Buh",  "15.07.2021", "sdafkh sdh uiweru  ksfhlks fsdfsdfsdf f... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("valak", "Vasya Pupkin", "Tatarin",  "26.11.2021", "good! not errors..."),
        ("ava", "Jamshut Zelimhanov", "Jujaa",  "01.01.2020", "shnyaga shnyajnaya! hren polnaya... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("buh", "Sunduk Kuznecov", "Buh",  "15.07.2021", "sdafkh sdh uiweru  ksfhlks fsdfsdfsdf f... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("valak", "Vasya Pupkin", "Tatarin",  "26.11.2021", "good! not errors..."),
        ("ava", "Jamshut Zelimhanov", "Jujaa",  "01.01.2020", "shnyaga shnyajnaya! hren polnaya... ddddddd ssd ddsdsd dssddsdsd ds")
    ].map { (image, fullName, login, date, commits) -> TableDetailModel in
    
        let commits = TableDetailModel(image: image, login: login, fullName: fullName, date: date, commits: commits)
        
        return commits
    }
    
    private init() {}
}
