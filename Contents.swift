import UIKit

//
//  main.swift
//  SwiftIntro
//
//  Created by Jenny Chang on 27/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

import Foundation

// Convert value to a string ()

let label = "the width is "
let width = 94
let widthLabel = label + String(width)

print(widthLabel)


// Simpler way: add a slash and wrap the integers around ()

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."

let quotation = """
I have \(apples + oranges) pieces of fruit
"""
print(quotation)

// Using arrays

var shoppingList = ["bananas","water","avocados"]
print(shoppingList[1]) // prints water

// to add an item to the array (index 3)
shoppingList.append("blue paint")

// to change the name of blue paint item
shoppingList[3] = "blue painttttt"

// to add 3 more items
shoppingList.append(contentsOf: ["feta","hummus","nuts"])

// to remove these 3 items and then replace these with two items
shoppingList[4...6] = ["mozzarella","seeds"]


// if we want to create an array that passes in different types
let teachers:[Any] = ["Roland","Sam","Danny",10]

for _ in shoppingList {
    print("a new item")
    // it will just print the same statement as many times in here
}

for i in 0..<teachers.count {
    print("a new teacher - \(teachers[i]) index - \(i)")
}

// Using dictionaries

var locations = [
    "London" : "United Kingdom",
    "Vancouver" : "Canada",
    "San Francisco" : "United States",
]
print(locations["London"]!) // note the exclamation mark!

// add another location
locations["Beirut"] = "Lebanon"

// to remove a location
    locations["London"] = nil


// Create an empty array or dictionary, use the initializer syntax

let emptyArray = [String]()
let emptyictionary = [String: Float]()

// if type info can be inferred, you can just say this

shoppingList = []
locations = [:]

// IF AND SWITCH STATEMENTS

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore) // prints 11

// adding ? after string to mark the value as optional

var optimalString: String? = "Hello"
print(optimalString == nil) // prints "false"

var optionalName: String? = "Jenny Chang" // if we change name to nil, then it simply won't print
var greeting = "hiiii!"
if let name = optionalName {
    greeting = "hiiii, \(name)"
    print(greeting)
}

// Using switch statements

let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            print(kind)
        }
    }
}
print(largest)

// Using WHILE

var n = 2
while n < 100 {
    n *= 2
}
print(n) // prints 128

// or repeat while...

var m = 2
repeat {
    m *= 2
} while m < 100
print(m) // same result: 128

// keep an index in a loop:

var total = 0
for i in 0..<4 { // range 0-3 (use ... to include 4)
    total += i
}
print(total)

// Functions
// --> separates parameters and return type
// if a function just has () this means it's a void type
//(string,[string]) -> string? this means take a string, then take an array of strings, and return an optional string

func greet(person: String, special: String) -> String {
    // perform the function here
    return "Hello \(person), today is \(special)."
}
print(greet(person: "JC", special: "FISH AND CHIPS")) // prints "Hello JC, today is FISH AND CHIPS."

// Returning multiple values in a function

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [50, 25, 78, 102, 49])
print(statistics.max)
print(statistics.sum)

NSLog("yo i miss ya objective c already, why ya leave me eh?");

// Functions can be nested - nested functions have access to the variables in the outer function

func returnFifteen () -> Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y // y returns 15
}

print(returnFifteen())

// Functions are first class types --> they can return a function as their value

func makeIncrementer() -> ((Int) -> Int) { // returns another function that returns an int
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7)) // returns 8

// Functions as arguments

//func filterInts(_ numbers: [Int], _includeNumber: (Int) -> Bool) -> [Int] {}
//// take in an array of numbers, take in int and convert to bool is the divisible by 2 method, and then return int type
//
//let numbersArray = [4, 17, 34, 41, 82]
//func divisibleByTwo(_ number:Int) -> Bool {
//    return number % 2 == 0
//}
//
//let evenNumbers = filterInts(numbersArray, _includeNumber: divisibleByTwo)
//print(evenNumbers)

