import UIKit

// Functions

func sayHello() {
    print("Hi!")
    print("Its nice to meet you!")
}

sayHello()

// using a parameter
func printTimesTable(number: Int) {
        for i in 1...10 {
            print("\(number) times \(i) is \(number*i)")
        }
}

printTimesTable(number: 2)

// returning a value and parameter
func rollDice (side: Int) -> Int {
    return Int.random(in: 1...6)
}

var sides: Int = 8
print("Result of \(sides) sided dice roll: \(rollDice(side: sides))")


//Let’s try a more complex example: do two strings contain the same letters, regardless of their order? This function should accept two string parameters, and return true if their letters are the same – so, “abc” and “cab” should return true because they both contain one “a”, one “b”, and one “c”.
func sameLetters(s1: String, s2: String) -> Bool {
    return s1.sorted() == s2.sorted()
}

// since we know that our return item is a boolean and its a one-liner, the return statement can be removed as such:
func sameLettersRevised(s1: String, s2: String) -> Bool {
    s1.sorted() == s2.sorted()
}

var test1 = "abc"
var test2 = "back"
if sameLetters(s1: test1, s2: test2) {
    print("\(test1) and \(test2) are identical")
} else {
    print("\(test1) and \(test2) are not identical")
}

// returning multiple values from a function using a tuple
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// if adding an external parameter name is redundant, we can add an underscore before it so it doesnt need to be specified in the call.
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO, WORLD"
let result = isUppercase(string)

// the underscore can also be replaces with a second name to use externally, esp those not allowed internally e.g: "for" or "while"


// ERROR HANDLING
enum PasswordError: Error {
    case obvious, short
}

func checkPassword(_ pwd: String) throws -> String {
    if pwd.count < 3 {
        throw PasswordError.short
    } else if pwd == "12345" {
        throw PasswordError.obvious
    } else {
        return "OK"
    }
}

let password = "12345"

do {
    var result = try checkPassword(password)
} catch PasswordError.short {
        print ("password is too short.")
} catch PasswordError.obvious {
    print("password is too obvious")
} catch {
    print( "error" )
}
