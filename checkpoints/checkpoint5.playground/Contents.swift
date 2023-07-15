import UIKit

// CHECKPOINT 5: You’ve already met sorted(), filter(), map(), so I’d like you to put them together in a chain – call one, then the other, then the other back to back without using temporary variables.
// Your job is to:
//Filter out any numbers that are even
//Sort the array in ascending order
//Map them to strings in the format “7 is a lucky number”
//Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter {!$0.isMultiple(of: 2)}.sorted().map {"\($0) is a lucky number"}

for num in result {
    print(num)
}
