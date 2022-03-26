/*
 Given an integer number n, return the difference between the product of its digits and the sum of its digits.


 Example 1:

 Input: n = 234
 Output: 15
 Explanation:
 Product of digits = 2 * 3 * 4 = 24
 Sum of digits = 2 + 3 + 4 = 9
 Result = 24 - 9 = 15
 Example 2:

 Input: n = 4421
 Output: 21
 Explanation:
 Product of digits = 4 * 4 * 2 * 1 = 32
 Sum of digits = 4 + 4 + 2 + 1 = 11
 Result = 32 - 11 = 21


 Constraints:

 1 <= n <= 10^5

 WAY OF THINKING:
 1 - convert n into an array
 2 - go through array 1 by 1 calculate sum and product
 3 - return difference

 Best Solution out there
 1- Don't iterate twice, don't need to convert the int into an array of int (useless loop)
 */

//My Solution
func subtractProductAndSum(_ n: Int) -> Int {
    var result = 0
    var sum = 0
    var product = 1
    guard n >= 1 && n <= 100000 else { return result }
    let intArray = String(n).compactMap({ Int(String($0)) })
    intArray.forEach({ singleInt in
        sum += singleInt
        product *= singleInt
    })
    result = product - sum
    return result
}

//Best Solution

func bestSubtractProductAndSum(_ n: Int) -> Int {
    var n = n
    var sum = 0
    var product = 1

    while n > 0 {
        let digit = n % 10
        sum += digit
        product *= digit
        n /= 10
    }
    return product - sum
}


print("Result : \(bestSubtractProductAndSum(234))")
