//
//  ViewController.swift
//  Skillbox_diploma_step1
//
//  Created by Roman on 07.01.2021.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
//объявление аутлетов
    @IBOutlet var tableViewScreen1: UITableView!
    @IBOutlet var buttonDaily: UIView!
    @IBOutlet var buttonWeekly: UIView!
    @IBOutlet var buttonMonthly: UIView!
    @IBOutlet var buttonYearly: UIView!
    @IBOutlet var topMenuButtonStrip: UIView!
    @IBOutlet var labelDaily: UILabel!
    @IBOutlet var labelWeekly: UILabel!
    @IBOutlet var labelMothly: UILabel!
    @IBOutlet var labelYearly: UILabel!
    @IBOutlet var bottomPopInList: UIView!
    
    
//обработка касаний экрана
    @IBAction func buttonDailyGesture(_ sender: Any) {
//        topMenuHighliter(specifyLabel: labelDaily)
        borderForMenuBotton(buttonDaily)
    }
    @IBAction func buttonWeeklyGesture(_ sender: Any) {
//        topMenuHighliter(specifyLabel: labelWeekly)
        borderForMenuBotton(buttonWeekly)
    }
    @IBAction func buttonMonthlyGesture(_ sender: Any) {
//        topMenuHighliter(specifyLabel: labelMothly)
        borderForMenuBotton(buttonMonthly)
    }
    @IBAction func buttonYearlyGesture(_ sender: Any) {
//        topMenuHighliter(specifyLabel: labelYearly)
        borderForMenuBotton(buttonYearly)
    }
    
//Компоновка экрана
    func topMenuHighliter(specifyLabel: UILabel){
        specifyLabel.font = UIFont.systemFont(ofSize: specifyLabel.font.pointSize, weight: .bold)
        switch specifyLabel {
        case labelDaily:
            labelWeekly.font = UIFont.systemFont(ofSize: labelWeekly.font.pointSize, weight: .medium)
            labelMothly.font = UIFont.systemFont(ofSize: labelMothly.font.pointSize, weight: .medium)
            labelYearly.font = UIFont.systemFont(ofSize: labelYearly.font.pointSize, weight: .medium)
            print("111")
        case labelWeekly:
            labelDaily.font = UIFont.systemFont(ofSize: labelDaily.font.pointSize, weight: .medium)
            labelMothly.font = UIFont.systemFont(ofSize: labelMothly.font.pointSize, weight: .medium)
            labelYearly.font = UIFont.systemFont(ofSize: labelYearly.font.pointSize, weight: .medium)
            print("222")
        case labelMothly:
            labelDaily.font = UIFont.systemFont(ofSize: labelDaily.font.pointSize, weight: .medium)
            labelWeekly.font = UIFont.systemFont(ofSize: labelWeekly.font.pointSize, weight: .medium)
            labelYearly.font = UIFont.systemFont(ofSize: labelYearly.font.pointSize, weight: .medium)
            print("333")
        case labelYearly:
            labelDaily.font = UIFont.systemFont(ofSize: labelDaily.font.pointSize, weight: .medium)
            labelWeekly.font = UIFont.systemFont(ofSize: labelWeekly.font.pointSize, weight: .medium)
            labelMothly.font = UIFont.systemFont(ofSize: labelMothly.font.pointSize, weight: .medium)
            print("444")
        default:
            print("Error with higlightLabel")
        }
    }
    
    func borderForMenuBotton(_ specifyButton: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions(), animations: {
            switch specifyButton {
            case self.buttonDaily:
                self.topMenuButtonStrip.frame.origin.x = self.buttonDaily.frame.origin.x + 10
            case self.buttonWeekly:
                self.topMenuButtonStrip.frame.origin.x = self.buttonWeekly.frame.origin.x + 10
            case self.buttonMonthly:
                self.topMenuButtonStrip.frame.origin.x = self.buttonMonthly.frame.origin.x + 10
            case self.buttonYearly:
                self.topMenuButtonStrip.frame.origin.x = self.buttonYearly.frame.origin.x + 10
            default:
                print("Error with borderForMenuBotton")
            }
        }, completion: {isCompleted in })
    }
    
//Работа с базой данных
    class Screen1TableData{
        var isIncome: Bool
        var category: String
        var account: String
        var note: String
        var amount: Double
        
        init(isIncome1: Bool, category1: String, account1: String, note1: String, amount1: Double) {
            self.isIncome = isIncome1
            self.category = category1
            self.account = account1
            self.note = note1
            self.amount = amount1
        }
    }
    var newTableDataArray: [Screen1TableData] = []
    
    func screen1TableUpdate(){
        let newTableData = getRealmData()
        for n in newTableData{
            newTableDataArray.append(Screen1TableData(isIncome1: n.isIncome, category1: n.category, account1: n.account, note1: n.note, amount1: n.amount))
        }

        print(newTableData)
        print(newTableData.count)
    }
    
//    -------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addOperations(isIncome: true, category: "Salary", account: "Debet card", note: "Первая заметка")
//        addOperations(isIncome: false, category: "Coffee", account: "Cash", note: "Вторая заметка")
//        addOperations(isIncome: false, category: "Lease payable", account: "Debet card", note: "Третья очень очень большая заметка. Третья очень очень большая заметка. Третья очень очень большая заметка. Третья очень очень большая заметка. Третья очень очень большая заметка. Третья очень очень большая заметка. Третья очень очень большая заметка. Третья очень очень большая заметка.")
        
        screen1TableUpdate()
        
//работа с сохранением даты операции
//        let calendar = Calendar.current
//        print(calendar.component(.hour, from: Date()))
//        print(Date.init())
        
        bottomPopInList.backgroundColor = .red
        bottomPopInList.layer.cornerRadius  = 20
        bottomPopInList.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTableDataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! Screen1TableViewCellHeader
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "operation") as! Screen1TableViewCellCategory
            cell.labelCategory.text = newTableDataArray[indexPath.row].category
            cell.labelAmount.text = String(newTableDataArray[indexPath.row].amount)
//            let gesture = UITapGestureRecognizer(target: self, action: #selector(changeCategory(_:)))
//            cell.isUserInteractionEnabled = true
//            cell.addGestureRecognizer(gesture)
//            cell.tag = indexPath.row
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.row == 4 {
            return 200
        }
        else{
            return 50
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
