/*
Given two non-negative integers low and high. Return the count of odd numbers between low and high (inclusive).



Example 1:

Input: low = 3, high = 7
Output: 3
Explanation: The odd numbers between 3 and 7 are [3,5,7].
Example 2:

Input: low = 8, high = 10
Output: 1
Explanation: The odd numbers between 8 and 10 are [9].


Constraints:

0 <= low <= high <= 10^9


 PERSONAL TESTS :
 ODD + ODD = EVEN
 ODD + EVEN = ODD
 EVEN + EVEN = EVEN


1 - check if low is ODD
2 - Check if high is ODD
3 - If low and high ODD, numberOfOdd = differnce sur 2 + 1
4 - else numberOfOdd = differnce sur 2

 */

func countOdds(_ low: Int, _ high: Int) -> Int {
    var count = 0
    let differenceDivededByTwo = Int((high - low) / 2)
    let isLowOdd = low % 2 != 0
    let isHighOdd = high % 2 != 0
    count = (isLowOdd || isHighOdd) ? differenceDivededByTwo + 1 : differenceDivededByTwo
    return count
}

print("ODD ODD \(countOdds(3, 7))")
print("ODD EVEN \(countOdds(7, 10))")
print("EVEN EVEN \(countOdds(8, 10))")