// CLOSURES - blocks (Objective-C)
// self contained locks of functionality that can be passed around


var numbers = [20, 19, 7, 12]
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// OBJECTS AND CLASSES
// Use class followed by the class's name to create a class

class Shape{
    //  property declaration is written in the same way as a constant
    var numberOfSides = 0
    var name: String
    
    // don't forget to initialize
    // we can get away with not using initializers if we pass in the value striaght away
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    let angle = 60
    func triangle() -> String {
        return "An isosceles triangle has \(angle) degree angles"
    }
}

// extension of shape
extension Shape {
    func uppercaseType() {
        print("uppercased type = \(self.name.uppercased())")
    }
}

// Creating an instance of class shape
var shape = Shape(name: "hexagon") // equivalent to Shape *shape
shape.numberOfSides = 6
var shapeDescription = shape.simpleDescription()

// every property needs a value assigned or passed in the initializer
// use deinit to perform cleanup before an object is deallocated

// SUPERCLASSES AND SUBCLASSES

class Square : Shape {
    // child is the subclass and parent is the superclass
    // when a subclass overrides the superclass's method, we use "override"
    
    var sideLength: Double // unique to my subclass
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    // overriding superclass's method
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 6, name: "my test square")
print(test.area()) // prints 36
print(test.simpleDescription()) // prints "A square with sides of length 6.0"

class Triangle : Shape {

    var radius : Double // unique to my subclass

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 3
    }

    func area() -> Double {
        return 0.5 * radius // obviously not true but whatever
    }

    override func simpleDescription() -> String {
        return "A triangles with a radius of \(radius) and number of sides \(numberOfSides)"
    }

}

let testT = Triangle(radius: 4, name: "my test triangle")
print(testT.area())
print(testT.simpleDescription())

// GETTERS AND SETTERS

// Initializing a subclass has 3 steps:
// 1) setting the value of properties that the subclass declares
// 2) calling the superclass's initializer
// 3) changing the value of properties defined by the superclass. (Any additional setup e.g. getters/setters can also be done)

// Example:
class EquilateralTriangle : Shape {
    
    var sideLength : Double = 0 // step 1
    
    init(sideLength: Double, name: String) { // step 2
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter : Double { // step 3 getters/setters
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0 // default name for the return of the getter method
        }
    }
    
    override func simpleDescription() -> String {
        return "an equilateral triangle has length sides of \(sideLength)"
    }
    
}

// Property observers - willSet and didSet
// willSet is called before setting the new value and getSet is called after the vlaue has been set

struct Person {
    var name: String
    var age: Int
}

class ViewController: UIViewController {
    var person: Person? {
        didSet {
            print("called after setting the new value")
            if let name = person?.name {
                print("my new name is \(name) and old name is \(String(describing: oldValue?.name))")
            }
        }
        willSet(myNewValue) {
            print("called before setting the new value")
                if let newName = myNewValue?.name {
                    print("My new name is \(newName)")
                }
            }
        }
    }

// another example:
struct Rectangle {
    var width = 12
    var height = 10
    var area: Int {
        return width * height // function within a struct property
    }
}

var rectangle = Rectangle()
print(rectangle.width) // will print 12

// extensions lets you add functionality to an existing type. we can use extensions to divide our code. the following is an extension of the rectangle struct
//
//extension Rectangle {
//    func fitsInside(_ other: Rectangle) -> Bool {}
//    var area {}
//}


// Optional values: when we have "?" before operations like methods and properties
// if the value before the ? is nil, everything after the ? is ignored and the result is nil

var myString:String? = nil

if myString != nil {
    print(myString)
} else {
    print("my string has nil value")
}

// we can also use ? for methods, if everything before the ? is nil, then return nil

// CREATING ENUMS
// we can write .spring b ecause the value of self is already been to be a season
// we use dot notation to access its cases
// note we don't have break statements in swift as once a switch statement ends, it jumps to the end of the switch statment

enum Seasons {
    case spring, summer, autumn, winter
    
