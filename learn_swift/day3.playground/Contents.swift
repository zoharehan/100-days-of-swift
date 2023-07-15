import UIKit

// Arrays, Dictionaries, Sets and Enums
var temperatures = [2.0,3.22,5.9]
// arrays can only contain one type of thing
//temperatures.append("silly")
temperatures.append(5.0)


var stringArray: [String] = ["STOP", "YOU'RE", "LOSING", "ME"]
print(stringArray)

var badWayToStoreThis = ["Hits Different", "Taylor Swift", "2022"]

var goodWayToStoreThis = [
    "song": "Hits Different",
    "artist": "Taylor Swift",
    "release year": "2022"]
print(goodWayToStoreThis["song", default: "Unknown"])

//initialising an empty dictionary
var dict = [String: Int]()
dict["Taylor Swift"] = 1989
// two keys cant exist, swift will overwrite value
dict["Taylor Swift"] = 2000
print(dict) // -> dont overwrite unless necessary
print(dict.count) // -> prints 1

// this is valid but returns nil so sort of pointless
// however, searched keys have to be of the same type as key type.
let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]

// Sets
var gracieSongs = Set<String>()
gracieSongs.insert("I should hate you")
gracieSongs.insert("I miss you, I'm sorry")
print(gracieSongs)

//enums
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
// because we know the type will always be Weekday since we set it once at the top.
// enums are efficient because they're stored as integers by swift and not as strings.
day = .tuesday
