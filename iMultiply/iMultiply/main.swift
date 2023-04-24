//
//  main.swift
//  iMultiply
//
//  Created by user on 20/04/23.
//

import Foundation

print("Welcome to iMultiply")

var score = 0

for i in 1...4 {
    let number1 = Int.random(in: 0...13)
    let number2 = Int.random(in: 0...13)
    let getOperation = Int.random(in: 1...3)
    
    var answer: Int
    var operation: String
    
    switch getOperation {
    case 1:
        answer = number1 + number2
        operation = "plus"
    case 2:
        answer = number1 - number2
        operation = "minus"
    default:
        answer = number1 * number2
        operation = "multiplied by"
    }
    
    print("\n\(i). What is \(number1) \(operation) \(number2) ?")
    
    func inputAnswer(_ message: String) {
        print(message, terminator: ": ")
        if let input = readLine(), let choice = Int(input), choice == answer {
            print("Correct!")
            score += 1
        } else {
            print("Wrong!")
        }
    }
    
    inputAnswer("Your answer")
}

print("\nFinal score: \(score)")
