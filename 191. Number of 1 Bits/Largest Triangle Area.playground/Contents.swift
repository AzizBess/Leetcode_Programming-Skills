/*
 Given an array of points on the X-Y plane points where points[i] = [xi, yi], return the area of the largest triangle that can be formed by any three different points. Answers within 10-5 of the actual answer will be accepted.


 Example 1:


 Input: points = [[0,0],[0,1],[1,0],[0,2],[2,0]]
 Output: 2.00000
 Explanation: The five points are shown in the above figure. The red triangle is the largest.
 Example 2:

 Input: points = [[1,0],[0,0],[0,1]]
 Output: 0.50000


 Constraints:

 3 <= points.length <= 50
 -50 <= xi, yi <= 50
 All the given points are unique.

 Way of Thinkink

 - Area formula:
 Considering 3 points (x1,y1) (x2,y2) (x3,y3)
 Area = 1/2 [x1(y2-y3)+x2(y3-y1)+x3(y1-y2)]


 Note: now that we know how to calculate the area using 3 points, we need to find the 3 points (extrimities) out of an array superior to 3 points.

 now, how do we do that ?

 let's try with this example

 [[0,0],[0,1],[1,0],[0,2],[2,0]]
 [0, 1, 1, 2, 2]

 here's how to find them

 Theory 1 : [xi, yi] is part of the array if they are the maximum and minimum points
 the max points are [0,0], [0,2], [2,0]

 lets confirm with another example

 [[0,0],[0,1],[1,0],[0,2],[2,0], [0,3]]
 [0, 1, 1, 2, 2, 3]

 Theroy correction

 1 min, 2 max

 So we're going to sort the array

 Then we're gonna take first point and last 2 points



 Comments
 //Area = 1/2 [x0(y1-y2)+x1(y2-y0)+x2(y0-y1)]

 /*
  x0 = points[0][0]
  x1 = points[1][0]
  x2 = points[2][0]
  y0 = points[0][1]
  y1 = points[1][1]
  y2 = points[2][1]
  */




 Wrong Answer : because the 3 points are not chose wisely
 [[8,10],[2,7],[9,2],[4,10]]
 [2, 5, 7, 6]
 [[8,10], [2,7], [4,10], [9,2]]
 wrong : [[8,10],[4,10],[9,2]]
 wrong : [[2,7],[4,10],[9,2]]
 x0 = 2 / x1 = 4 / x2 = 9
 y0 = 7 / y1 = 10 / y2 = 2
 //Area = 1/2 [x0(y1-y2)+x1(y2-y0)+x2(y0-y1)]
 area = 0.5   abs[2(10-2)+4(2-2)+9(7-10)]
 area = 0.5 abs[16 + 0 + 27]
 area = 0.5 * 33
 area = 16.5
 sorted
 */

