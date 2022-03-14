import Cocoa


enum AnimalType {
case land
case sea
case air
}
typealias EncageAnimal = Encage & Animal


protocol Animal{
    var type : AnimalType {get}
}


protocol Encage { // pasar a estructura de animales voladores y terrestres
    var estaDentro: Bool { get }
    func enjaular() -> Bool
    
}
protocol SetFree {
    mutating func setFree()
}

protocol Entanke { // pasar a estructura de animales marinos.
    var estaDentro: Bool { get }
    func toPutInTank() -> Bool
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
    var estaDentro: Bool
    var itsFeed: Bool

    func enjaular() -> Bool{
        return estaDentro
    }

    func liberar() -> Bool {
        return estaDentro
    }

    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}

struct LandAnimal: Feed, EncageAnimal, SetFree, WalkOut {
    var type: AnimalType
    
    mutating func setFree() {
        estaDentro = false
    }
    
    func takeForAWalk() {
        print("a pasear")
    }
    
  
    
    var name : String
    var estaDentro: Bool
    
    func enjaular() -> Bool {
        print("enjaulado")
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

struct SeaAnimal: Feed, Entanke {
    var type: String
    var estaDentro: Bool
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
var parrot1 = FlyingAnimal( type: AnimalType.air, name: "pajarito", estaDentro: true, itsFeed: true)
parrot1.toFeed()
var cat1 = LandAnimal(type: AnimalType.land, name: "cat1", estaDentro: true, itsFeed: false)
cat1.toFeed()
var goldfish1 = SeaAnimal(type: "goldfish", estaDentro: true, itsFeed: false)
goldfish1.toFeed()
var pezpayaso = SeaAnimal(type: "pesPayaso", estaDentro: true, itsFeed: false)

var pulpo = SeaAnimal(type: "pulpo", estaDentro: true, itsFeed: false)



// estructuras jaulas:

class Cage: Clean {
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
     func pop() ->  Encage? {
        if !occupant.isEmpty {
            
            return occupant.removeLast()
            
        }
        return nil
    }
    
    
    func setFree() {
        for animal in occupant where animal.type == .land {
            pop()
        }
    }
    
    
//    func iterar (_ type: Encage) {
//        for item in occupant {
//            print(item)
//        }
//    }
    
}

class PetShop {
    let cage : Cage
    init (cage: Cage){
        self.cage = cage
    }
    
    
}

struct TankSeaAnimals: Clean {
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
//
//    func pritn1  {
//         print(<#T##items: Any...##Any#>)
//    }
    mutating func pop() ->  Entanke? {
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

print("Hay \(cage1.occupant.count) animales en esta jaula.")
print(cage1.occupant)

cage1.setFree()

print("Hay \(cage1.occupant.count) animales en esta jaula.")
print(cage1.occupant)

cage1.setFree()

print("Hay \(cage1.occupant.count) animales en esta jaula.")
print(cage1.occupant)

