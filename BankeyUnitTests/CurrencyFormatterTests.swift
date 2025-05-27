//
//  BankeyUnitTests.swift
//  BankeyUnitTests
//
//  Created by Bento, Cesar on 16/05/25.
//

import Foundation
import XCTest

@testable import Bankey

class CurrencyFormatterTests: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        print("#### TEST RESULT: \(result) ####")
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        print("#### TEST RESULT: \(result) ####")
        XCTAssertEqual(result, "$929,466.23")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        print("#### TEST RESULT: \(result) ####")
        XCTAssertEqual(result, "$0.00")
    }
}
