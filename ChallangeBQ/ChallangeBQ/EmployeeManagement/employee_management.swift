//
//  employee_management.swift
//  BQC
//
//  Created by Victoria Mendes on 27/05/23.
//

import Foundation

class EmployeeManagement {
    var employees: [Employee]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "employees"),
           let savedEmployees = try? JSONDecoder().decode([Employee].self, from: data) {
            employees = savedEmployees
        } else {
            employees = []
        }
    }
    
    func saveEmployees() {
        if let encodedData = try? JSONEncoder().encode(employees) {
            UserDefaults.standard.set(encodedData, forKey: "employees")
        }
    }
    
    func addEmployee() {
        print("\nInsira o nome do funcionário:")
        let name = readLine() ?? ""
        
        print("Insira o cargo do funcionário:")
        let position = readLine() ?? ""
        
        print("Insira o salário do funcionário:")
        let salaryString = readLine() ?? ""
        if let salary = Double(salaryString) {
            let employee = Employee(name: name, position: position, salary: salary)
            employees.append(employee)
            saveEmployees()
            print("\u{2705} Funcionário adicionado com sucesso!!\n")
        } else {
            print("\u{274C} Salário inválido!\n")
        }
    }
    
    func listEmployees() {
        if employees.isEmpty {
            print("\n\u{274C} Nenhum funcionário encontrado!\n")
        } else {
            print("\n\u{1F9D1} Funcionários:")
            for employee in employees {
                print("Nome: \(employee.name)")
                print("Cargo: \(employee.position)")
                print("Salário: R$\(employee.salary)\n")
            }
        }
    }
    
    func deleteEmployee() {
        print("\nInsira o nome do funcionário que deseja excluir:")
        let name = readLine() ?? ""
        
        if let index = employees.firstIndex(where: { $0.name == name }) {
            employees.remove(at: index)
            saveEmployees()
            print("\u{2705} Funcionário deletado com sucesso!\n")
        } else {
            print("\u{274C} Funcionário não encontrado!\n")
        }
    }
}
