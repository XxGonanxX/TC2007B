import UIKit

var result = add(3, 7)

if(result > 5){
    print("El resultado es mayor que 5")
}

func add(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}


