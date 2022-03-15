import Cocoa


enum AnimalType {
case land
case sea
case air
}
typealias EncageAnimal = Encage & Animal
typealias EntankeAnimal = Entanke & Animal


protocol Animal{
    var type : AnimalType {get}
}


protocol Encage { // pasar a estructura de animales voladores y terrestres
    var enjaulable: Bool { get }
    func enjaular() -> Bool
    
}

protocol Entanke { // pasar a estructura de animales marinos.
    var inTanke: Bool { get }
    func toPutInTank() -> Bool
}

protocol SetFree {
    mutating func setFree()
}


protocol WalkOut { // pasar a la estructura de animales terrestres.
    func takeForAWalk()
}
protocol Feed { // pasar a todas las estructuras de animales.
    var itsFeed: Bool { get }
    func toFeed()
}
protocol Clean { // pasar a todas las estructuras de jaulas.
    var itsClean: Bool {get}
    func toClean()
}

// estructuras animales:
struct FlyingAnimal: Feed, EncageAnimal {
    var type: AnimalType
    var name:String
    var enjaulable: Bool
    var itsFeed: Bool

    func enjaular() -> Bool{
        return enjaulable
    }


    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}

struct LandAnimal: Feed, EncageAnimal, WalkOut {
    var type: AnimalType
    var name : String
    var enjaulable: Bool
    var itsFeed: Bool
    

    func takeForAWalk() {
            print("salio a pasear")
    }

    
    func enjaular() -> Bool {
        print("enjaulado")
        return true
    }
    

    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}

struct SeaAnimal: Feed, Entanke {
    var type: String
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
// instancias animales:
var parrot1 = FlyingAnimal( type: AnimalType.air, name: "pajarito", enjaulable: true, itsFeed: true)
//parrot1.toFeed()
var dog1 = LandAnimal(type: AnimalType.land, name: "dog 1", enjaulable: true, itsFeed: true)
var cat1 = LandAnimal(type: AnimalType.land, name: "cat1", enjaulable: true, itsFeed: false)
//cat1.toFeed()
var goldfish1 = SeaAnimal(type: "goldfish", inTanke: true, itsFeed: false)
//goldfish1.toFeed()
var pezpayaso = SeaAnimal(type: "pesPayaso", inTanke: true, itsFeed: false)

var pulpo = SeaAnimal(type: "pulpo", inTanke: true, itsFeed: false)



// estructuras jaulas:

class Cage: Clean, WalkOut {
    var occupant : [EncageAnimal] = []
    var itsClean: Bool
    

    init(itsclean: Bool){
        self.itsClean = itsclean
    }
    
    func toClean() {
        if itsClean {
            print("no se necesita limpiar")
        } else {
            print("se necesita limpiar")
        }
    
    }
    func push(_ name: EncageAnimal){
        occupant.append(name)
        
    }
     func setFree() ->  Encage? {
        if !occupant.isEmpty {
            
            return occupant.removeLast()
            
        }
        return nil
    }

    
    
    func takeForAWalk() {
        for animal in occupant where animal.type == .land {
            setFree()
    
        }
        
    }
    
}



struct TankSeaAnimals: Clean{
   var occupant: [Entanke] = []

    var itsClean : Bool
    func toClean() {
        if itsClean {
            print("no se necesita limpiar")
        } else {
            print("se necesita limpiar")
        }
    }
    mutating func push(_ name: Entanke){
        occupant.append(name)
    }

    mutating func setFree() ->  Entanke? {
        if !occupant.isEmpty {
            return occupant.removeLast()
            
        }
        return nil
    }
    
}

// instancias de la jaula/el tanque:
var cage1 = Cage( itsclean: true)
cage1.push(parrot1)
cage1.push(cat1)
cage1.push(dog1)

print("Hay \(cage1.occupant.count) animales en esta jaula.")
//print(cage1.occupant)
//
cat1.takeForAWalk()
cage1.takeForAWalk()

print("Hay \(cage1.occupant.count) animales en esta jaula.")
//print(cage1.occupant)
//
//cage1.takeForAWalk()

//print(cage1.takeForAWalk())
//print(cat1.takeForAWalk())
//
//print("Hay \(cage1.occupant.count) animales en esta jaula.")
//print(cage1.occupant)
//cage1.setFree()
//print("Hay \(cage1.occupant.count) animales en esta jaula.")


//instacia tanque
//
//var tank1 = TankSeaAnimals(itsClean: true)
//
//
//tank1.push(goldfish1)
//
//print("Hay \(tank1.occupant.count) peces en este tanque.")
//
//print(cat1)
class PetShop {
    

}
