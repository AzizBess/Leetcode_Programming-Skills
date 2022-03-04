/*
 You are given an array of unique integers salary where salary[i] is the salary of the ith employee.

 Return the average salary of employees excluding the minimum and maximum salary. Answers within 10-5 of the actual answer will be accepted.



 Example 1:

 Input: salary = [4000,3000,1000,2000]
 Output: 2500.00000
 Explanation: Minimum salary and maximum salary are 1000 and 4000 respectively.
 Average salary excluding minimum and maximum salary is (2000+3000) / 2 = 2500
 Example 2:

 Input: salary = [1000,2000,3000]
 Output: 2000.00000
 Explanation: Minimum salary and maximum salary are 1000 and 3000 respectively.
 Average salary excluding minimum and maximum salary is (2000) / 1 = 2000


 Constraints:

 3 <= salary.length <= 100
 1000 <= salary[i] <= 10^6
 All the integers of salary are unique.

 WAY OF THINKING :
1 - find min + max
2 - count total array
3 - remove min and max values from count total
4 - if finding new min or new max, refund old vale to count total

 NEW WAY OF THINKING

 1 - reorder array
 2 - drop first and last
 3 - total count / array count - 2
 */


func average(_ salary: [Int]) -> Double {
    guard salary.count >= 3 && salary.count <= 100 else { return 0.0 }
    guard salary.first(where: { $0 < 1000 || $0 > 1000000 }) == nil else { return 0.0 }
    let sortedSalary = salary.sorted()
    let totalCount = sortedSalary.compactMap({ $0 }).reduce(0, +)
    let totalCountExcludingMinMax = totalCount - ((sortedSalary.first ?? 0) + (sortedSalary.last ?? 0))
    return Double(totalCountExcludingMinMax) / Double(salary.count - 2)
}


func firstTryAverage(_ salary: [Int]) -> Double {
    var totalCount = 0.0
    var average = 0.0
    guard salary.count >= 3 && salary.count <= 100 else { return average }
    var min = 0.0
    var max = 0.0

    for salaryElement in salary {
        let doubleSalary = Double(salaryElement)
        if doubleSalary < 1000 || doubleSalary > 1000000 {
            totalCount = 0.0
            min = 0.0
            max = 0.0
            break
        }
        totalCount += doubleSalary
        if min == 0 || doubleSalary < min {
            min = doubleSalary
        }
        if max == 0 || doubleSalary > max {
            max = doubleSalary
        }
    }
    totalCount -= (min + max)
    average = totalCount / Double(salary.count - 2)
    return average
}


// TESTING
let salary1 = [4000,3000,1000,2000]
let salary2 = [1000,2000,3000]
let salary3 = [48000,59000,99000,13000,78000,45000,31000,17000,39000,37000,93000,77000,33000,28000,4000,54000,67000,6000,1000,11000]

print("secondSolutionAverage = \(average(salary3))")
