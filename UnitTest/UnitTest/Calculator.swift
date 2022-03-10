//
//  Calculator.swift
//  UnitTest
//
//  Created by Mobdev on 07-03-22.
//

import Foundation

//enumerar los errores que podemos arrojar
enum SomeError: Error {
    case ZeroError
}

class Calculator: FuncCalculator {



    func plusNumbers (n1: Int?, n2: Int?) -> Int {

            return Int (n1 ?? 0) + Int (n2 ?? 0 )

    }
    func minusNumbers (n1: Int?, n2: Int?) -> Int {

            return Int (n1 ?? 0) - Int (n2 ?? 0 )

    }
    func multNumbers (n1: Int?, n2: Int?) -> Int {

            return Int (n1 ?? 0) * Int (n2 ?? 0 )

    }
    func divNumbers (n1: Double?, n2:Double?) throws -> Double {
        guard let num2 = n2 , num2 != 0 else {
            throw SomeError.ZeroError
        }
        
        return Double (n1 ?? 0) / num2

    }

}
//class Calculator {
//    func add (n1 : Int, n2:Int) -> Int {
//        return n1+n2
//    }
//    func subtract (n1 : Int, n2:Int) -> Int {
//        return n1-n2
//    }
//}


//class Calculator {
//
//    var n1 : Int?
//    var n2 : Int?
//
//    init (n1: Int?, n2 : Int?){
//        self.n1 = n1
//        self.n2 = n2
//    }
//
//    func PlusNumbers () -> Int {
//
//            return Int (n1 ?? 0) + Int (n2 ?? 0 )
//
//    }
//    func MinusNumbers () -> Int {
//
//            return Int (n1 ?? 0) - Int (n2 ?? 0 )
//
//    }
//    func MultNumbers () -> Int {
//
//            return Int (n1 ?? 0) * Int (n2 ?? 0 )
//
//    }
//
//}
////
////var sum = Calculator(n1: nil, n2: 2)
////var res = Calculator(n1: 10, n2: 2)
////var mul = Calculator(n1: 20, n2: 2)
////
////sum.PlusNumbers()
////res.MinusNumbers()
////mul.MultNumbers ()
