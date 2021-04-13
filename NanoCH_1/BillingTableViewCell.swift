//
//  BillingTableViewCell.swift
//  NanoCH_1
//
//  Created by Rio Sudarsono on 09/04/21.
//

import UIKit

class BillingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameBilling: UILabel!
    @IBOutlet weak var descriptionBilling: UILabel!
    @IBOutlet weak var switchIsActive: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var repeatLabel: UILabel!
    
    var cellDelegate: CellDelegate?
    var mIndexPath: IndexPath?
    var mData : BillingModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        switchIsActive.onTintColor = UIColor.blue
        switchIsActive.tintColor = UIColor.gray
        switchIsActive.thumbTintColor = UIColor.white
        switchIsActive.backgroundColor = UIColor.gray
        switchIsActive.layer.cornerRadius = 16
        
//        nameBilling.text = data?.nameBilling
//        descriptionBilling.text = data?.descBilling
//        switchIsActive.setOn(data?.isActive ?? false, animated: true)
//        dateLabel.text = data?.date
//        timeLabel.text = data?.time
//        repeatLabel.text = data?.repeatedly
    }

   
    @IBAction func onSwitchChanged(_ sender: Any) {
        mData?.isActive = !mData!.isActive
        cellDelegate?.onSwicthClick(data: mData!,indexPath: mIndexPath!)
    }
    
    
}
