/*
 Every valid email consists of a local name and a domain name, separated by the '@' sign. Besides lowercase letters, the email may contain one or more '.' or '+'.

 For example, in "alice@leetcode.com", "alice" is the local name, and "leetcode.com" is the domain name.
 If you add periods '.' between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name. Note that this rule does not apply to domain names.

 For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.
 If you add a plus '+' in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered. Note that this rule does not apply to domain names.

 For example, "m.y+name@email.com" will be forwarded to "my@email.com".
 It is possible to use both of these rules at the same time.

 Given an array of strings emails where we send one email to each emails[i], return the number of different addresses that actually receive mails.



 Example 1:

 Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
 Output: 2
 Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.
 Example 2:

 Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
 Output: 3


 Constraints:

 1 <= emails.length <= 100
 1 <= emails[i].length <= 100
 emails[i] consist of lowercase English letters, '+', '.' and '@'.
 Each emails[i] contains exactly one '@' character.
 All local and domain names are non-empty.
 Local names do not start with a '+' character.
 Domain names end with the ".com" suffix.
 */

import Foundation

let emails = ["ak.n+m@leetcode.com","b@leetcode.com","c@leetcode.com"]
let emails2 = ["testemailalex@@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]

let emails3 = ["teste+e.mailalex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@leetcode.com", "+testdsdwq.e.+ef@gmail.com", "aziz.bes@esprit.tn"]

func numUniqueEmails(_ emails: [String]) -> Int {
    guard 1...100 ~= emails.count else { return 0 }
    var result = Set<String>()
    for email in emails where 1...100 ~= email.count {
        let array = email.split(separator: "@")
        let localPart = array[0].split(separator: "+")[0].filter({ $0 != "." })
        let finalEmail = String(localPart) + "@" + array[1]
        result.insert(finalEmail)
    }
    return result.count
}
/*
func isValidEmail(_ email: String) -> Bool {
    let stringRegex = "^[^+][a-z+.]*(?:(?!@))*@(?!.*@)*com$"
    guard let regex = try? NSRegularExpression(pattern: stringRegex) else { return false }
    let range = NSRange(location: 0, length: email.utf16.count)
    return regex.firstMatch(in: email, options: [], range: range) != nil
}


func formatEmail(_ email: inout String) {
    guard let atIndex = email.firstIndex(of: "@") else { return }
    var localPart = email[..<atIndex]
    if let firstPlusIndex = localPart.firstIndex(of: "+") {
        localPart = email[..<firstPlusIndex]
    }
    localPart.removeAll(where: { $0 == "." })
    email = String(localPart) + email[atIndex...]
}
*/
var emailouwet = emails + emails2 + emails3


  let emails4 = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
//let emails4 = ["testemail@leetcode.com","testemail@leetcode.com","testemail+david@lee.tcode.com"]
print(numUniqueEmails(emails4))
