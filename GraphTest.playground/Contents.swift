//: Playground - noun: a place where people can play
import UIKit

let dateString = "2017-08-25"
let df = DateFormatter()
df.dateFormat = "yyyy-MM-dd"

func getDayOfWeek(today:String) -> Int? {
    let formatter  = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let todayDate = formatter.date(from: today) else { return nil }
    let myCalendar = Calendar(identifier: .gregorian)
    let weekDay = myCalendar.component(.weekday, from: todayDate)
    return weekDay
}


let dateFromString = df.date(from: dateString)

let calendar = Calendar.current

let day:Int = calendar.component(.day, from: dateFromString!)
let year:Int = calendar.component(.year, from: dateFromString!)
let month:Int = calendar.component(.month, from: dateFromString!)

let intForDayOfWeek = getDayOfWeek(today: dateString)

var nums:[Int] = [day]

for i in stride(from: 1, to: 8, by: 1) { //executed 7 times i will never be 8
    var otherDay = 0
    if (i > intForDayOfWeek!) {
        otherDay = day + i
    } else if (i < intForDayOfWeek!) {
        otherDay = day - i
    }
      else if (i == intForDayOfWeek) {
        continue //make sure this stops the execution
    }
    
    nums.append(otherDay)
}

print("\(nums)")

//now do a for in loop, make a date out of all of these and then compare with the data given

var dates:[Date] = []

for dayInMonth in nums {
    print("\(dayInMonth)")
//    let newDate = df.date(from: "\(year)-\(month)-\(dayInMonth)")
//    dates.append(newDate!)
}


