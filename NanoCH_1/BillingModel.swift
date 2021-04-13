//
//  BillingModel.swift
//  NanoCH_1
//
//  Created by Rio Sudarsono on 08/04/21.
//

import Foundation

class BillingModel {
    var nameBilling : String
    var descBilling : String
    var isActive : Bool
    var date : String
    var time : String
    var repeatedly : String
    
    
    init(nameBilling: String, descBilling : String, isActive : Bool, date : String, time : String, repeatedly : String) {
        self.nameBilling = nameBilling
        self.descBilling = descBilling
        self.isActive = isActive
        self.date = date
        self.time = time
        self.repeatedly = repeatedly
    }
    
}
