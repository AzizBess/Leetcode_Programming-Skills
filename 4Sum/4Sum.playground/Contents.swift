/*

 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.


sla
 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]


 Constraints:

 1 <= nums.length <= 200
 -10^9 <= nums[i] <= 10^9
 -10^9 <= target <= 10^9

 */

/*

 func twoSum(_ nums: [Int], target: Int) -> [Int] {
     var dict = [Int:Int]()
     for index in 0..<nums.count {
         let value = nums[index]
         let remToTarget = target - value
         if let otherIndex = dict[remToTarget] {
             return [index, otherIndex]
         } else {
             dict[value] = index
         }
     }
     return [-1, -1]
 }

 */


/*------------------BRUTE FORCE O(N4)------------------*/
/*
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var resultSet = Set<[Int]>()

    for i in 0..<nums.count - 3 {
        for j in i+1..<nums.count - 2 {
            for k in j+1..<nums.count - 1 {
                for l in k+1..<nums.count {
                    let sum = nums[i] + nums[j] + nums[k] + nums[l]
                    if sum == target {
                        resultSet.insert([nums[i], nums[j], nums[k], nums[l]])
                    }
                }
            }
        }
    }

    return Array(resultSet)
}
*/
/*------------------Optimized O(N3)------------------*/
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let len = nums.count
    guard len >= 4 , len <= 200 else { return [] }

    var result = [[Int]]()
    let sort = nums.sorted()

    for a in 0..<(len - 1) where a == 0 || sort[a] != sort[a-1] {
        for b in (a + 1)..<len where b == a + 1 || sort[b] != sort[b-1] {
            var c = b + 1, d = len - 1
            while c < d {
                let val = (a: sort[a], b: sort[b], c: sort[c], d: sort[d])
                let sum = (val.a + val.b + val.c + val.d)
                if sum == target { result.append([val.a,val.b,val.c,val.d]) }
                if sum < target {
                    while sort[c] == val.c, c < d { c += 1 }
                } else {
                    while sort[d] == val.d, d > b { d -= 1 }
                }
            }
        }
    }
    return result
}

let nums = [1,0,-1,0,-2,2], target = 0
let nums2 = [1,0,-1,0,-3,3], target2 = 0
let nums3 = [2,2,2,2,2], target3 = 8
print(fourSum(nums, target))
