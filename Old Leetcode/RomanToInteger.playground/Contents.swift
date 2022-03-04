import UIKit
import Darwin

/*

 Example 1:

 Input: s = "III"
 Output: 3
 Example 2:

 Input: s = "IV"
 Output: 4
 Example 3:

 Input: s = "IX"
 Output: 9
 Example 4:

 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 5:

 Input: s = "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

 1 <= s.length <= 15
 s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
 It is guaranteed that s is a valid roman numeral in the range [1, 3999].


 */



func romanToInt(_ s: String) -> Int {
    let dictionnary = ["I":1, "V":5, "X":10,"L":50,"C": 100,"D":500,"M": 1000]
    guard s.count > 0, s.count < 16 else { return 0 }
    guard s.range(of: "^[I,V,X,L,C,D,M]+$", options: .regularExpression) != nil else { return 0 }
    let acceptanceRange = 1...3999
    var result = 0
    var prev = 0

    for numeral in s.reversed() {
        let value = dictionnary[String(numeral)] ?? 0

        result += (value >= prev ? 1 : -1) * value
        prev = value
    }
    
    return acceptanceRange.contains(result) ? result : 0
}
let yo = romanToInt("MCMXCIV")
print(yo)
