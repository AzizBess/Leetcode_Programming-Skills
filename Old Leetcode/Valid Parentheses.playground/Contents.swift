import UIKit


func isValid(_ s: String) -> Bool {
    var validationArray: [Bool] = []
    guard s.count % 2 == 0 else { return false }
    guard s.range(of: "^[{,},\\[,\\],(,)]*$", options: .regularExpression) != nil else { return false }
    var prev:[String] = []
    let dict = ["{":"}", "(":")", "[":"]"]
    s.forEach {

        if !prev.isEmpty, let previous = prev.last {
            let current = String($0)
            let closingBracket = dict[previous] ?? ""
            if current == closingBracket {
                validationArray.append(true)
                prev.removeLast()
            } else if dict.keys.contains(current) {
                prev.append(current)
            } else {
                validationArray.append(false)
            }


        } else {
            prev.append(String($0))
        }
    }
    return validationArray.count == s.count / 2 && validationArray.first(where: { $0 == false }) == nil
}



print("isValid() : \(isValid("(){}}{"))")
