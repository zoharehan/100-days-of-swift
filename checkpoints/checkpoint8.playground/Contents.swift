import UIKit

// Checkpoint 8
// Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

//A property storing how many rooms it has.
//A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
//A property storing the name of the estate agent responsible for selling the building.
//A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var rooms: Int {get}
    var cost: Int {get set}
    var estateAgent: String {get set}
    func salesSummary() -> Void
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    func salesSummary() {
        print("the house has \(rooms) room(s) and costs $\(cost). The agent is \(estateAgent).")
    }
    
    
    
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
    func salesSummary() {
        print("the office has \(rooms) room(s) and costs $\(cost). The agent is \(estateAgent).")
    }
    
}

let house = House(rooms: 1, cost: 500000, estateAgent: "Betty")
house.salesSummary()

