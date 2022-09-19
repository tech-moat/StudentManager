//
//  Student.swift
//  StudentManager
//
//  Created by 堀弘昌 on 2022/09/18.
//

import Foundation

import RealmSwift

class Student: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var number: String = ""
    @objc dynamic var mail: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var meetlink: String = ""
    @objc dynamic var text: String = ""
}
