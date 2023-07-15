import UIKit

// Day 1 & 2

let number = 0.1+0.2
print(number)

let a = 1
let b = 2.3
//typecasting
let c = Double(a)+b


var name = "johnny"
// once swift assigns a data type to a variable it can't be
// altered.
//name = 7

var rating = 4.5
rating *= 2
print(rating)

// string concatenation
var haters = "haters"
var hate = "hate"
var lyric = haters + " gonna " + hate
print(lyric)

//string interpolation
var taylor = "taylor swift"
var year = 1989
var statement = "Hello my name is \(taylor) and i was born in \(year)"
print(statement)

var calculation = "5+5 makes \(5+5)"
print(calculation)


