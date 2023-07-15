import UIKit

// Optionals

// optionals imply that data may be there, or it might be nil
// these are powerful bec it means our normal data types are non-optionals, i.e; they wont be nil

// optional data needs to be unwrapped in a conditional as such:
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}


// another way to unwrap optionals involves "guard let". An example is shown below:
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}


// with the nil-coalescing operator, you can provide default values for optionals as such:

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

// this would produce the exact same result:
// let new = captains["Serenity", default: "N/A"]

// but the nil coalescing operator is more versatile, like when you call getrandomelement on an empty array

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

// or when you're converting data types
let input = ""
let number = Int(input) ?? 0
print(number)


// Optional chaining allows us to say “if the optional has a value inside, unwrap it then…” and we can add more code. In our case we’re saying “if we managed to get a random element from the array, then uppercase it.” Remember, randomElement() returns an optional because the array might be empty.
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// example 2: optional chaining
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)
