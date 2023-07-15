import UIKit

//Checkpoint 3: FizzBuzz

//for i in 1...100 {
//    if (i%3 == 0 && i>=3) && (i%5 == 0 && i>=5) {
//        print("FizzBuzz")
//    } else if (i%3 == 0 && i>=3) {
//        print("fizz")
//    } else if (i%3 == 0 && i>=5) {
//        print("buzz")
//    } else {
//        print("\(i) is not a multiple of 3 or 5.")
//    }
//}

// integers have a built in isMultiple( of: ) function
// Rewritten:
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("fizz")
    } else if i.isMultiple(of: 5) {
        print("buzz")
    } else {
        print("\(i) is not a multiple of 3 or 5.")
    }
}
