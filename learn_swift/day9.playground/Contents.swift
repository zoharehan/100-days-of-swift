import UIKit

// Closures

// skeleton
let sayHi = {
    print("Hello!")
}

sayHi()

// with parameters

let sayPersonalHi = { (name: String) in
        print("Hello \(name)!")
}

// with parameters and return value

let returnHi = { (name: String) -> String in "Hello \(name)!"
}

print(returnHi("William"))


// functions have types, they can be declared as shown:
var greetingFunction: () -> Void = sayHi


// over-riding the sorted function with a closure
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)


let selfWrittenClosure = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

// since sorted only accepts a function where the parameters are two strings and return value is boolean it doesnt need to be specified. The by argument also doesnt need to be used -> Trailing closure Rewritten:
let selfRewrittenClosure = team.sorted {name1,name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

// Swift can automatically provide parameter names for us, using shorthand syntax. With this syntax we don’t even write name1, name2 in any more, and instead rely on specially named values that Swift provides for us: $0 and $1, for the first and second strings respectively.
let selfRewrittenClosure2 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

// OR:
let reverseTeam = team.sorted {$0 > $1}

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// map transforms every element of the array
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// function that uses a function as a parameter
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}


// can customise the generator function
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 5, using: generateNumber)
print(newRolls)

// Three functions accepted
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

