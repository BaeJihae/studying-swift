import UIKit

let alpabet = Regex("[a-zA-Z]")
print(alpabet)
let alpabet2 = /[a-zA-Z]/
print(alpabet2)

let lowercasedAlphabet = /[a-z]{}/
print(lowercasedAlphabet)
let lowercasedAlphabet2 = /[a-z]{5}/
print(lowercasedAlphabet2)
let lowercasedAlphabet3 = /[a-z]{5,}/
print(lowercasedAlphabet3)
let lowercasedAlphabet4 = /[a-z]{5,10}/
print(lowercasedAlphabet4)


