import UIKit

var greeting = "Hello, playground"

let a = greeting.drop { $0 == "H"}  // Substring
print(type(of: a))                  // Substring

//greeting.dropFirst(-1)  // error
let k = greeting.dropFirst(3)   // "lo, playground"
print(type(of: k))              // Substring
greeting.dropFirst(10)  // "yground"greeting.dropFirst(20)  // ""

let numbers = [1, 2, 3, 4, 5]
print(numbers.dropFirst(2))  // Prints "[3, 4, 5]"
print(numbers.dropFirst(10)) // Prints "[]"




//greeting.dropLast(-1)  // error
greeting.dropLast(3)   // "Hello, playgro"
greeting.dropLast(10)  // "Hello, "
greeting.dropLast(20)  // ""
 
print(numbers.dropLast(2))  // "[1, 2, 3]"
print(numbers.dropLast(10)) // "[]"

let b = numbers.dropLast(15)

type(of: b) // ArraySlice<Int>
print(Array(b))
