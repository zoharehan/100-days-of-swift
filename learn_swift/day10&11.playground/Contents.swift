import UIKit

struct Song {
    let title: String
    let singer: String
    let releaseYear: Int
    
    func printDetails() {
        print("The song is called, \(title). It is sung by \(singer) and was released in \(releaseYear).")
    }
}

let newSong = Song(title: "Red", singer: "Taylor Swift", releaseYear: 2021)
newSong.printDetails()

// if a struct function changes data, you give it a mutating tag

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}


//var archer = Employee(name: "Sterling Archer")
//archer.vacationTaken += 4
//print(archer.vacationRemaining)
//archer.vacationTaken += 4
//print(archer.vacationRemaining)

// cant do this
//archer.vacationRemaining += 8

// struct getters and setters
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
            
        }
    }
}

var archer = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)


struct Game {
    var score = 0 {
//        new didSet added
//        can also use a willSet to be called before a setter
        didSet {
            print("Score is now \(score)")
            
        }
    }
    
}

// here we print to confirm the change every time but we forget in the last line. to avoid this you can use a didSet which is a function called after every event where you set a value

var game = Game()
game.score += 10
//print("Score is now \(game.score)")
game.score -= 3
//print("Score is now \(game.score)")
game.score += 1

// willSet and didSet example
// computed properties should always have an explicit type.
// computed properties should never use "let" since they vary.
// computed properties always need to have a return statement.
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// custom init function
struct Player {
    let name: String
    let number: Int
//    no func keyword!!!
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

struct User {
    var name = "Anonymous"
    var age: Int
}

struct Swordfighter {
    var name: String
    var introduction: String {
        return "Hello, my name is \(name)."
    }
}
let inigo = Swordfighter(name: "Inigo Montoya")


// Static properties and methods
// self refers to the current value of the struct, and Self refers to the current type.
// Static Data is used for organizing common properties
// Also used to keep example data
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct EmployeeStaticData {
    let username: String
    let password: String

    static let example = EmployeeStaticData(username: "cfederighi", password: "hairforceone")
}
