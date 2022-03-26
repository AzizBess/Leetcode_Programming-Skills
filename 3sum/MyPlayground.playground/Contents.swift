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
    guard nums.count >= 3, nums.count <= 3000 else { return [] }
    let sortedNums = nums.sorted()
    print(sortedNums)
    var resultArray: [[Int]] = []
    var dictionary: [Int:Int] = [:]
    for index in 0..<sortedNums.count {
        let value = sortedNums[index]
        let target = value * -1
        for secondIndex in index..<sortedNums.count {
            if index != secondIndex {
                let secondValue = sortedNums[secondIndex]
                let remainingToTarget = target - secondValue
                if let thirdIndex = dictionary[remainingToTarget], thirdIndex != secondIndex, thirdIndex != index {
                    let arrayToAdd = [sortedNums[index], sortedNums[secondIndex], sortedNums[thirdIndex]].sorted()
                    if !resultArray.contains(arrayToAdd) {
                        resultArray.append(arrayToAdd)
                    }
                }
            }
        }
        dictionary[value] = index
    }
    return resultArray
}



let n2 = [0, 0, 0]
let n3 = [-1,1,0]
let n = [-1,0,1,2,-1,-4]
print(threeSum(n))



