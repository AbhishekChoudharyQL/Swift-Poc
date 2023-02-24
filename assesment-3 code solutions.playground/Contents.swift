import UIKit


// QUESTION 3
var nilOptional: String?
nilOptional = nil
if let noCoffee = nilOptional {
    print("the opional has value")
} else {
    print("the optional is nil")
}
 /*
  explanation - the above code will give output "the optional is nil" becuase nilOptional variable is
    holding nil value and when we check the condition
   using if let (optional binding) only else block will
    be executed.
  */

// QUESTION -4

//var  temp : String? = nil
//print(temp!)
/*
 the above code will throw error as we are trying to force
 unwrap an optional having a nil value
 */

// QUESTION -5
enum DivisionError: Error{
    case diviedByZero
}
func divison(numertor:Int,denominator:Int) throws{
    if denominator == 0 {
        throw DivisionError.diviedByZero
    } else {
        let result = numertor / denominator
        print(result)
    }
}
do {
    try divison(numertor:10,denominator:0)
    print("valid divison")
}
catch DivisionError.diviedByZero {
    print("Error: Denominator cant be found")
}
/*
 output of above code is "Error: Denominator cant be found".
 Reason->> Error will be generated when we try to divide by
 zero . The error is thrown and catch in "do-catch" block
  with this error will be caught and output will be printed
  to console.
 */
// QUESTION -7
extension String {
    func trimspaces() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
let example = " this is example "
let trimmedexample = example.trimspaces()
print(trimmedexample)

/*
 explanation -> in order to create an extenion we can define
  a function which will remove any white spaces from
 begining and end. The trimingCharacter() remove whitespace
  as well as new line .
 */

 // QUESTION-8
func add<T:Numeric>(first:T, second:T) -> T {
    return first + second
}
print(add(first:2,second:4.0))
/*
 explanation-> here we have made a generic function which
  will add two numbers. For int , float and double we can use
  "Numeric protocol" . Here we have constrained the generic
 parameter to be of int ,float and double type...
 */

// QUESTION - 10
protocol Greet{
    var name: String{
        get
    }
    func message()
}

class Employee: Greet{
    var name = "Perry"
    func message(){
        print("Good morning",name)
    }
}
var employee1 = Employee()
employee1.message()

/*
 output will be - "Good morning Perry"
 Since we have defined a protocol Greet and it has a variable
 name and function to print. So class Employees conforms to
 Greet Protocol so it must have variable and funcion..
 
 
 */

// QUESTION-11

struct Theme {
    var ID: Int
    var name: String
    struct color {
        var tint: String
        var tintDisabled: String
        var accent: String
        var background: String
        var items: [String]
    }
}
let mycolor = Theme.color.init(tint: "hi", tintDisabled:"No", accent: "yy", background: "kkgj", items: ["jk","gygu"])

print(mycolor.tint)
/*
 explanation -> we have created  a nested type ,color is declared as a type inside the Theme type, so to create an instance of color we would use this notation:
 
 let myColor = Theme.color( ... )
 */
 // QUESTION -15......
struct Element {
    var name: String
    var number: Int
}
var firstElement = Element(name: "A",number: 1)
var secondElement =  firstElement
secondElement.name = "B"
secondElement.number = 2
print(firstElement)
print(secondElement)
/*
 explanation-> we have intialised first element and have given values name: "A", number : 1 so when we print
   first- element output should be Element(name: "A", number: 1) . Now secondElement is made equal to
   firstElement. In other words a copy of firstElement is made. After when we change the value of second/element
  only that copy changes , no changes in firstElement .
 "Structs are value types............"
 */
