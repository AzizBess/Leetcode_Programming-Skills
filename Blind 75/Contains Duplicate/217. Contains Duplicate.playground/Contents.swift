/*
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.



 Example 1:

 Input: nums = [1,2,3,1]
 Output: true
 Example 2:

 Input: nums = [1,2,3,4]
 Output: false
 Example 3:

 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true


 Constraints:

 1 <= nums.length <= 10^5
 -10^9 <= nums[i] <= 10^9
 */

/*
//-------- Method 1 --------
func containsDuplicate(_ nums: [Int]) -> Bool {
    var dictionary = [Int:Int]()
    let sorted = nums.sorted()
    for num in sorted {
        if dictionary[num] != nil {
            return true
        }
        dictionary[num] = 1
    }
    return false
}
*/

func containsDuplicate(_ nums: [Int]) -> Bool {
    let sorted = nums.sorted()
    for i in 0..<nums.count - 1 {
        if sorted[i] == sorted[i+1] {
            return true
        }
    }
    return false
}

