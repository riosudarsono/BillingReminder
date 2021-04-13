//
//  CellDelegate.swift
//  NanoCH_1
//
//  Created by Rio Sudarsono on 12/04/21.
//

import Foundation

protocol CellDelegate {
    func onSwicthClick(data: BillingModel, indexPath: IndexPath)
}