    func weatherDescription() -> String {
        switch self {
        case .spring:
            return "spring"
        case .summer:
            return "summer"
        case .autumn:
            return "autumn"
        case .winter:
            return "winter"
            
        // if the switch cases don't cover all the cases, then we can use "default" which covers all other instances
        }
    }
}

// fast enumeration
let instructors = ["Sam","Danny","Roland"]
for instructor in instructors {
    print(instructor)
}

// using sets to check if there is a person in an array
//let teachersSet = Set(teachers)
//teachersSet.contains("Spencer")

let sun = Seasons.summer
let sunDescription = sun.weatherDescription()
print(sunDescription)

// we can also have enums where we don't predetermine the value for each instance

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6am", "8pm")
let failure = ServerResponse.failure("out of battery")

switch success {
case let .result(sunrise, sunset):
    print("sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("failure is ...\(message)")
}

// prints "sunrise is at 6am and sunset is at 8pm"

// STRUCTS - to create a structure
// supports the same behaviour as classes (including methods and initializers)
// key diff between structs and classes: structs must be copied when passed around in code whereas classes are referenced. structs also cannot be subclassed.

struct Location {
    let latitude: Double
    let longitude: Double
}

// now we can instantiate one and store it in a constant or a variable
let pizzaLocation = Location(latitude: 20, longitude: 40)

// structs also have initializers
struct Shape1 {
    var numberOfSides = 0
    
    init(numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
    
    func description() -> String {
        return "a shape with \(numberOfSides) sides"
    }
}


// PROTOCOLS

protocol BeMySlave {
    var simpleDescription: String { get }
    mutating func adjust ()
}

// now classes, enums and structs can all adopt this protocol
// note classes don't need "mutating func" as methods in a class can always  modify the class

class matteo: BeMySlave {
    var simpleDescription: String = "hi I'm matteo and i love pizza"
    var jobLevel = 4
    func adjust() {
        simpleDescription += "adjusting my function with this string"
    }
}

struct Parameter: BeMySlave {
    var simpleDescription: String = "yo just a parameter"
    mutating func adjust() {
        simpleDescription += "adding extra bits"
    }
}

// another example of protocol

class Board {}

protocol Player {
    func takeTurn(on board: Board)
}

struct HumanPlayer: Player {
    var name: String
    var score: Int
    func takeTurn(on board: Board) {
        ////
    }
}

/*
class HumanPlayer : Player {
    override func takeTurn(on board: Board) {
    // show move then wait
    }

class Computerplayer : Player {
    override func takeTurn(on board: Board) {
    // pick the best legal move using AI
    }

    }
*/

// another example of protocols

protocol Door {
    var isLocked: Bool { get set }
    func open()
    func close()
}

struct SlidingDoor: Door {
    var isLocked: Bool = false
    func open() {
        // slide to open
    }
    func close() {
        // slide to close
    }
}

// ERROR HANDLING
// represent errors using any type that adopts the Error protocol

// error protocol:
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// use throw to throw an error and throws to mark a function that can throw an error

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "never has toner" {
        throw PrinterError.noToner
    }
    return "job sent"
}

// or we can catch errors using do-catch (even using multiple catch)

do {
    let printerResponse = try send(job: 1040, toPrinter: "FITCH SOLUTIONS")
    print(printerResponse)
} catch PrinterError.onFire {
    print("yo it's on fire")
} catch let printerError as PrinterError {
    print("printer error: \(printerError)")
} catch {
    print(error)
}

// we can always add ? to the end of try --> if the code is executed and the result throws an error, then return nil

// we can use defer to write a block of code that is executed after all other code in the function and is executed regardless of whether the function throws an error

var fridgeIsOpen = false
var fridgeContent = ["eggs", "avocados", "feta"]

// when we use _ this means we don't provide a label for it when we call it
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)
// prints false as that's the deferred method executed

// GENERICS <> similar to Obj-C, specifying type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

// USE "where" right before the body to specify a list of requirements
// e.g. require the type to implement a protocol or for two types to be the same or for a subclass to have a particular superclass

