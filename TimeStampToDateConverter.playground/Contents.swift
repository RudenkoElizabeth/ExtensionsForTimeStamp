import UIKit

extension Double {
    func getFormattedStringFromTimeStamp(dateStyle: DateFormatter.Style,
                                         timeStyle: DateFormatter.Style) -> String {
        let date = Date(timeIntervalSince1970: self/1000)
        let dateFormatter = DateFormatter().setupFormatter(dateStyle: dateStyle, timeStyle: timeStyle)
        return dateFormatter.string(from: date)
    }
    
    func getFormattedStringFromTimeStamp(dateFormat: String = "dd MMM YYYY") -> String {
        let date = Date(timeIntervalSince1970: self/1000)
        let dateFormatter = DateFormatter().setupFormatter(dateFormat: dateFormat)
        return dateFormatter.string(from: date)
    }
}

extension String {
    func convertFromTimeStampToDate() -> Date {
        let time = (self as NSString).doubleValue/1000
        return Date(timeIntervalSince1970: TimeInterval(time))
    }
    
    func getFormattedStringFromTimeStamp(dateStyle: DateFormatter.Style,
                                         timeStyle: DateFormatter.Style) -> String {
        let date = self.convertFromTimeStampToDate()
        let dateFormatter = DateFormatter().setupFormatter(dateStyle: dateStyle, timeStyle: timeStyle)
        return dateFormatter.string(from: date)
    }
    
    func getFormattedStringFromTimeStamp(dateFormat: String = "dd MMM YYYY") -> String {
        let date = self.convertFromTimeStampToDate()
        let dateFormatter = DateFormatter().setupFormatter(dateFormat: dateFormat)
        return dateFormatter.string(from: date)
    }
}

extension DateFormatter {
    func setupFormatter(dateStyle: DateFormatter.Style? = nil,
                        timeStyle: DateFormatter.Style? = nil,
                        dateFormat: String? = nil) -> DateFormatter {
        let dateFormatter = DateFormatter()
        if let dateStyle = dateStyle {
            dateFormatter.dateStyle = dateStyle
        }
        if let timeStyle = timeStyle {
            dateFormatter.timeStyle = timeStyle
        }
        if let dateFormat = dateFormat {
            dateFormatter.dateFormat = dateFormat
        }
        return dateFormatter
    }
}

let timestamp: Double = 1539670864117
timestamp.getFormattedStringFromTimeStamp()
timestamp.getFormattedStringFromTimeStamp(dateFormat: "dd/MM/YYYY")
timestamp.getFormattedStringFromTimeStamp(dateStyle: .medium, timeStyle: .short)

let stringTimestamp = "1539670864117"
stringTimestamp.getFormattedStringFromTimeStamp()
stringTimestamp.getFormattedStringFromTimeStamp(dateFormat: "dd MMMM")
stringTimestamp.getFormattedStringFromTimeStamp(dateStyle: .long, timeStyle: .none)
