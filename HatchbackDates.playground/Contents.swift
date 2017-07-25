//: Playground - noun: a place where people can play

import UIKit

let df = DateFormatter()
df.dateFormat = "yyyy/MM/dd HH:mm"
let startingDate = df.date(from: "2017/07/25 09:12")
let endingDate = df.date(from: "2017/07/25 09:25")

let elapsedTime = endingDate?.timeIntervalSince(startingDate!)

UserDefaults.standard.set(endingDate!, forKey: "ENDDATE")
