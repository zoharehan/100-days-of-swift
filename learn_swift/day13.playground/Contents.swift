import UIKit

//Protocols: Skeletons/A set of functions/properties a struct
// or class can conform to. It's useful if you want to use a variable that could be of a range of types. For eg: a car, bike, bus struct would all come under the umbrella of Vehicle.

// in order to conform to a protocol you need to conform to EVERY requirement.

protocol Vehicle {
//     read only
    var name: String { get }
//    read and write -> can't be declared as a constant
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol isElectric {
//    empty since just used for example
    
}

// one struct or class can conform to many protocols, they can be added in a comma-separated list as such:
struct Car: Vehicle, isElectric {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}


func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)


// Opaque return types
// Both bool and int are equatable types. But if we set the return value to just be "Equatable" like so: it would error out.

//func getRandomNumber() -> Equatable {
//    Int.random(in: 1...10)
//}

// this is because when we do this we also hide the actual type of the data from Swift. So the compiler doesnt know if what we get back is actually equatable. Instead, we can use the "some" keyword, which makes that info. available to the compiler. Like so:

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...10)
}

// WHY IS THIS USEFUL?
// 1. If we want to return a varying data type just that follows a protocol, similar to the Vehicle example, this allows us to do that and just focus on the functionality
// 2. When SwiftUI asks for our layout, that description – the whole thing – becomes the return type for the layout. We need to be explicit about every single thing we want to show on the screen, including positions, colors, font sizes, and more. Can you imagine typing that as your return type? It would be a mile long! And every time you changed the code to generate your layout, you’d need to change the return type to match.
//  This is where opaque return types come to the rescue: we can return the type some View, which means that some kind of view screen will be returned but we don’t want to have to write out its mile-long type.


// Protocol extensions can be used to provide "default" implementations for methods. Then, when you make a class conforming to a particular protocol, you dont need to add in that specific method if its not relevant bc a default exists. like so:
protocol Person {
    var name: String { get }
    func sayHello()
}

// default imp. for sayhello
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

// no need to use sayHello to conform, since a default exists.
struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


