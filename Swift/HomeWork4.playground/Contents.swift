import UIKit

//Урок 6. ARC и управление памятью
//Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками
//Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задается в инициализаторе
//Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра

protocol MenuProtocol {
    var cost: Double { get }
    var size: String { get }
}

struct Employee {  //Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками
    enum Position {
        case cashier
        case cook
    }
    var name: String
    var salary: Double
    var position: Position
}

enum PizzaAdditive: String {
    case cheese = "Cheese: Adds a rich and creamy flavor to the pizza."
    case pepperoni = "Pepperoni: Adds a spicy and savory taste to the pizza."
    case mushrooms = "Mushrooms: Adds a earthy and umami flavor to the pizza."
    case onions = "Onions: Adds a sweet and tangy taste to the pizza."
    case olives = "Olives: Adds a briny and salty flavor to the pizza."
}

// 2. Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

struct Pizza : MenuProtocol {
    enum PizzaType: String {
        case margherita
        case pepperoni
        case hawaiian
        case veggie
        case bbqChicken
        
        var description: String {
            switch self {
            case .margherita:
                return "Margherita Pizza"
            case .pepperoni:
                return "Pepperoni Pizza"
            case .hawaiian:
                return "Hawaiian Pizza"
            case .veggie:
                return "Veggie Pizza"
            case .bbqChicken:
                return "BBQ Chicken Pizza"
            }
        }
    }
    
    var cost: Double
    var size: String
    var type: PizzaType
    var additives: PizzaAdditive
    struct PizzaView {
        var pizza: Pizza
        func displayPizza() {
            print("Type: \(pizza.type.description)")
            print("Cost: \(pizza.cost) RUB")
            print("Additives: \(pizza.additives.rawValue)")
        }
    }
}

struct Chips : MenuProtocol {
    var cost: Double
    var size: String
}

//Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.

class Pizzeria {
    var menu: [MenuProtocol]        // чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
    var employees: [Employee]       //Добавить в класс пиццерии массив с работниками
    var tables: [Table]             //Добавить в класс пиццерии свойство, в котором хранится массив столиков.
    init(menu: [MenuProtocol], employees: [Employee], tables: [Table]) {
        self.menu = menu
        self.employees = employees
        self.tables = []
        // Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра
        for _ in 1...5 {
            let table = Table(numberOfSeats: 4)
            table.pizzeria = self
            self.tables.append(table)
        }
    }
    //Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
    func addMenu(_ new: MenuProtocol) {
        menu.append(new)
    }
    func addEmployee(_ employee: Employee) { //Добавление работника
        employees.append(employee)
    }
}

class Table { //Создать класс столика, в нем должны быть свойство, в котором содержится количество мест

    var numberOfSeats: Int
    var pizzeria: Pizzeria? // У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик.

    init(numberOfSeats: Int) {
        self.numberOfSeats = 4 // Изначальное количество мест задается в инициализаторе
        self.pizzeria = nil
    }

    func checkAvailability(numberOfGuests: Int) -> Bool { //функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает.
        return numberOfGuests <= numberOfSeats
    }
}

// Создание Пицерии
let pizzeria = Pizzeria(menu: [], employees: [Employee(name: "Ivan", salary: 10000.50, position: .cook)], tables: [])
// Создание меню
var menu = pizzeria.menu
var myChips1 = Chips(cost: 103.60, size: "Small")
var myPizza1 = Pizza(cost: 204, size: "Big", type: .margherita, additives: .cheese)
pizzeria.addMenu(myChips1)
pizzeria.addMenu(myPizza1)

// Создание работников
let employee1 = Employee(name: "John", salary: 2000, position: .cashier)
let employee2 = Employee(name: "Jane", salary: 2500, position: .cook)
// Add employees to the pizzeria
pizzeria.addEmployee(employee1)
pizzeria.addEmployee(employee2)

//Примеры:
print(pizzeria.menu) // Меню
print(pizzeria.tables.count) // Кол-во столов
print(pizzeria.tables[1].numberOfSeats) //Кол-во мест у 1 стола
