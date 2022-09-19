//
//  StudentsViewController.swift
//  StudentManager
//
//  Created by 堀弘昌 on 2022/09/18.
//

import UIKit
import RealmSwift

class StudentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    let realm = try! Realm()
    
    var tapindex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
        
//        let newStudent = Student()
//        newStudent.name = "name"
//        newStudent.number = "0123456789"
//        newStudent.mail = "example@test.com"
//        newStudent.company = "個人契約"
//        newStudent.meetlink = "example.com"
//        newStudent.text = "青チャート"
//        
//        try! realm.write {
//            realm.add(newStudent)
//        }
//        
        table?.reloadData()
        
//        navigationItem.title = "表示したいタイトル"
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Student.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
//        cell?.textLabel?.text = titleArray[indexPath.row]
//        cell?.detailTextLabel?.text = dateArray[indexPath.row]
        
        
        let studentData = realm.objects(Student.self)
////        print(todoData)
//
        cell?.textLabel?.text = studentData[indexPath.row].name
//        cell?.detailTextLabel?.text = todoData[indexPath.row].date
        
//        cell?.textLabel?.text = "test"
//        cell?.detailTextLabel?.text = todoData[indexPath.row].date
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tapindex = indexPath.row
        self.performSegue(withIdentifier: "ToStudentData", sender: self)
    }
    
    
    func read() -> Student? {
        return realm.objects(Student.self).first
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToStudentData" {
                let studentDataVC = segue.destination as!  StudentDataViewController
                studentDataVC.index = tapindex
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
