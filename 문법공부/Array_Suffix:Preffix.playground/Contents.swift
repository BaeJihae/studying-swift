import UIKit


//let arr = [1, 2, 3, 4].prefix(3)
//type(of: arr) //ArraySlice<Int>.Type
//
//let arrA = Array(arr)
//type(of: arrA) //Array<Int>.Type

let arr = [1, 2, 3, 4]

//print(arr.prefix(-1)) // error
print(arr.prefix(1)) // [1]
print(arr.prefix(2)) // [1, 2]
print(arr.prefix(3)) // [1, 2, 3]
print(arr.prefix(4)) // [1, 2, 3, 4]
print(arr.prefix(5)) // [1, 2, 3, 4]
print(arr.prefix(100)) // [1, 2, 3, 4]

//print(arr.prefix(through: -2)) // error
print(arr.prefix(through: -1)) // []
print(arr.prefix(through: 0)) // [1]
print(arr.prefix(through: 1)) // [1, 2]
print(arr.prefix(through: 2)) // [1, 2, 3]
print(arr.prefix(through: 3)) // [1, 2, 3, 4]
//print(arr.prefix(through: 5)) // error


//print(arr.prefix(upTo: -2)) // error
//print(arr.prefix(upTo: -1)) // error
print(arr.prefix(upTo: 0)) // []
print(arr.prefix(upTo: 1)) // [1]
print(arr.prefix(upTo: 3)) // [1, 2, 3]
print(arr.prefix(upTo: 4)) // [1, 2, 3, 4]
//print(arr.prefix(upTo: 5)) // error



print(arr.prefix(upTo: 2)) // [1, 2]
print(arr[..<2]) // [1, 2]

print(arr.prefix(through: 2)) // [1, 2, 3]
print(arr[...2]) // [1, 2, 3]

let arr1 = [ 4, 5, 6, 3, 2, 1]
print(arr1.prefix(while: { $0 >= 4 })) // [4, 5, 6]


print(arr.suffix(0))
//print(arr.suffix(-1)) // error
print(arr.suffix(3))



//print(arr.suffix(from: -1)) //error
print(arr.suffix(from: 0)) // [1, 2, 3, 4]
print(arr.suffix(from: 3)) // [4]
print(arr.suffix(from: 4)) // []
//print(arr.suffix(from: 5)) //error

print(arr.suffix(from: 3)) // [4]
print(arr[3...]) // [4]
