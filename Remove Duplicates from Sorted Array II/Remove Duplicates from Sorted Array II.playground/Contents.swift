/*
 Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.



 Example 1:

 Input: nums = [1,1,1,2,2,3]
 Output: 5, nums = [1,1,2,2,3,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 Example 2:

 Input: nums = [0,0,1,1,1,1,2,3,3]
 Output: 7, nums = [0,0,1,1,2,3,3,_,_]
 Explanation: Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).


 Constraints:

 1 <= nums.length <= 3 * 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.
 */

/*
 - Way of thinking (S1):
 Use a dictionary with array element as key and value equals to number of occurences

 - Other Way of thinking S2:
 Since the array is ordered in non decreasing order,
 check if next is same and previous is same, remove current element.
 HEADS UP !!!!!! WHEN DELETING, DO NOT INCREMENT INDEX

 */
/* ----------WORKING SOLUTION---------- */
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count >= 1, nums.count <= 30000 else { return 0 }
    var index = 1
    while index < nums.count {
        let value = nums[index]
        let previousIndex = index - 1
        let nextIndex = index + 1
        if previousIndex >= 0, nextIndex <= nums.count - 1 {
            if value == nums[previousIndex] && value == nums[nextIndex] {
                nums.remove(at: index)
            } else {
                index += 1
            }
        } else {
            index += 1
        }
    }
    return nums.count
}


var nums = [0,0,1,1,1,1,2,3,3]
var nums2 = [0, 0, 0, 0, 0]
print(removeDuplicates(&nums))




//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    //S1 : This is more complex because we need to change the nums array too. if it was just about return the array count, it would definitely work
//    var dictionary = [Int:Int]()
//    for index in 0..<nums.count {
//        let value = nums[index]
//        if let occurence = dictionary[value], occurence < 2 {
//            dictionary[value] = occurence + 1
//        } else {
//            dictionary[value] = 1
//        }
//    }
//    print("resultArray : \(dictionary)")
//    return nums.count
//}
