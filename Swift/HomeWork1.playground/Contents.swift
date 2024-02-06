import UIKit

//Вывести в консоль все чётные числа от 0 до 100, включая 0.

for num in 0 ... 100 {
    if num % 2 == 0 {
        print(num)
    }
}

//Создать две переменных: одна равна 7, другая 20.
//Если результат перемножения этих переменных больше 10, то вывести в консоль первую переменную, в противном случае вывести вторую.

var a = 7
var b = 20
if a * b > 10 {
    print(a)
} else {
    print(b)
}

print("\nСоздайте переменную “k”, равную 9. В диапазоне от 10 до 50, но только по нечётным числам, если текущее число плюс “k” — чётное, то увеличьте “k” на 2, в противном случае выведите в консоль “Next” и перейдите к следующей итерации.")

var k = 9
for num in 10 ... 50 {
    print(num)
    if num % 2 != 0 {
        if (num + k) % 2 == 0 {
            k += 2
            print("k =",k)
        }
    } else {
        print("Next")
    }
}

print("\nСоздайте переменную “k1”, равную 9. В диапазоне от 10 до 50, но только по нечётным числам, если текущее число плюс “k1” — чётное, то увеличьте “k1” на 1, в противном случае выведите в консоль “Next” прекратите выполнение цикла.")

var k1 = 9
for num in stride(from: 11, to: 50, by: 2) {
    print(num)
    if (num + k1) % 2 == 0 {
        print(num + k1)
        k1 += 1
        print("k =",k1)
        } else {
        print("Next")
            break
    }
}