//func largestTriangleArea(_ points: [[Int]]) -> Double {
//    var area = 0.0
//    guard (3...50).contains(points.count) else { return area }
//    var maxPoints = points
//    var pointsToRemove: [[Int]] = []
//
//    maxPoints = maxPoints.sorted(by: {
//        if !($0[0] == $0[1] || $1[0] == $1[1]) {
//            if $0[0] == $1[0] && $0[1] != $1[1] {
//                print("[$0[0],$0[1]] = \([$0[0],$0[1]]) | [$1[0],$1[1]] = \([$0[0],$0[1]])")
//
//                let pointToRemove = [$0[0], min($0[1], $1[1])]
//                print("point to remove 1 \(pointToRemove)")
//                pointsToRemove.append(pointToRemove)
//            }
//            if $0[1] == $1[1] && $0[0] != $1[0] {
//                print("[$0[0],$0[1]] = \([$0[0],$0[1]]) | [$1[0],$1[1]] = \([$0[0],$0[1]])")
//                let pointToRemove = [min($0[0], $1[0]), $0[1]]
//                print("point to remove 2 \(pointToRemove)")
//                pointsToRemove.append(pointToRemove)
//            }
//        }
//        return abs($0.reduce(0, -)) < abs($1.reduce(0, -))
//    })
//
//
//    print("points : \(maxPoints)")
//    print("pointsToRemove : \(pointsToRemove)")
//
//    maxPoints = maxPoints.filter({ !pointsToRemove.contains($0) })
//    print("after filter points : \(maxPoints)")
//
//
//
//    if maxPoints.count > 3 {
//        //print("maxPoints.count : \(maxPoints.count)")
//        //print("maxPoints[maxPoints.count - 2] : \(maxPoints[maxPoints.count - 2])")
//        //print("maxPoints.count - 1 : \(maxPoints.count - 1)")
//        //print("maxPoints[maxPoints.count - 1] : \(maxPoints[maxPoints.count - 1])")
//        maxPoints = [maxPoints[0], maxPoints[maxPoints.count - 2], maxPoints[maxPoints.count - 1]]
//    }
//
//    area = abs(0.5 * Double((maxPoints[0][0] * (maxPoints[1][1] - maxPoints[2][1])) + (maxPoints[1][0] * (maxPoints[2][1] - maxPoints[0][1])) + (maxPoints[2][0] * (maxPoints[0][1] - maxPoints[1][1]))))
//    return area
//}


 //clean code
// I fucking failed to think easy
// func largestTriangleArea(_ points: [[Int]]) -> Double {
//     guard (3...50).contains(points.count) else { return 0.0 }
//     var maxPoints = points
//     if maxPoints.count > 3 {
//         var pointsToRemove: [[Int]] = []
//         maxPoints = maxPoints.sorted(by: {
//             if !($0[0] == $0[1] || $1[0] == $1[1]) {
//                 if $0[0] == $1[0] && $0[1] != $1[1] {
//                     let pointToRemove = [$0[0], min($0[1], $1[1])]
//                     pointsToRemove.append(pointToRemove)
//                 }
//                 if $0[1] == $1[1] && $0[0] != $1[0] {
//                     let pointToRemove = [min($0[0], $1[0]), $0[1]]
//                     pointsToRemove.append(pointToRemove)
//                 }
//             }
//             return abs($0.reduce(0, -)) < abs($1.reduce(0, -))
//         })
//         if maxPoints.count - pointsToRemove.count < 3 {
//             pointsToRemove.sorted(by: { abs($0.reduce(0, -)) < abs($1.reduce(0, -)) })
//             let nDrop = pointsToRemove.count - (3 - maxPoints.count) <= 0 ? 0 : pointsToRemove.count - (3 - maxPoints.count)
//             pointsToRemove = pointsToRemove.dropLast(nDrop)
//         }
//         maxPoints = maxPoints.filter({ !pointsToRemove.contains($0) })
//         if maxPoints.count > 3 {
//             maxPoints = [maxPoints[0], maxPoints[maxPoints.count - 2], maxPoints[maxPoints.count - 1]]
//         }
//     }
//     return abs(0.5 * Double((maxPoints[0][0] * (maxPoints[1][1] - maxPoints[2][1])) + (maxPoints[1][0] * (maxPoints[2][1] - maxPoints[0][1])) + (maxPoints[2][0] * (maxPoints[0][1] - maxPoints[1][1]))))
// }


// the right solution

//func largestTriangleArea(_ points: [[Int]]) -> Double {
//    var area = 0.0
//
//    return area
//}
//
//
//func areaOf3Points(_ A: [Int], _ B: [Int], _ C: [Int]) -> Double {
//        guard isTriangle(A, B, C) else { return 0 }
//        return abs(Double(A[0]*(B[1]-C[1]) + B[0]*(C[1]-A[1]) + C[0]*(A[1]-B[1])) / 2)
//    }
//
//    func isTriangle(_ A: [Int], _ B: [Int], _ C: [Int]) -> Bool {
//        return !(A[1] == B[1] && B[1] == C[1])
//    }
//
//
//
//let pts1 = [[0,0],[0,1],[1,0],[0,2],[2,0]]
//let pts2 = [[8,10],[2,7],[9,2],[4,10]]
//let pts3 = [[10,7],[0,4],[5,7]]
//let pts4 = [[9,7],[6,10],[1,10],[2,7]]
//print("largestTriangleArea(pts1) : \(largestTriangleArea(pts1))")
//print("largestTriangleArea(pts2) : \(largestTriangleArea(pts2))")
//print("largestTriangleArea(pts3) : \(largestTriangleArea(pts3))")
//print("largestTriangleArea(pts4) : \(largestTriangleArea(pts4))")



