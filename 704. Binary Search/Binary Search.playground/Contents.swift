/*
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.



 Example 1:

 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 Example 2:

 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1


 Constraints:

 1 <= nums.length <= 104
 -104 < nums[i], target < 104
 All the integers in nums are unique.
 nums is sorted in ascending order.
 */

/*------------------------------------BRUTE FORCE------------------------------------*/
 /*
  func search(_ nums: [Int], _ target: Int) -> Int {
          for index in 0..<nums.count {
              let value = nums[index]
              if value == target {
                  return index
              }
          }
          return -1
      }
  */


// MY SOLUTION
/*
func search(_ nums: [Int], _ target: Int) -> Int {
    var resultIndex = -1
    var start = 0
    var end = nums.count - 1
    var mid = ((end - start) / 2)
    var len = nums.count
    while len > 0  {
        let currentMid = mid
        let midValue = nums[mid]
        print("len = \(len) | mid = \(mid) | midValue = \(midValue)")
        if midValue < target {
            print("midValue < target, start = mid")
            start = mid
            print("end : \(end), start : \(start)")
            mid += ((end - start) / 2)
            if mid == currentMid { mid += 1 }
            print("newMid = \(mid)")
        } else if midValue > target {

            print("midValue > target, end = mid")
            end = mid
            print("end : \(end), start : \(start)")
            mid -= ((end - start) / 2) //= 2 - (((end - start) / 2) + 1)
            print("midd = \(mid)")
            if mid == currentMid { mid -= 1 }
            print("newMid = \(mid)")

        } else {
            resultIndex = mid
            break
        }
        let newLength = end - start
        len = newLength < len ? newLength : 0
        print("------------------------------------------")
    }
    return resultIndex
}
*/

//A BETTER SOLUTION

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1

    while left <= right {
        if nums[left] == target { return left }
        if nums[right] == target { return right }
        let pivot = left + (right - left)

        if nums[pivot] < target {
            left = pivot + 1
        } else if nums[pivot] > target {
            right = pivot - 1
        } else {
            return pivot
        }
    }
    return -1
}


let target2 = 2
let target4 = 0
let nums5 = [5], target5 = -5

let nums0 = [-1,0,5], target0 = -1

let nums = [-1,0,3,5,9,12], target = 9
search(nums, 12)

/*
let a = [0, 1, 2, 3, 4, 5, 6, 7, 8 ,9], t = 8
var b = a
var mid = 4

let res = b.dropFirst(mid + 1)

// midValue < target

let end = a.count - 1
let start = mid

mid += ((end - start) / 2) + 1
let length = end - start // Length > 0 so continue
print("end = \(end) | start = \(start)")
print("newMid = \(mid), newLength = \(length)")

print("length : \(length)")
print("Res : \(res)")
 */


