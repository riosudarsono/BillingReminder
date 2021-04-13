//
//  ViewController.swift
//  NanoCH_1
//
//  Created by Rio Sudarsono on 08/04/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellDelegate, UNUserNotificationCenterDelegate {
    

    @IBOutlet weak var fieldNameBill: UITextField!
    @IBOutlet weak var fieldDescBill: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnRepeat: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var data : [BillingModel] = []
    var textRepeat = ""
    var center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       Permission
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if error == nil {
                print("User Permission is granted: \(granted)")
            }
        }
        center.delegate = self
        // Do any additional setup after loading the view.
        
        data.append(BillingModel(nameBilling: "Pajak Motor", descBilling: "Motor Beat 2010 nopol B 1234 UH", isActive: true, date: "Apr 11, 2021", time: "2.00 AM", repeatedly: "Yearly"))
        data.append(BillingModel(nameBilling: "Pajak Mobil", descBilling: "Mobil Daihatsu Ceria B 1234 UH", isActive: false, date: "Apr 11, 2021", time: "2.00 AM", repeatedly: "Yearly"))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        
        
    }
    @IBAction func onNameChanged(_ sender: Any) {
        if !fieldNameBill.text!.isEmpty && !fieldDescBill.text!.isEmpty {
            btnSave.isEnabled = true
            btnSave.backgroundColor = .systemBlue
        } else {
            btnSave.isEnabled = false
            btnSave.backgroundColor = .systemGray2
        }
    }
    
    @IBAction func onDescChanged(_ sender: Any) {
        if !fieldNameBill.text!.isEmpty && !fieldDescBill.text!.isEmpty {
            btnSave.isEnabled = true
            btnSave.backgroundColor = .systemBlue
        } else {
            btnSave.isEnabled = false
            btnSave.backgroundColor = .systemGray2
        }
    }
    
    
    @IBAction func onSsveClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        timeFormatter.dateFormat = "h:mm a"
        let date = dateFormatter.string(from: datePicker.date)
        let time = timeFormatter.string(from: datePicker.date)
        
        let model = BillingModel(nameBilling: fieldNameBill.text ?? "", descBilling: fieldDescBill.text ?? "", isActive: true, date: date, time: time, repeatedly: textRepeat)
        data.append(model)
        
        fieldNameBill.text = ""
        fieldDescBill.text = ""
        btnSave.isEnabled = false
        btnSave.backgroundColor = .systemGray2
        
        onRefresh()
        
        let content = UNMutableNotificationContent()
        content.title = fieldNameBill.text ?? ""
        content.body = fieldDescBill.text ?? ""
        
        let dateComponats = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponats, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request) { error in
            //
        }
    }
    
    @IBAction func onDatePicker(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billingCell", for: indexPath) as? BillingTableViewCell
        
        cell?.nameBilling.text = data[indexPath.row].nameBilling
        cell?.descriptionBilling.text = data[indexPath.row].descBilling
        cell?.switchIsActive.setOn(data[indexPath.row].isActive, animated: true)
        cell?.dateLabel.text = data[indexPath.row].date
        cell?.timeLabel.text = data[indexPath.row].time
        cell?.repeatLabel.text = data[indexPath.row].repeatedly
        
        cell?.cellDelegate = self
        cell?.mIndexPath = indexPath
        cell?.mData = data[indexPath.row]
        
        return cell ?? BillingTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! BillingDetailViewController

        self.present(nextViewController, animated: true, completion: nil)
    }
    
    
    func setReapeat(textRepeat: String) {
        self.textRepeat = textRepeat
        btnRepeat.setTitle(textRepeat, for: .normal)
    }

    func onSwicthClick(data: BillingModel, indexPath: IndexPath) {
        self.data[indexPath.row] = data
        
       onRefresh()
    }
    
    func onRefresh() {
        let tempData = self.data.filter { $0.isActive }
        let tempData2 = self.data.filter { !$0.isActive }
        self.data.removeAll()
        self.data.append(contentsOf: tempData)
        self.data.append(contentsOf: tempData2)
        
        tableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

