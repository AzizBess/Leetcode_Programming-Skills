/*
 344. Reverse String
 Easy

 4803

 934

 Add to List

 Share
 Write a function that reverses a string. The input string is given as an array of characters s.

 You must do this by modifying the input array in-place with O(1) extra memory.



 Example 1:

 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]


 Constraints:

 1 <= s.length <= 105
 s[i] is a printable ascii character.
 */

/*
/* -------------------- First Try -------------------- */
func reverseString(_ s: inout [Character]) {
    guard 1...100000 ~= s.count else { return }
    var left = 0
    var right = s.count - 1

    while left < right {
        s.swapAt(left, right)
        left += 1
        right -= 1
    }
    print(s)
}
*/
/* -------------------- Autrement -------------------- */
func reverseString(_ s: inout [Character]) {
    guard 1...100000 ~= s.count else { return }
    var left = 0
    var right = s.count - 1

    while left < right {
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        left += 1
        right -= 1
    }
}

var s: [Character] = ["h","e","l","l","o"]

reverseString(&s)
