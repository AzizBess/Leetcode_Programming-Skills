/*
 Medium
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.



 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]


 Constraints:

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 */


//func productExceptSelf(_ nums: [Int]) -> [Int] {
//    var result = Array(repeating: 1, count: nums.count)
//    var leftToRight = Array(repeating: 1, count: nums.count)
//    var rightToLeft = Array(repeating: 1, count: nums.count)
//    var left = 1
//    var right = leftToRight.count - 2
//
//    while left <= nums.count - 1 {
//        leftToRight[left] = nums[left-1] * leftToRight[left-1]
//        rightToLeft[right] = nums[right+1] * rightToLeft[right+1]
//        left += 1
//        right -= 1
//    }
//
//    for i in result.indices {
//        result[i] = leftToRight[i] * rightToLeft[i]
//    }
//    print("result \(result)")
//    return result
//}

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 1, count: nums.count)
    result[0] = 1
    for i in 1..<nums.count {
        result[i] = nums[i-1] * result[i-1]
    }

    var r = 1
    var j = nums.count - 1
    while j >= 0 {
        result[j] = result[j] * r
        r *= nums[j]
        j -= 1
    }
    return result
}

var nums1 = [1,2,3,4]
var nums5 = [4,5,1,8,2,10,6]
let a = productExceptSelf(nums5)
