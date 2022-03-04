import UIKit

/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Example 2:

Input: nums = []
Output: []
Example 3:

Input: nums = [0]
Output: []


Constraints:

0 <= nums.length <= 3000
-105 <= nums[i] <= 105
*/

func threeSum(_ nums: [Int]) -> [[Int]] {

    var resultArray: [[Int]] = []
    guard nums.count > 0, nums.count <= 3000 else { return resultArray }
    for i in 0...nums.count - 1 {
        var modifiableNums = nums
        modifiableNums.remove(at: i)
        if !modifiableNums.isEmpty {
            for j in 0...modifiableNums.count - 1 {
                var modifiableNums2 = modifiableNums
                modifiableNums2.remove(at: j)
                if !modifiableNums2.isEmpty {
                    for k in 0...modifiableNums2.count - 1 {
                        if nums[i] + modifiableNums[j] + modifiableNums2[k] == 0 {
                            let arrayToAdd = [nums[i], modifiableNums[j], modifiableNums2[k]].sorted()
                            if !resultArray.contains(arrayToAdd) {
                                resultArray.append(arrayToAdd)
                            }
                        }
                    }
                }
            }
        }
    }
    return resultArray
}

let nums:[Int] = [0,0]
print("threeSum(nums) \(threeSum(nums))")

