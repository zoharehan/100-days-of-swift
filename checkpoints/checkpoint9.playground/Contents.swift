import UIKit

// Checkpoint 9:
// Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

//If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.

func checkpoint9 (from arr: [Int]?) -> Int {
    return arr?.randomElement() ?? Int.random(in: 1...100)
}

print(checkpoint9(from: []))
print(checkpoint9(from: nil))
print(checkpoint9(from: [1,2]))

