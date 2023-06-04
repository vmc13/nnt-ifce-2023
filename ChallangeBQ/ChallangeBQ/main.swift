//
//  main.swift
//  BQC
//
//  Created by Victoria Mendes on 27/05/23.
//

import Foundation

let employeeManager = EmployeeManagement()

var shouldQuit = false

while !shouldQuit {
    showMenu()
    
    if let choice = readLine(), let menuChoice = Int(choice) {
        switch menuChoice {
        case 1:
            employeeManager.addEmployee()
        case 2:
            employeeManager.listEmployees()
        case 3:
            employeeManager.deleteEmployee()
        case 4:
            shouldQuit = true
        default:
            print("\n\u{274C} Opção inválida!\n")
        }
    } else {
        print("\n\u{274C} Entrada inválida!\n")
    }
}

