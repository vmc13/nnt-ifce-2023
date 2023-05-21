
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
        print("Enter employee name:")
        let name = readLine() ?? ""
        
        print("Enter employee position:")
        let position = readLine() ?? ""
        
        print("Enter employee salary:")
        let salaryString = readLine() ?? ""
        if let salary = Double(salaryString) {
            let employee = Employee(name: name, position: position, salary: salary)
            employees.append(employee)
            saveEmployees()
            print("Employee added successfully!")
        } else {
            print("Invalid salary!")
        }
    }
    
    func listEmployees() {
        if employees.isEmpty {
            print("No employees found!")
        } else {
            print("Employees:")
            for employee in employees {
                print("Name: \(employee.name)")
                print("Position: \(employee.position)")
                print("Salary: \(employee.salary)\n")
            }
        }
    }
    
    func deleteEmployee() {
        print("Enter the name of the employee to delete:")
        let name = readLine() ?? ""
        
        if let index = employees.firstIndex(where: { $0.name == name }) {
            employees.remove(at: index)
            saveEmployees()
            print("Employee deleted successfully!")
        } else {
            print("Employee not found!")
        }
    }
}

func showMenu() {
    print("Menu:")
    print("1. Add Employee")
    print("2. List Employees")
    print("3. Delete Employee")
    print("4. Quit")
    print("Enter your choice:")
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
            print("Invalid choice!")
        }
    } else {
        print("Invalid input!")
    }
}
