import UIKit

// Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

//  But there’s more:
//
//  The Animal class should have a legs integer property that tracks how many legs the animal has.
//  The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
//  The Cat class should have a matching speak() method, again with each subclass printing something different.
//  The Cat class should have an isTame Boolean property, provided using an initializer.

class Animal {
    let legs: Int
    
    init (legs: Int){
        self.legs = legs
    }
    
}

class Dog: Animal {
    func speak() {
        print("barkbark")
    }
}

class Corgi: Dog {
    override func speak() {
        print("barkbark corgi")
    }
    
}

class Poodle: Dog {
    override func speak() {
        print("barkbark poodle")
    }
    
}

class Cat: Animal {
    let isTame: Bool
    
    init (legs: Int, isTame: Bool){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("meow")
    }
    
}

class Persian: Cat {
    
    override func speak() {
        print("meow persian")
    }
    
}

class Lion: Cat {
    override func speak() {
        print("meow roar")
    }
    
}

// Testing
let corgiDog = Corgi(legs: 4)
corgiDog.speak()

