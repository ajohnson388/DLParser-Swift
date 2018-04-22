import Foundation

extension NSRegularExpression {
    
    static func firstMatch(pattern: String, data: String) -> String? {
        // Create the regex
        guard let regex = try? NSRegularExpression(pattern: pattern,
                                                   options: .caseInsensitive) else {
            return nil
        }
        
        // Look for a match
        let matchRange = NSMakeRange(0, data.utf16.count)
        let matches = regex.matches(in: data, options: [], range: matchRange)
        guard let match = matches.first, match.numberOfRanges > 1 else {
            return nil
        }
        
        // Return the matched string or nil
        let matchedGroupRange = match.range(at: 1)
        let matchedGroup = (data as NSString).substring(with: matchedGroupRange)  // TODO: Use Swift string
        let matchedString = matchedGroup.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return matchedGroup.isEmpty ? nil : matchedString
    }
}
