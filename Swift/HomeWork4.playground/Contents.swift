import UIKit

// 1. Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)

//enum PizzaType: String {
//    case margherita
//    case pepperoni
//    case hawaiian
//    case veggie
//    case bbqChicken
//
//    var description: String {
//        switch self {
//        case .margherita:
//            return "Margherita Pizza"
//        case .pepperoni:
//            return "Pepperoni Pizza"
//        case .hawaiian:
//            return "Hawaiian Pizza"
//        case .veggie:
//            return "Veggie Pizza"
//        case .bbqChicken:
//            return "BBQ Chicken Pizza"
//        }
//    }
//}

enum PizzaAdditive: String {
    case cheese = "Cheese: Adds a rich and creamy flavor to the pizza."
    case pepperoni = "Pepperoni: Adds a spicy and savory taste to the pizza."
    case mushrooms = "Mushrooms: Adds a earthy and umami flavor to the pizza."
    case onions = "Onions: Adds a sweet and tangy taste to the pizza."
    case olives = "Olives: Adds a briny and salty flavor to the pizza."
}

// 2. Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

struct Pizza {
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
    var type: PizzaType
    var doughType: String
    var additives: PizzaAdditive
    struct PizzaView {
        var pizza: Pizza
        func displayPizza() {
            print("Type: \(pizza.type.description)")
            print("Cost: \(pizza.cost) RUB")
            print("Dough Type: \(pizza.doughType)")
            print("Additives: \(pizza.additives.rawValue)")
        }
    }
}

//Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.

class Pizzeria {
    private var pizzas: [Pizza]
    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }
    
    // Написать в классе пиццерии функции для добавления новой пиццы
    func addPizza(pizza: Pizza) {
        pizzas.append(pizza)
    }
    
    // Написать в классе пиццерии функции для получения всех доступных пицц.
    func getAllPizzas() -> [Pizza] {
        pizzas // убрал return
    }
}

//Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.

//Создать экземпляр класса пиццерии и добавить в него несколько пицц.

let margherita = Pizza(cost: 180, type: .margherita, doughType: "Thin", additives: .cheese)
let pepperoni = Pizza(cost: 220, type: .pepperoni, doughType: "Thick", additives: .pepperoni)
let hawaiian = Pizza(cost: 229.50, type: .hawaiian, doughType: "Thin", additives: .mushrooms)
let veggie = Pizza(cost: 299.99, type: .veggie, doughType: "Thin", additives: .olives)

// добавления новой пиццы
let pizzeria = Pizzeria(pizzas: [margherita, pepperoni])
pizzeria.addPizza(pizza: hawaiian)
pizzeria.addPizza(pizza: veggie)

// получениe всех доступных пицц
let allPizzas = pizzeria.getAllPizzas()

// получение состава всех доступных пицц.
for pizza in allPizzas {
    let pizzaView = Pizza.PizzaView(pizza: pizza)
    pizzaView.displayPizza()
    print("-----")
}



//Урок 5. Протоколы, классы и расширения
//В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.

//Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.

//Создайте протокол, в котором будут содержаться функции открытия и закрытия.

//Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.

//Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.
