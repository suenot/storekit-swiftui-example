//
//  SKProduct-LocalizedPrice.swift
//  StoreKitDemo
//
//  Created by Eugen Soloviov on 29.10.2021.
//

import Foundation
import StoreKit

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
