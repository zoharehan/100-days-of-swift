import UIKit

var isOn: Bool = true

if (isOn){
    print("it's on")
        }

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
} else {
    print("its all good")
}

// Display the result
print(numbers)

var name: String = "Taylor Swift"
var song: String = "Fearful"

if name == "Taylor Swift" && song == "Fearless" {
    print("the pair matches")
} else if song == "I miss you, Im sorry" {
    print("the song is by gracie")
} else {
    print("mismatched pair")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car
}

var transportPicked: TransportOption = .airplane

if (transportPicked == .airplane || transportPicked == .helicopter) {
    print("lets fly")
}

enum Singer {
    case kanye,taylor,gracie,pheobe,john
}

var pickedSinger = Singer.gracie

switch pickedSinger {
case .kanye:
    print("boooooooo")
case .taylor, .gracie, .pheobe:
    print("nice!")
case .john:
    print("booooooo")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}
//That will match the first case and print “5 golden rings”, but the fallthrough line means case 4 will execute and print “4 calling birds”, which in turn uses fallthrough again so that “3 French hens” is printed, and so on.

// ternary operators
let age = 18
let canVote = age >= 18 ? "Yes" : "No"
print("Can you vote? \(canVote)")


var lyric: String = "Haters gonna"
// when you're not going to use the variable, you should use "_"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// random number in a range
let id = Int.random(in: 1...1000)


var counter = 2
while counter < 64 {
    print("\(counter) is a power of 2.")
    counter *= 2
}

var cats: Int = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        cats = 10
    }
}

var number: Int = 10
while number > 0 {
    number -= 2
    if number % 2 == 0 {
        print("\(number) is an even number.")
    }
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}
