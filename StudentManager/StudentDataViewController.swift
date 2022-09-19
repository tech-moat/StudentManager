//
//  StudentDataViewController.swift
//  StudentManager
//
//  Created by 堀弘昌 on 2022/09/18.
//

import UIKit
import RealmSwift

class StudentDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    @IBOutlet var editButton: UIButton!
    
    let realm = try! Realm()
    
    var index: Int = 0
    
    var isEdit: Bool = false
    

    
    
    let dataTitleArray: [String] = ["名前", "電話番号", "メールアドレス", "契約会社", "ミーティング", "教材"]
//    let dataArray: [Any] = ["name", "number", "mail", "company", "meetlink", "text"]

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datacell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataTableViewCell
    
        let studentData = realm.objects(Student.self)

        datacell.DataTitleLabel.text = dataTitleArray[indexPath.row]
        
        if isEdit {
            switch indexPath.row {
            case 0 :
                try! realm.write {
                    studentData[index].name = datacell.DataContentTextField.text!
                }
            case 1 :
                try! realm.write {
                    studentData[index].number = datacell.DataContentTextField.text!
                }
            case 2 :
                try! realm.write {
                    studentData[index].mail = datacell.DataContentTextField.text!
                }
            case 3 :
                try! realm.write {
                    studentData[index].company = datacell.DataContentTextField.text!
                }
            case 4 :
                try! realm.write {
                    studentData[index].meetlink = datacell.DataContentTextField.text!
                }
            case 5 :
                try! realm.write {
                    studentData[index].text = datacell.DataContentTextField.text!
                }
            default:
                break
            }
            
        }
        
        switch indexPath.row {
        case 0 :
            datacell.DataContentTextField.text = studentData[index].name
        case 1 :
            datacell.DataContentTextField.text = studentData[index].number
        case 2 :
            datacell.DataContentTextField.text = studentData[index].mail
        case 3 :
            datacell.DataContentTextField.text = studentData[index].company
        case 4 :
            datacell.DataContentTextField.text = studentData[index].meetlink
        case 5 :
            datacell.DataContentTextField.text = studentData[index].text
        default:
            datacell.DataContentTextField.text = ""
        }
        
        
        
        
        return datacell
    }
    
    @IBAction func startEdit() {
        isEdit = !isEdit
        
        table.reloadData()
        
        
        let studentData = realm.objects(Student.self)
        print(studentData[index])
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
