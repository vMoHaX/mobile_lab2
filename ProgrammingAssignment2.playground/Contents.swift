
import Foundation

// Part 1

// Given string with format "Student1 - Group1; Student2 - Group2; ..."

// TOGGLE THIS TO SWITCH TASKS
let isFirstTask = true

if isFirstTask {
    let studentsStr = "Бортнік Василь - ІВ-72; Чередніченко Владислав - ІВ-73; Гуменюк Олександр - ІВ-71; Корнійчук Ольга - ІВ-71; Киба Олег - ІВ-72; Капінус Артем - ІВ-73; Овчарова Юстіна - ІВ-72; Науменко Павло - ІВ-73; Трудов Антон - ІВ-71; Музика Олександр - ІВ-71; Давиденко Костянтин - ІВ-73; Андрющенко Данило - ІВ-71; Тимко Андрій - ІВ-72; Феофанов Іван - ІВ-71; Гончар Юрій - ІВ-73"
    
    // Task 1
    // Create dictionary:
    // - key is a group name
    // - value is sorted array with students
    
    var studentsGroups: [String: [String]] = [:]
    
    // Your code begins
    
    if true {
        // using if true blocks in order not to create global variables
        
        let studentAndGroupStrs = studentsStr.components(separatedBy: "; ")
        let pairs = studentAndGroupStrs.map{ $0.components(separatedBy: " - ") }
        
        
        for pair in pairs {
            if studentsGroups[pair[1]] == nil {
                studentsGroups[pair[1]] = [pair[0]]
            } else {
                studentsGroups[pair[1]]!.append(pair[0])
            }
            
        }
        
        let keys = studentsGroups.keys
        
        for key in keys {
            studentsGroups[key]!.sort()
        }
    }
    
    // Your code ends
    
    print(studentsGroups)
    print()
    
    // Given array with expected max points
    
    let points: [Int] = [5, 8, 12, 12, 12, 12, 12, 12, 15]
    
    // Task 2
    // Create dictionary:
    // - key is a group name
    // - value is dictionary:
    //   - key is student
    //   - value is array with points (fill it with random values, use function `randomValue(maxValue: Int) -> Int` )
    
    func randomValue(maxValue: Int) -> Int {
        switch(arc4random_uniform(6)) {
        case 1:
            return Int(ceil(Float(maxValue) * 0.7))
        case 2:
            return Int(ceil(Float(maxValue) * 0.9))
        case 3, 4, 5:
            return maxValue
        default:
            return 0
        }
    }
    
    var studentPoints: [String: [String: [Int]]] = [:]
    
    // Your code begins
    if true {
        
        for groupId in studentsGroups.keys {
            
            studentPoints[groupId] = [:]
            
            for student in studentsGroups[groupId]! {
                
                studentPoints[groupId]![student] = []
                
                for maxPoints in points {
                    
                    studentPoints[groupId]![student]!.append(randomValue(maxValue: maxPoints))
                    
                }
                
            }
        }
    }
    // Your code ends
    
    print(studentPoints)
    print()
    
    // Task 3
    // Create dictionary:
    // - key is a group name
    // - value is dictionary:
    //   - key is student
    //   - value is sum of student's points
    
    var sumPoints: [String: [String: Int]] = [:]
    
    // Your code begins
    if true {
        
        for groupId in studentsGroups.keys {
            
            sumPoints[groupId] = [:]
            
            for (student, marks) in studentPoints[groupId]! {
                
                sumPoints[groupId]![student] = marks.reduce(0, +)
                
            }
        }
    }
    
    
    // Your code ends
    
    print(sumPoints)
    print()
    
    // Task 4
    // Create dictionary:
    // - key is group name
    // - value is average of all students points
    
    var groupAvg: [String: Float] = [:]
    
    // Your code begins
    if true {
        
        for groupId in studentsGroups.keys {
            
            let studentsInGroup = sumPoints[groupId]!.values.count
            
            groupAvg[groupId] = Float(sumPoints[groupId]!.values.reduce(0, +)) / Float(studentsInGroup)
            
        }
        
    }
    
    
    // Your code ends
    
    print(groupAvg)
    print()
    
    // Task 5
    // Create dictionary:
    // - key is group name
    // - value is array of students that have >= 60 points
    
    var passedPerGroup: [String: [String]] = [:]
    
    // Your code begins
    
    if true {
        for groupId in studentsGroups.keys {
            
            passedPerGroup[groupId] = []
            
            for (student, mark) in sumPoints[groupId]! {
                if mark > 60 {
                    passedPerGroup[groupId]?.append(student)
                }
            }
        }
    }
    
    // Your code ends
    
    print(passedPerGroup)
    
    // Example of output. Your results will differ because random is used to fill points.
    //
    //["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
    //
    //["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
    //
    //["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
    //
    //["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
    //
    //["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]
}

// Part 2

class TimeOT {
    
    var hours: UInt
    var minutes: UInt
    var seconds: UInt
    
