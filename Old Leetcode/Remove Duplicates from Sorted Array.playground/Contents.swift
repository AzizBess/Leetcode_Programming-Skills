import UIKit



var nums = [1,1,2]; // Input array
let expectedNums = [1,2]; // The expected answer with correct length

let k = removeDuplicates(&nums); // Calls your implementation
print(k)
assert(k == expectedNums.count)
for i in 0...k-1 {
    print("i:\(i)")
    if i < nums.count, i < expectedNums.count {
        print(nums[i] == expectedNums[k])
    }
}


func removeDuplicates(_ nums: inout [Int]) -> Int {
    var dict: [Int:Int] = [:]
    nums.forEach({
        dict[$0] = dict[$0] ?? 0 + 1
    })

    return dict.keys.count
}
