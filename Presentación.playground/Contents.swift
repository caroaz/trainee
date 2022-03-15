//import Cocoa
//
//Lenguaje Tipado Vs No Tipado
/*que un lenguaje sea tipado significa que tienes que especificar a tu lenguaje (swift) que clase de dato es la variable que estas declarando
 
 */

var tipoVariable: Int

//Tipos de Variables

var miVariable = "hello"//una variable puede cambiar con el paso del programa, puede cambiar de valor, a modo de ejemplo puede ser como un contenedor o espacio de memoria donde almacenamos datos
miVariable = "hola" // cambia el valor

let  miConstante  = "hola"// mantendrá constante su valor


//Collections
/*
 
 sirve para almacenar un conjunto de valores: array(colecciones ordenadas), sets(almacena valores desordenados y únicos), diccionarios (almacena datos de tipo clave: valor, con la clave podremos acceder al valor)
 */

var miArray = [String]()
miArray = ["uno", "dos"]

var myDictionary = [String: String]()
myDictionary = ["name" : "juan"]

//Control de Flujo: Son útiles para añadir logica a nuetsros programas
//for in para iterar dentro de una secuencia
let names = ["juan","diego","luis"]
for name in names {
    print("Hello, \(name)")
}

//while, hasta que la condición while no es 'false' seguimos iterando en el

var count = 0
while count < 10 {
    print("count \(count)")
    count += 1
}

//if , para ejecutar condiciones , si se cumple la condicion entramos en su scope. Si la condicion no se cumple añadimos un else

var average = 7
if average > 4 {
    print ("pasó de curso ")
}else{
    print("tendrá que repetir el curso")
}

//guard, nos ayudan de salir de scope cuando no se cumpla una condición
//al igual que los if let , los guard nos permite extraer el valor de un opcional.

var array : [String] = []

func arrayEmpty(){
    guard !array.isEmpty else {
        print("mi array está vacío")
        return
    }
    print("mi aray NO está vacío")
}

arrayEmpty()
//switch , cuando tenemos un valor, nos permite compararlo con distintos casos. si se cumple la función se ejecuta la lógica

var average1 = 7

switch average1 {
case 7:
    print("promedio excelente")

default:
    print("faltan notas")
}

//Enum, son útiles cuando trabajamos en una función pero con distints valores quetienen relación enre si

enum Animals {
    case cat
    case dog
    case mouse
}// se puede asignar a una variable
var chiguagua : Animals = .dog

//Optionals

//swift al ser un lenguaje fuertemente tipado, tenemos valores opcionales, para manejar ausencias de valor como nil, (representa valores que pueden o no tener valor)
// variable sopcionales

var myStringOptional : String?

myStringOptional = "my string"
//Optional bindings (en caso de tener un valor, sacamos el valor opcional y lo asignamos en una variable), es la manera segura de sacar opcionales

if let myString = myStringOptional {
    print(myString)
}else{
    print(myStringOptional)
}
//los force unwrapp no son recomendables ya que provocan errores en la aplicación se puede parar y cerrar súbitamente
//operador nil coalescing ?? es un operador seguro ya que si no hay ningun valor en la variable se especifica un valor por defecto

let helloString: String? = "Hola"
let defaultNumber = helloString ?? "hello"



//Funciones o Metodos, permiten manipular la lógica de la aplicación . estan compuestas por líneas de código que hacen una tarea

func myFunction() {
//    mi código
}





//Struct y Clases. Se utilizan para crear instancias de un objeto, ambas nos sirven para almacenar valores y definir metodos. Ambas se crean de la misma manera y se acceden a sus propiedades de la misma manera
/*
 clases: podemos heredar solo usando clases, podemos tener una referencia de una clase almacenada eb varias propiedades
 en las class, se debe tener un inicializador (init)
 
 las clases son de tipo Referencia . cada b¡variable apunta a la misma referencia en memoria 
 
 */
class SomeClass{
    var name: String
    init (name : String){
        self.name = name
    }
    
}

/*
 struct. NO es necesario tener un init. las struct son de tipo valor, osea que el valor se copia cuando es asignado a una variable
 */
struct SomeStructure{
    var name: String
    
}

let user = SomeClass (name: "Swift")
let user2 = SomeStructure (name: "Java")





//
//Controles de Acceso,
//restringe el acceso a diferentes partes de nuestro código, aplican en class, struct, enum, var,let, func
/*open y public: se puede acceder de cualquier parte de nuetro código.
 internal: por defecto, se accede solo dentro de nuestro módulo.
 fileprivate: se accede solo dentro de nuetsro fichero.
 private: solo se accede dentro del scope
 */


//
//Protocolos, principales funciones= sirve para definir un modelo de metodos, propiedades, etc para que una clase, estructura o enumeración se adpaten a ellos
//get, para obtenet valores. set, para asignar

protocol PersonProtocol {
    var name: String {get set}
    var age: Int {get set}
    
    func fullname() -> String
}

struct Teacher: PersonProtocol {

    var name: String
    var age: Int
    
    var subject: String
    
    func fullname() -> String {
        return "el nombre es \(name), edad: \(age), e imparte la aseignatura de \(subject)"
    }
}
let myTeacher = Teacher(name: "Dario", age: 30, subject: "Swift")
print(myTeacher.fullname())