    init() {
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    convenience init(hours: UInt, minutes: UInt, seconds: UInt) {
        if (0...23).contains(hours) && (0...59).contains(minutes) && (0...59).contains(seconds) {
            self.init(hours, minutes, seconds)
        } else {
            self.init()
        }
    }
    
    convenience init(from date: Date) {
        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        self.init(dateComponents.hour, dateComponents.minute, dateComponents.second)
    }
    
    private init(_ hours: UInt, _ minutes: UInt, _ seconds: UInt) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    private convenience init(_ hours: Int?, _ minutes: Int?, _ seconds: Int?) {
        if let hour = hours, let minute = minutes, let second = seconds {
            self.init(UInt(hour), UInt(minute), UInt(second))
        } else {
            self.init()
        }
    }
    
    
    
    
}
extension TimeOT {
    
    func timeInString() -> String {
        return "\(self.hours % 12):\(self.minutes):\(self.seconds) \(self.hours > 12 ? "PM" : "AM")"
    }
    
}

extension TimeOT {
    
    static func +(lhs: TimeOT, rhs: TimeOT) -> TimeOT {
        var hour: UInt = 0
        var minute: UInt = 0
        var second: UInt = 0
        
        second = (lhs.seconds + rhs.seconds)
        if second >= 60 {
            second %= 60
            minute += 1
        }
        
        minute = (minute + lhs.minutes + rhs.minutes)
        if minute >= 60 {
            minute %= 60
            hour += 1
        }
        
        hour = (hour + lhs.hours + rhs.hours) % 24
        
        return TimeOT(hour, minute, second)
    }
    
    static func -(lhs: TimeOT, rhs: TimeOT) -> TimeOT {
        var hour: Int = 0
        var minute: Int = 0
        var second: Int = 0
        
        second = Int(lhs.seconds) - Int(rhs.seconds)
        if second < 0 {
            second = (60 + second) % 60
            minute -= 1
        }
        
        minute = (minute + Int(lhs.minutes) - Int(rhs.minutes))
        if minute < 0 {
            minute = (60 + minute) % 60
            hour -= 1
        }
        
        hour = (hour + Int(lhs.hours) - Int(rhs.hours))
        if hour < 0 {
            hour = (hour + 24) % 24
        }
        
        return TimeOT(UInt(hour), UInt(minute), UInt(second))
    }
    
    func plus(_ time: TimeOT) -> TimeOT {
        return self + time
    }
    
    func minus(_ time: TimeOT) -> TimeOT {
        return self - time
    }
    
    class func summing(_ time: TimeOT, wtih anotherTime: TimeOT) -> TimeOT {
        return time + anotherTime
    }
    
    class func substructing(_ time: TimeOT, wtih anotherTime: TimeOT) -> TimeOT {
        return time - anotherTime
    }
}

extension TimeOT: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return "\(self.hours):\(self.minutes):\(self.seconds)"
    }
    
}

if !isFirstTask {
    
    let firstTime = TimeOT()
    print("Initing with default(designated):")
    print(firstTime, firstTime.timeInString())
    print()
    
    let secondTime = TimeOT(hours: 13, minutes: 45, seconds: 56)
    print("Initing with correct (h:m:s:):")
    print(secondTime, secondTime.timeInString())
    print()
    
    let thirdTime = TimeOT(hours: 25, minutes: 45, seconds: 56)
    print("Initing with fail (h:m:s:):")
    print(thirdTime, thirdTime.timeInString())
    print()
    
    let fourthTime = TimeOT(from: Date())
    print("Initing with current date:")
    print(fourthTime, fourthTime.timeInString())
    print()
    
    let sumTime1 = fourthTime + secondTime
    print("Sum of two instances:")
    print("\(fourthTime) + \(secondTime)")
    print(sumTime1, sumTime1.timeInString())
    print()
    
    let sumTime2 = TimeOT.summing(TimeOT(hours: 23, minutes: 59, seconds: 59), wtih: TimeOT(hours: 12, minutes: 0, seconds: 1))
    print("Sum of two instances:")
    print("\(TimeOT(hours: 23, minutes: 59, seconds: 59)) + \(TimeOT(hours: 12, minutes: 0, seconds: 1))")
    print(sumTime2, sumTime2.timeInString())
    print()
    
    let subTime1 = fourthTime - secondTime
    print("Sub of two instances:")
    print("\(fourthTime) - \(secondTime)")
    print(subTime1, subTime1.timeInString())
    print()
    
    let subTime2 = TimeOT.substructing(TimeOT(hours: 0, minutes: 0, seconds: 0), wtih: TimeOT(hours: 0, minutes: 0, seconds: 1))
    print("Sub of two instances:")
    print("\(TimeOT(hours: 0, minutes: 0, seconds: 0)) - \(TimeOT(hours: 0, minutes: 0, seconds: 1))")
    print(subTime2, subTime2.timeInString())
    print()
}

