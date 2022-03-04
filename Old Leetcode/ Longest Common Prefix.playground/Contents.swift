import UIKit

/*
Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".



Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.


Constraints:

1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lower-case English letters.
*/

func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count >= 1 else { return "" }
    guard strs.count <= 200 else { return "" }
    var prefix = ""
    var previous = ""
    strs.forEach { word in
        if word.count >= 0 && word.count <= 200 {
            if prefix.isEmpty && word != strs.last ?? "" {
                prefix = word
            } else {
                for i in 0...min(previous.count, word.count) - 1 {
//                    let wordIndex = word.index(word.startIndex, offsetBy: i)
//                    let previousIndex = previous.index(previous.startIndex, offsetBy: i)
//                    if previous[previousIndex] == word[wordIndex] {
//                        if i == 0 {
//                            prefix = String(previous[previousIndex])
//                        } else {
//                            prefix.append(previous[previousIndex])
//                        }
//                    } else {
//                        if i == 0 {
//                            prefix.removeAll()
//                            break
//                        }
//                    }
                }
            }
            previous = word
        }
    }

    return prefix
}

var strs = ["a"]
longestCommonPrefix(strs)


/*
 - Iteration 1
prefix = ""
$0 = "flower"
set prefix = "flower"

 - Iteration 2
 prefix = "flower"
 $0 = "flow"
 set prefix = "flow"

 - Iteration 3
 prefix = "flow"
 $0 = "flight"
 set prefix = "fl"
 */
