/*
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.



 Example 1:

 Input: nums = [1,3,5,6], target = 5
 Output: 2
 Example 2:

 Input: nums = [1,3,5,6], target = 2
 Output: 1
 Example 3:

 Input: nums = [1,3,5,6], target = 7
 Output: 4


 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums contains distinct values sorted in ascending order.
 -104 <= target <= 104
 */


func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    let len = nums.count
    guard len >= 1, len <= 10000 else { return -1 }

    var left = 0
    var right = len - 1

    while left <= right {
        let mid = left + ((right - left) / 2)
        let midValue = nums[mid]
        print("left = \(left), right = \(right)")
        print("mid = \(mid), midValue = \(midValue)")

        if midValue < target {
            left = mid + 1
//            if left > right || (mid + 1 < len && nums[mid + 1] > target) {
//                return left
//            }
        } else if midValue > target {
            right = mid - 1
//            if right < 0 && nums[0] > target {
//                return 0
//            }
        } else {
            return mid
        }
        print("________________________________")
    }

    return left
}

let nums = [1,3,5,6], target = 7

let result = searchInsert(nums, target)

print("result = \(result)")