//func everyPossibleCombinationOfThree(_ points: [[Int]]) -> [[[Int]]] {
//    var res: [[[Int]]] = []
//    for i in 0..<points.count - 2 {
//        for j in i+1..<points.count - 1 {
//            for k in j+1..<points.count {
//                let arrayToAdd = [points[i], points[j], points[k]]
//                if !res.contains(arrayToAdd) {
//                    res.append(contentsOf: [arrayToAdd])
//                }
//            }
//        }
//    }
//    return res
//}
import UIKit
func everyPossibleCombinationOfThreeArea(_ points: [[Int]]) -> [Double] {
    var res: [Double] = []
    for i in 0..<points.count - 2 {
        for j in i+1..<points.count - 1 {
            for k in j+1..<points.count {
                if isTriangle(points[i], points[j], points[k]) {

                }

            }
        }
    }
    return res
}

func areaOf3Points(_ A: [Int], _ B: [Int], _ C: [Int]) -> Double {
    guard isTriangle(A, B, C) else { return 0 }
    return abs(Double(A[0]*(B[1]-C[1]) + B[0]*(C[1]-A[1]) + C[0]*(A[1]-B[1])) / 2)
}

func isTriangle(_ A: [Int], _ B: [Int], _ C: [Int]) -> Bool {
    return !(A[1] == B[1] && B[1] == C[1])
}
//print("everyPossibleCombinationOfThree : \(everyPossibleCombinationOfThree(pts4))")


/*
 [
 [[9, 7], [6, 10], [1, 10]],
 [[9, 7], [6, 10], [2, 7]],
 [[9, 7], [1, 10], [2, 7]],
 [[6, 10], [1, 10], [2, 7]]
 ]
 */


// STOP Playing

func largestTriangleArea(_ points: [[Int]]) -> Double {
    var maxArea = 0.0

    for i in 0..<points.count - 2 {
        for j in i+1..<points.count - 1 {
            for k in j+1..<points.count {
                let area = areaOf3Points(points[i], points[j], points[k])
                maxArea = max(area, maxArea)
            }
        }
    }

    return maxArea
}
//    Area = ???[s(s-a)(s-b)(s-c)]
//    Here, "s" is the semi-perimeter of the triangle, i.e., s = (a + b + c)/2.\

func largestPerimeter(_ nums: [Int]) -> Int {
    var maxPerimiter = 0
    for i in 0..<nums.count - 2 {
        for j in i+1..<nums.count - 1 {
            for k in j+1..<nums.count {
                let a = Double(nums[i])
                let b = Double(nums[j])
                let c = Double(nums[k])
                let s = Double((a + b + c) / 2)
                let area = sqrt(Double(s * (s-a) * (s-b) * (s-c)))
                print("a = \(a)")
                print("b = \(b)")
                print("c = \(c)")
                print("s = \(s)")
                print("area = \((area))")
                if area != 0 && !area.isNaN {
                    let perimiter = Int(s * 2)
                    maxPerimiter = max(perimiter, maxPerimiter)
                    print("perimiter = \(perimiter)")
                    print("maxPerimiter = \(maxPerimiter)")
                }

            }
        }
    }
    return maxPerimiter
}

