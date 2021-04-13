//
//  BillingDetailViewController.swift
//  NanoCH_1
//
//  Created by Rio Sudarsono on 09/04/21.
//

import UIKit

class BillingDetailViewController: UIViewController {

    @IBOutlet weak var labelNameBill: UILabel!
    @IBOutlet weak var labelDescBill: UILabel!
    @IBOutlet weak var switchIsActive: UISwitch!
    
//    var data : BillingModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        labelNameBill.text = data?.nameBilling
//        labelDescBill.text = data?.descBilling
//        switchIsActive.setOn(data?.isActive ?? false, animated: true)
    }

}
