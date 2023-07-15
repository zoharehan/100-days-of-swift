import UIKit

// Checkpoint 6
//To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

enum InvalidGear: Error {
    case invalidGearEntered
}


struct Car {
    let model: String
    let numSeats: Int
    private var currentGear: String = "UP" {
        willSet {
            print("currentGear was \(currentGear)")
        }
        didSet {
            print("currentGear is now \(currentGear)")
        }
    }
    
    init(model: String, numSeats: Int) {
        self.model = model
        self.numSeats = numSeats
    }
    
    mutating func changeGear(gear: String) {
        if gear.uppercased() == "UP" {
            currentGear = "UP"
        } else if gear.uppercased() == "DOWN" {
            currentGear = "DOWN"
        } else {
            print("Invalid gear entered. Provide \"UP\" or \"DOWN\"")
        }
        
    }
}

var bentley = Car(model:"series2", numSeats: 4)
print(bentley)
bentley.changeGear(gear: "DOWN")
bentley.changeGear(gear: "DOW")


// correction: gears go from 1-10 and arent just up and down

enum gearDirection {
    case up,down
}

struct RevisedCar {
    
    static let maxGears = 10
    
    let model: String
    let numSeats: Int
    private(set) var currentGear: Int = 1 {
        willSet {
            print("currentGear was \(currentGear)")
        }
        didSet {
            print("currentGear is now \(currentGear)")
        }
    }
    
    init(model: String, numSeats: Int) {
        self.model = model
        self.numSeats = numSeats
    }
    
    mutating func changeGear(gear: gearDirection) {
        if gear == gearDirection.up {
//            if currentGear is maxed stay there, else add 1
            currentGear = currentGear == RevisedCar.maxGears ? RevisedCar.maxGears : currentGear + 1
//            if currentGear is 1, stay 1, otherwise subtract 1
        } else if gear == gearDirection.down {
            currentGear = currentGear>1 ? currentGear-1 : currentGear
        } else {
            print("Invalid gear entered. Provide \"UP\" or \"DOWN\"")
        }
        
    }
}

var audi = RevisedCar(model:"series2", numSeats: 4)
audi.changeGear(gear: .up)
audi.changeGear(gear: .up)
audi.changeGear(gear: .up)
audi.changeGear(gear: .down)
