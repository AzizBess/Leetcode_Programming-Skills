
/*
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.



 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]


 [0,1,0,3,12]

 **First ITeration**
 left = 0
 right = 12
 swap left because isEqual to 0
 [12, 1, 0, 3, 0]

 **Second ITeration**
 left = 1
 right = 3
 swap left  || isEqual to 0
 [3, 1, 0, 12, 0]

 **Third ITeration**


 */


func moveZeroes(_ nums: inout [Int]) {
    let len = nums.count
    if len <= 1 { return }
    var index = 0
    var zeroCount = 0
    while index < nums.count - 1 {
        let value = nums[index]
        if value == 0 {
            nums.remove(at: index)
            zeroCount += 1
        } else {
            index += 1
        }
    }
    for _ in 0..<zeroCount {
        nums.append(0)
    }
}

var nums = [0,1,0,3,12]

moveZeroes(&nums)
