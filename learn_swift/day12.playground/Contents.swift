import UIKit

// Classes

// Inheritance Example
// If you don't want your class to be used by other classes to inherit from, you can mark it as final.
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I spend \(hours) hours working.")
    }
}

// you can override methods using the override keyword
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I spent \(hours) hours developing.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
robert.printSummary()
joseph.work()

// superclass initialiser example
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
// example of super init and a normal deinit

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
    
    deinit {
            print("I'm dead!")
        }
}

class User {
    var name = "Paul"
}

var user = User()
user.name = "Taylor"
user = User()
print(user.name)
