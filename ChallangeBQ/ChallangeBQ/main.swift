
import Foundation

struct Employee: Codable {
    var name: String
    var position: String
    var salary: Double
}

class EmployeeManager {
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

func showMenu() {
    print("\u{1F4CB} Menu:")
    print("1. Adicionar funcionário")
    print("2. Listar funcionários")
    print("3. Excluir funcionário")
    print("4. Sair\n")
    print("\u{1F4CD} Insira uma opção", terminator: ": ")
}

let employeeManager = EmployeeManager()

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
