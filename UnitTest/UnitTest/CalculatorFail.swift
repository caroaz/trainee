//
//  CalculatorFail.swift
//  UnitTest
//
//  Created by Mobdev on 09-03-22.
//

import Foundation

class CalculatorFail: FuncCalculator{


    func divNumbers (n1: Double?, n2:Double?) -> Double {
        if let num = n2 , num != 0{
           
            return (n1 ?? 0) / num
        }
        return 0

    }

}
