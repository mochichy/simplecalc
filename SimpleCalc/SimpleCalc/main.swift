//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    
    // calculate(["2", "+", "2"]): This should return 4
    public func calculate(_ args: [String]) -> Int {
        var op = ""
        let length = args.count
        
        if length == 1 {
            return 0
        }
        // find the operator
        if length < 3 || Int(args[length - 1]) == nil {
            op = args[length - 1]
        } else {
            op = args[1]
        }
        var res : Int = 1
        switch op {
        case "+":
            res = Int(args[0])! + Int(args[2])!
        case "-":
            res = Int(args[0])! - Int(args[2])!
        case "*":
            res = Int(args[0])! * Int(args[2])!
        case "/":
            res = Int(args[0])! / Int(args[2])!
        case "%":
            res = Int(args[0])!
            let y = Int(args[2])!
            while res >= y {
                res -= y
            }
        case "count":
            res = length - 1
        case "avg":
            print(length)
            if length > 2 {
                for index in 0...(length - 2) {
                    res += Int(args[index])!
                }
                res /= (length - 1)
            } else {
                res = Int(args[0])!
            }
        case "fact":
            if Int(args[0]) != 0 {
                for index in 1...(Int(args[0])!) {
                    res *= index
                }
            }
        default:
            res = 0
        }
        return res
    }
    
    // takes the String and splits it into multiple Strings and passes that to the array-of-Strings version of calculate
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
/*let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))*/
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))


