import Cocoa

/*
 Ejercicio: Tener tres tipos de animales y que estos puedan estar contenidos en un array.
 el objetivo es utilizar diferentes métodos para demostrar lo aprendido hasta el momento*/

//enumerar los tipos de animales , de tierra, marinos y acuaticos

enum AnimalType {
case land
case sea
case air
}

//typealias para redifinir el protocolo Encage y animal
typealias EncageAnimal = Encage & Animal
typealias EntankeAnimal = Entanke & Animal


//crear protocolo Animal que va a definir el tipo de animal ya declarados en el enum
protocol Animal{
    var type : AnimalType {get}
}

//se crea el Protocolo Encage para definir si un animal es enjaulable o no, a travez de una variable tipo booleano (la cual tendra la palabra get, para solo acceder a su valor) y un metodo
protocol Encage { // pasar a estructura de animales voladores y terrestres
    var enjaulable: Bool { get }
    func enjaular() -> Bool
    
}

//mismo protocolo Encage, pero solo será utilizado para peces maritimos
protocol Entanke { // pasar a estructura de animales marinos.
    var inTanke: Bool { get }
    func toPutInTank() -> Bool
}


//protocolo que deberán  tener todos los tipos de animales, indicara si fue alimentado o no
protocol Feed { // pasar a todas las estructuras de animales.
    var itsFeed: Bool { get }
    func toFeed()
}


// estructuras animales:

//estructura Flying animal, que adopatara el protocolo Feed, Encage y Animal (estos dos ultimos seran del alias EncageAnimal)
//para instanciar el ave , se necesitará especificar nombre, tipo, si es enjaulable, y si ya comió
struct FlyingAnimal: Feed, EncageAnimal {
    var type: AnimalType
    var name:String
    var enjaulable: Bool
    var itsFeed: Bool

//    función protocolo Encage
    func enjaular() -> Bool{
        return enjaulable
    }


//    func protocolo Feed
    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}


//estructura para animal de tierra con los mismos protocolos de FlyingAnimal
struct LandAnimal: Feed, EncageAnimal{
    var type: AnimalType
    var name : String
    var enjaulable: Bool
    var itsFeed: Bool
    


//    protocol Encage
    func enjaular() -> Bool {
        print("enjaulado")
        return true
    }
    
//protocol Feed
    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}

//Struct SeaAnimal que tendrá dos protocolos Feed y Entanke (Entanke y Animal)

struct SeaAnimal: Feed, EntankeAnimal {
    
    var type: AnimalType
    
    var inTanke: Bool
    func toPutInTank() -> Bool {
        print("en tanke")
        return true
    }
    
    var itsFeed: Bool
    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}
//a modo de ejemplo se crean instancias animales . animales que se pondran en jaulas o tanke según corresponda
var parrot1 = FlyingAnimal( type: AnimalType.air, name: "pajarito", enjaulable: true, itsFeed: true)
//parrot1.toFeed()
var dog1 = LandAnimal(type: AnimalType.land, name: "dog 1", enjaulable: true, itsFeed: true)
var cat1 = LandAnimal(type: AnimalType.land, name: "cat1", enjaulable: true, itsFeed: false)
//cat1.toFeed()
var goldfish1 = SeaAnimal(type: AnimalType.sea, inTanke: true, itsFeed: true)




// Creamos una clase jaula que e una de sus variables contendrá diferentes animales, en la misma jaula habrán aves y animales terrestres, pero solo los animales terrestres podrán usar el método Walkout. Utiliza protocolo clean y walkOut

class Cage{
    
//    variable de array vacío que contendrá a los animales, tipo EncageAnimal
    var occupant : [EncageAnimal] = []

    

    
//   metodo para poner a los animales en la jaula que es el array (occupant)
    
    func push(_ name: EncageAnimal){
        occupant.append(name)
        
    }
    
//    método para poner en libertad a los animales, removiendo solo el último
     func setFree() ->  Encage? {
        if !occupant.isEmpty {
            
            return occupant.removeLast()
            
        }
        return nil
    }

    
}


//estructura que solo contendrá a los animales de tipo .sea, con el protocol Clean
struct TankSeaAnimals{
    
//    la palabra reservada private(set) es para que esta propiedad sea de acceso público pero no configurable
   private(set) var occupant: [EntankeAnimal] = []

    
//  ocupamos la palabra reservada mutating en este struct ya que cambiara el estado dentro de la estructura, como las struct son inmutables en necesario hacer esto
    mutating func push(_ name: EntankeAnimal){
        occupant.append(name)
    }

    mutating func setFree() ->  Entanke? {
        if !occupant.isEmpty {
            return occupant.removeLast()
            
        }
        return nil
    }
    
}

// instancias de la jaula con nombre cage1
var cage1 = Cage( )

//introducir a los animales ya creados anteriormente en el array vacío (occupant)
cage1.push(cat1)
cage1.push(parrot1)
cage1.push(dog1)

//mostrar animales en array occupant
print (cage1.occupant)
print("Hay \(cage1.occupant.count) animales en esta jaula.")
cage1.setFree()

print(cage1.occupant)

print("Hay \(cage1.occupant.count) animales en esta jaula.")


//crear struct de TankSeaAnimals


var tank = TankSeaAnimals()
tank.push(goldfish1)

print(tank.occupant)
tank.setFree()
print(tank.occupant)
