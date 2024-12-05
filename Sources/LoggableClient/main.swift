import Loggable
import OSLog

let a = 17
let b = 25

let logger = OSLog(subsystem: "com.example", category: "☆")
#logDebug("\(public: a) + b = \( a+b )")

class Log {
    func log() {
        #logDebug("a + b = ?")
    }
    let logger = OSLog(subsystem: "com.example", category: "★")
}
Log().log()
