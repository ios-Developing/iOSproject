import UIKit

//Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func count(summ: Double, percent: Double, days: Double) -> Double {
    var total: Double = summ + (summ/100 * percent/365) * days
    return total
}

print(count(summ: 100, percent: 25.5, days: 365))

//Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.

enum Pizza: String {
    case pepperoni = "Пепперони"
    case chicken = "С курицей"
    case meat = "Мясная"
}
//Добавить возможность получения названия пиццы через rawValue

func getPizzaName(name: Pizza) {
    print(name.rawValue)
}
getPizzaName(name: .meat)
