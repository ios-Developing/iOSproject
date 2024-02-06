import UIKit

//Урок 5. Протоколы, классы и расширения
//В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
//Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
//Создайте протокол, в котором будут содержаться функции открытия и закрытия.
//Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.
//Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.

protocol MenuProtocol {
    var cost: Double { get set }
    var size: String { get set }
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

struct Chips : MenuProtocol {
    enum Chips {
        case xxl
    }
    var cost: Double
    var size: String
}

//Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.

class Pizzeria {
    var menu: [MenuProtocol]        // чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }
    
    //Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
    
    func addMenu(_ new: MenuProtocol) {
        menu.append(new)
    }
}

//Создайте протокол, в котором будут содержаться функции открытия и закрытия.

protocol OpenClosePizzeria {
    func openPizzeria()
    func closePizzeria()
}

//Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.

extension Pizzeria {
    func openPizzeria(){
        print("Cafe open")
    }
    func closePizzeria(){
        print("Cafe closed")
    }
}

//Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.

func summ<T: Numeric> (a: T, b: T) -> T {
    a + b
}

print(summ(a: 10, b: 10.5))
