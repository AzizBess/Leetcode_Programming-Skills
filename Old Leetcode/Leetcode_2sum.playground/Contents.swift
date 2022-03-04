import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    for i in 0...nums.count - 1 {
        for j in 0...nums.count - 1 {
            if j != i {
                let tmpSum = nums[i] + nums[j]
                if tmpSum == target {
                    return [i, j]
                }
            }
        }

    }
    return []
}



let result = twoSum([6,9], 9)

print(result)
