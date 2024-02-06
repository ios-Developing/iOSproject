import UIKit

//Добрый вечер!
//1. Вид чая лучше сделать видом чая, а нестрокой. То есть вид чая должен быть перечислением.
//2. Во втором задании лучше сначала compactMap, а затем filter. Также преобразовывать к Int было не нужно, достаточно написать просто comactMap {$0}
//3. Условте $0 != nil в filter излишне. Вы исключите все nil при помощи compactMap
//4. Помните, что ! опасен. Если вдруг окажется nil - будет краш приложения. Не приучайтесь использовать !, в проектах его часто запрещают.

//ДЗ 3. Коллекции и замыкания
//Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить её в виде массива видов чая, которые хотят заказать).

enum teaType: String {
    case black = "Black"
    case green = "Green"
    case fruit = "Fruit"
    case herbal = "Herbal"
}
var tea: [teaType : Int] = [.black: 250, .green: 280, .fruit: 300, .herbal: 350]
var customer: [teaType] = [.green, .herbal, .fruit, .black]

//Необходимо последовательно выводить в консоль сколько заплатит покупатель (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).

customer.forEach { num in
    print(customer.firstIndex(of: num)! + 1, num.rawValue, tea[num] ?? 0, "RUB")
}
    
//Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию.

var arr = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
//var arrfilteredArray = arr.filter { $0 != nil } // убираем nil
//var arrfilteredArray1 = (arrfilteredArray.compactMap { Int($0!) }).sorted(by: <) // cast(force!) to Int, sort
var arrfilteredArray = (arr.compactMap {$0}).sorted(by: <)
var arrfilteredArray1 = arrfilteredArray.filter { $0 != 0 && $0 != 4 }
print(arrfilteredArray1)

//Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.

func array (num: (Int)) -> [Int] {
    var arr1: [Int] = [1]
    for i in 1...num-1 {
        arr1.append(arr1[i-1] * 2)
    }
    return arr1
}
print(array(num: 7))