let l = [546467,314276,792582,532257,113844,146938,947899,692404,596184,432308,184230,63076,297634,32230,399261,46783,753298,500072,197600,338013,654514,845124,543893,410575,382182,828020,900989,314093,570519,231784,258920,159851,65493,121690,326789,429443,693168,802111,927344,107871,63357,618110,458715,750097,766716,327528,526989,946526,264259,622961,725514,100382,508477,647553,829490,108017,633989,177861,922995,729534,639489,726473,207921,202929,938479,332546,768187,252920,118770,313128,164355,801072,166249,492909,417524,816524,153594,752663,275220,96453,57636,839010,334869,219352,177649,88922,415512,777982,61872,300731,582772,764278,45421,683980,144333,898247,28496,636724,720818,865257,609412,936599,443030,958998,898320,48381,649813,749876,704602,659439,660562,920720,730506,744228,586683,415206,632588,900945,343280,74492,788005,703288,369439,329513,482162,401818,163846,695507,924394,7585,815684,104331,423236,846755,887625,236689,857437,166131,966451,345633,981029,819692,994383,638528,641097,341073,999353,819980,357140,656841,356528,225983,906403,366954,154421,119843,144770,434640,298757,457005,374186,927726,982194,70106,934615,732183,609159,510453,972962,970728,649446,212011,147301,559485,217296,392568,296544,482325,777086,203284,857924,301005,277076,669693,653650,799657,274023,483789,334613,710293,513069,104974,888873,707272,835935,930950,213724,954927,649028,996199,550121,507243,721030,276830,892990,403919,771376,445521,548260,806297,562105,267787,157607,924021,536650,2054,470780,933266,430619,851814,32023,728866,767913,363371,148302,626822,774907,674796,880383,829588,662995,823247,484399,602025,524381,938187,212827,809521,858986,35777,133503,262485,635658,237177,273787,835227,719847,499099,95634,142054,51197,147251,913461,514253,632008,616206,32844,566366,177377,121877,878579,529653,361388,548282,881976,18093,795200,288449,985959,357438,813134,205465,665170,688484,555414,133484,258186,61927,625970,337278,295233,176119,966109,938497,932151,553066,778281,738365,494396,916409,329164,352623,842608,937258,182622,106602,406333,942901,780315,618000,614773,265460,53412,185136,503804,837760,970570,686843,218440,804258,111354,948098,516787,668049,472097,809938,959211,703347,445375,712741,633310,615946,794404,136827,120915,44552,549080,859615,12282,20515,885709,500622,197442,433177,333156,60990,285866,236108,748054,875250,410037,943236,4514,469375,937689,850253,302442,188853,352069,822974,969307,2387,856371,858095,435494,704792,229318,969307,224184,519488,851680,139533,369879,407430,983134,592426,257411,414341,785814,978948,506171,274954,245323,364380,627060,193382,89693,758415,135007,49133,526555,467605,227061,660918,38977,698367,6580,216288,130686,887560,716601,179434,453096,402838,306956,208603,713407,439306,431331,437207,246247,688694,953666,94362,538355,73000,165874,874591,92483,226485,684782,914956,493898,721995,321983,505658,890652,114821,34820,122492,650779,278071,452549,550199,529517,713125,978793,852095,855723,924030,637292,684063,454692,131228,616182,912130,418123,127861,279211,499781,931003,390963,218255,230889,581423,981381,455983,401190,149155,758205,224554,999541,255243,342595,351470,939685,267234,753381,352863,315260,541066,484232,588286,124774,199318,342434,48740,111658,303739,67805,860590,513258,643861,991780,879244,91913,831394,225547,917578,183278,44027,232705,58090,556255,572145,853889,308353,543004,225820,787544,116982,852309,614900,65182,463280,226087,167104,830650,695847,840819,874931,919176,694434,7559,419676,773265,613981,627283,290002,98583,864376,47075,119183,797745,728532,319273,164500,601084,975947,186657,372245,980945,120082,971435,2105,77813,789559,94122,160843,328113,459799,520964,842376,889270,284848,494854,167965,514585,274666,964527,798588,628821,37723,496902,678461,858873,333080,179867,663275,530326,479387,558262,63561,883319,55338,435128,354499,645297,303434,287204,96972,354658,696283,32459,739378,324582,848215,584478,705441,562081,95234,219306,832736,59550,949671,584135,394259,98069,547940,435447,431783,207729,939087,718467,939858,889078,42351,935987,522198,502316,676500,525257,538161,641675,193186,278089,701431,395568,234662,433430,861748,461475,546804,506621,655512,522885,765104,881531,702516,321357,83160,813609,184188,411307,503877,784959,75196,921281,262943,695548,833444,964230,414679,493833,930937,34922,72475,919628,320104,144172,901967,222046,686042,731957,260333,589362,984474,552682,928181,729732,460652,265174,519803,767678,876626,936751,415263,795030,824843,701579,360389,542809,652865,359319,847450,93491,702556,3399,455260,264114,654895,13828,359946,866908,473424,303407,810261,77187,847451,922012,601625,725494,61042,231741,385598,609349,340366,239499,405769,57212,828467,838845,599422,698536,163917,687751,656427,334533,777526,143622,764342,878497,774609,72049,941541,111867,610180,972154,599603,537749,243157,210332,391910,680919,15386,593251,640044,286216,155334,722970,702608,34377,160006,626047,811938,993764,542517,570602,62273,865816,46124,688633,547036,825809,746113,895038,881802,868388,864508,128393,471544,593022,334443,173429,724991,596270,949692,592704,924054,542683,522966,231859,29784,601920,508127,313915,199854,624779,707109,503452,610014,680736,44736,514049,239110,296488,267020,483078,341355,699750,678056,618523,229441,373383,292122,571807,693954,859144,695788,210571,545074,698383,263807,493385,880992,316632,488182,758129,195744,194111,517311,317489,440617,572763,36309,746549,663137,203881,410599,683157,969166,611408,949598,46992,303426,166907,356110,551576,827394,185763,694525,438634,904461,883134,848083,972293,160747,607302,965844,701984,535544,922226,766671,263148,935430,584822,191109,250388,599426,613976,758491,993249,549765,231351,117439,367339,420840,875960,602737,187639,98943,622256,513753,719104,704032,992932,742840,936900,296935,868519,33339,733271,549625,232622,527060,540126,993742,689483,835915,870475,543461,912848,217822,845193,958518,851409,672021,525135,916917,396539,527440,55921,260779,575903,566420,996414,531437,289643,562838,988579,158022,548921,351474,883534,737744,164076,378568,299755,723827,180824,564795,449625,6414,474432,614010,868695,645822,107249,158869,744146,291724,763638,128575,731569,658070,845229,865735,203647,741758,755759,885047,386265,541203,154450,601657,643984,266562,320557,405657,885620,512236,557742,798556,122572,861141,244659,98531,477792,717898,724386,533386,415970,460064,115318,603629,492733,570511,935939,223334,679793,896917,668457,173999,176704,782227,276320,524142,793634,690816,942879,580972,829660,944262,112468,33245,36528,471283,874451,13110,9757,151165,263073,947799,719880,642109,794062,703590,415432,913125,683420,488592,81212,596017,114280,298473,276526,496093,462231,91895,147426,408530,886260,955112,928886,708607,390666,143450,733770,216540,49266,389236,462746,285128,101410,795297,84769,173051,696432,81862,778889,384772,294075,821442,853505,623196,983670,595143,789861,694984,414186]

print(l.count)
//print(largestPerimeter([3,6,2,3]))

//let pts1 = [[0,0],[0,1],[1,0],[0,2],[2,0]]
//let pts2 = [[8,10],[2,7],[9,2],[4,10]]
//let pts3 = [[10,7],[0,4],[5,7]]
//let pts4 = [[9,7],[6,10],[1,10],[2,7]]
//print("largestTriangleArea(pts1) : \(largestTriangleArea(pts1))")
//print("largestTriangleArea(pts2) : \(largestTriangleArea(pts2))")
//print("largestTriangleArea(pts3) : \(largestTriangleArea(pts3))")
//print("largestTriangleArea(pts4) : \(largestTriangleArea(pts4))")
