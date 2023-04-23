//
//  HomWork3.swift
//  HomeWork3
//
//  Created by TrungNV (Macbook) on 23/04/2023.
//

import Foundation

class HomeWork3 {
    /**
     Đếm số nguyên tố trong đoạn [a, b].
     */
    func exercise1() {
        let numbers = [Int](0 ... 100)
        let primeCount = numbers.filter { number in
            isPrime(number)
        }.count
        print("Prime in [\(numbers[0]), \(numbers[numbers.count - 1])] is \(primeCount)")
    }
    
    private func isPrime(_ number: Int) -> Bool {
        if number < 2 {
            return false
        } else {
            if number == 2 {
                return true
            }
            
            for i in 2 ... number - 1 {
                if number % i == 0 {
                    return false
                }
            }
            return true
        }
    }
    
    /**
     Cho năm bất kỳ, in ra số ngày của 12 tháng trong năm đó.
     */
    func exercise2() {
        print("Nhập số năm:")
        let year = Int(readLine() ?? "0") ?? 0
        var message = ""
        
        if year == 0 {
            message = " năm công nguyên"
        } else if (year < 0) {
            message = ", \(abs(year)) năm trước công nguyên"
        } else {
            message = ", \(year) năm sau công nguyên"
        }
        
        for i in 1 ... 12 {
            printTotalDays(message, i, getDaysOfMonthInYear(i, year))
        }
    }
    
    private func printTotalDays(_ message: String, _ month: Int, _ day: Int) {
        print("Tháng \(month)\(message) có \(day) ngày")
    }
    
    private func getDaysOfMonthInYear(_ month: Int, _ year: Int) -> Int {
        let components = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        if let date = calendar.date(from: components) {
            guard let range = calendar.range(of: .day, in: .month, for: date) else {
                return 0
            }
            return range.count
        } else {
            return 0
        }
    }
    
    /**
     Cho ngày tháng năm bất kỳ, in ra ngày tháng năm liền trước và liền sau ngày đó.
     */
    func exercise3() {
        print("Nhập ngày tháng năm theo định dạng dd/MM/yyyy")
        let strDate = readLine() ?? ""
        
        if strDate.isEmpty {
            print("Định dạng ngày tháng năm không đúng")
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            guard let date = dateFormatter.date(from: strDate) else {
                print("Định dạng ngày tháng năm không đúng")
                return
            }
            
            print("Ngày tháng năm liền trước của ngày \(strDate) là: \(dateFormatter.string(from: dateInterval(date, 86400)))")
            print("Ngày tháng năm liền sau của ngày \(strDate) là: \(dateFormatter.string(from: dateInterval(date, -86400)))")
        }
    }
    
    private func dateInterval(_ date: Date, _ secondes: Int) -> Date {
        date.addingTimeInterval(TimeInterval(secondes))
    }
    
    /**
     Sắp xếp mảng theo thứ tự tăng dần, không dùng hàm sort.
     */
    func exercise4() {
        var numbers = [-2, 5, -7, 9, 3, 2, 1, 0, 8, 10, 9]
        
        for i in stride(from: numbers.count - 1, to: 0, by: -1) {
            for j in 0 ... i {
                if numbers[i] < numbers[j] {
                    numbers.swapAt(i, j)
                }
            }
        }
        
        print("Sorted numbers: \(numbers)")
    }
    
    /**
     Chèn phần tử có giá trị X vào phía sau phần tử có giá trị lớn nhất trong mảng.
     */
    func exercise5() {
        print("Enter X number: ", terminator: "")
        let x = Int(readLine() ?? "") ?? 0
        var numbers = [-2, 5, -7, 9, 3, 2, 1, 0, 8, 10, 9]
        if let maxIndex = numbers.max() {
            numbers.insert(x, at: maxIndex)
        } else {
            print("Array number is empty")
        }
        print("Array number: \(numbers)")
    }
    
    /**
     Chèn phần tử có giá trị X vào mảng sao cho mảng vẫn có thứ tự tăng dần.
     */
    func exercise6() {
        print("Enter X number: ", terminator: "")
        let x = Int(readLine() ?? "") ?? 0
        var numbers = [-3, -2, 0, 1, 2]
        var xIndex = -1
        for (index, number) in numbers.enumerated() {
            if x <= number {
                xIndex = index
                break
            }
        }
        
        if xIndex > -1 {
            numbers.insert(x, at: xIndex)
            print("Array number: \(numbers)")
        } else if !numbers.isEmpty {
            numbers.insert(x, at: numbers.count)
            print("Array number: \(numbers)")
        } else {
            print("Array number is empty")
        }
    }
    
    /**
     Tính tổng các chữ số trong 1 số
     */
    func exercise7() {
        print("Nhập một số: ", terminator: "")
        if let number = Int(readLine() ?? "0") {
            let strNumber = String(abs(number))
            if strNumber.count == 1 {
                print("Tổng các chữ số của số \(number) là: \(strNumber)")
            } else {
                var total = 0
                strNumber.forEach { char in
                    let number = Int(String(char)) ?? 0
                    total += number
                }
                print("Tổng các chữ số của số \(number) là: \(total)")
            }
        } else {
            print("Chỉ cho phép nhập vào các số")
        }
    }
    
    /**
     Kiểm tra tính đối xứng của một số
     */
    func exercise8() {
        print("Nhập một số: ", terminator: "")
        if let number = Int(readLine() ?? "0") {
            let isNegative = number < 0
            let strNumber = String(abs(number))
            if strNumber.count == 1 {
                print("Số \(number) là số đối xứng")
                return
            }
            
            var reverseNumber = Int(String(strNumber.reversed())) ?? 0
            if isNegative {
                reverseNumber *= -1
            }
            if number == reverseNumber {
                print("Số \(number) là số đối xứng")
            } else {
                print("Số \(number) không phải là số đối xứng")
            }
        } else {
            print("Chỉ cho phép nhập vào các số")
        }
    }
    
    /**
     Giải phương trình bậc 2: ax2 + bx + c = 0
     */
    func exercise9() {
        print("Nhập số a: ")
        let a = Float(readLine() ?? "0") ?? 0
        print("Nhập số b: ")
        let b = Float(readLine() ?? "0") ?? 0
        print("Nhập số c: ")
        let c = Float(readLine() ?? "0") ?? 0
        
        let delta = powf(b, 2) - 4 * a * c
        if delta < 0 {
            print("Phương trình vô nghiệm")
        } else if delta == 0 {
            let x = -b / (2 * a)
            print("Phương trình có nghiệm kép x1 = x2 = \(x)")
        } else {
            let x1 = (-b + sqrtf(delta)) / (2 * a)
            let x2 = (-b - sqrtf(delta)) / (2 * a)
            print("x1 = \(x1), x2 = \(x2)")
        }
    }
}
