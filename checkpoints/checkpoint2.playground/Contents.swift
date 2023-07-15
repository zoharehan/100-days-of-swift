import UIKit

//CHECKPOINT 2

// 1. Create an array of strings
var items = [String]()
// 2. Assign elements to it.
items = ["hello", "hi", "bonjour", "hello"]
// 3. Print the count.
print("the total number of elements in this array are \(items.count)")
// Print the unique element count.
let items_set = Set(items)
print("the total number of unique elements in this array are \(items_set.count)")
