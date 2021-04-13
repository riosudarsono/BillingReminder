//
//  RepeatViewController.swift
//  NanoCH_1
//
//  Created by Rio Sudarsono on 09/04/21.
//

import UIKit

class RepeatViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var repeatPicker: UIPickerView!
    
    var repeatData : [String] = ["Weekly","Monthly","Yearly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repeatPicker.dataSource = self
        repeatPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return repeatData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return repeatData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let mainView = presentingViewController as? ViewController {
            mainView.setReapeat(textRepeat: repeatData[row])
        }
        
        dismiss(animated: true, completion: nil)
    }
}
