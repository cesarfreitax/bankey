//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Bento, Cesar on 09/05/25.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
