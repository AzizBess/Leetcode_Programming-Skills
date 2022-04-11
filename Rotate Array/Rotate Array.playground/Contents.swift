/*
 Given an array, rotate the array to the right by k steps, where k is non-negative.



 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 */

/*
func rotate(_ nums: inout [Int], _ k: Int) {
    var result = Array(repeating: 0, count: nums.count)
    let k = k % nums.count
    var j = k
    for index in 0..<nums.count {
        if index + k <= nums.count - 1 {
            result[index + k] = nums[index]
        } else {
            result[k - j] = nums[index]
            j -= 1
        }
    }
    nums = result
}
*/

// find pivot
// rotate entire array
// rotate before the pivot
// rotate after the pivot

func rotate(_ nums: inout [Int], _ k: Int) {
    if nums.isEmpty { return }
    let k = k % nums.count
    let len = nums.count - 1
    swapArray(&nums, startIndex: 0, endIndex: len)
    swapArray(&nums, startIndex: 0, endIndex: k - 1)
    swapArray(&nums, startIndex: k, endIndex: len)
}

func swapArray(_ nums: inout[Int], startIndex: Int, endIndex: Int) {
    var left = startIndex
    var right = endIndex
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}




var nums = [1,2,3,4,5,6,7]
let k = 3

var nums2 = [-1,-100,3,99]
let k2 = 2

var nums3 = [1, 2]
let k3 = 8

var nums4 = [1,2,3]
let k4 = 4
rotate(&nums, k)
