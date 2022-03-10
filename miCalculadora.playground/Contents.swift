import Foundation
import XCTest


protocol FuncCalculator {
    func divNumbers (n1: Double?, n2:Double?) throws -> Double
    
}

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
//                if (n2 == 0){
//                    throw SomeError.ZeroError
//                }
//        return Double(n1 / n2)

    }

}


class CalculatorFail: FuncCalculator{

//se arroja error si uno de los dos parametros es cero

    func divNumbers (n1: Double?, n2:Double?) -> Double {
        if let num = n2 , num != 0{
           
            return (n1 ?? 0) / num
        }
        return 0

    }

}

let calculator = Calculator()

let calculatorFail = CalculatorFail()

calculator.plusNumbers(n1: 10, n2: 2)
calculator.minusNumbers(n1: 10, n2: 2)
calculator.multNumbers(n1: 10, n2: 2)
try calculator.divNumbers(n1: 10, n2: 2)

calculatorFail.divNumbers(n1: 10, n2: 2)

////
//try Calculator.DivNumbers(Calculator)

