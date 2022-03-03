import UIKit

//"Machine"
//
//Crear un clase "Machine", que en su constructor se le pueda pasar una estructura, esta estructura debe implementa el protocolo "Motor", el cual debe tener un método "turnOn"
//
//
//
//La clase "Machine" debe tener un identificador(booleano/string/int) que cambia a true/false si es que "Machine" esta encendido.
//
//
//
//Al "utilizar" el método "turnOn" del protocolo, la clase machine debe actualizar su identificador(booleano/string/int).


// * Se debe agregar al protocolo “motor”, una propiedad que represente la velocidad (señalada con un entero)
// * La clase “machine” debe tener una propiedad “limitSpeed”, representado en un entero.
// * La clase “machine” debe tener un metodo que permita saber si la Struct Auto supera el limite de velocidad (utilizando la propiedad “limitSpeed” de la clase)
// Extra :
// * Agregar un metodo que permita cambiar la propiedad machineID(o mas bien el auto) de la clase “Machine”
//

//agregamos al ejercicio de "Machine" un segundo "auto" (de preferencia opcional) y agregar funciones/metodos asociadas a ese "auto" (sea ver su velocidad o si supera limite o lo que se les ocurra).


protocol Motor {
    var turn: Bool {get set}
    var speed: Int {get set}
    mutating func turnOn ()
}

class Machine{
    var id : Car
    var id2 : Car?
    
    var limitSpeed = 60

    
    var turn: Bool{
        get { return id.turn}
        set { false }
    }
    

    init (id: Car, turn:Bool, id2:Car?) {
        self.id = id
        self.turn = turn
        self.id2 = id2
        
    }
    
    func ifExist() -> Car? {
        guard let car2opcional = id2  else {print ("no car"); return nil}
       return car2opcional

}
    
    func limiteExceed() {
        if id.speed <= limitSpeed {
            print("No excede el limite de velocidad")
        }
    else {
        print("Excede el limite de velocidad")
    }
}
    func limiteExceed2() {
        if id2?.speed ?? 0 <= limitSpeed {
            print("No excede el limite de velocidad")
        }
    else {
        print("Excede el limite de velocidad")
    }
}
    
    
    func tellIfItOn () {
        if id.turn{
            print("the \(id.name) is On")
        }else {
            print("the \(id.name) is OFF")
        }
    }
    
}
struct Car: Motor{

    var name = "Car"
    var turn: Bool
    var speed: Int

    
    mutating func turnOn()  {
        if turn == true {
            print("el motor esta encendido")
            
        }else{
            print("el motor esta apagado")
            
        }
    }
    
}
//struct Car2: Motor{
//    var name = "car2"
//    var turn: Bool
//    var speed: Int
//
//    mutating func turnOn()  {
//        if turn == true {
//            print("el motor esta encendido")
//
//        }else{
//            print("el motor esta apagado")
//
//        }
//    }
//}
//

var car = Car(turn: false, speed: 40)
//car.turnOn()
var car2 = Car(turn: true, speed:120)
car2.turnOn()

 
var machine = Machine (id: car, turn: false, id2: nil)
print(machine.id)
print(machine.id2)
machine.ifExist()
//machine.tellIfItOn()
//machine.limiteExceed()
machine.limiteExceed2()
//print(machine.turn)

