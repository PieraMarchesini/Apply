//
//  Util.swift
//  API
//
//  Created by Giovanni Bruno on 17/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class Util {
    
    static func addShadow (to: UIView) {
        to.clipsToBounds = false
        to.layer.shadowColor = C.shadowColor
        to.layer.shadowOffset = C.shadowOffset
        to.layer.shadowOpacity = C.shadowOpacity
    }
    
    static func image(base64: String) -> UIImage {
        guard let data = Data(base64Encoded: base64) else { return UIImage() }
        guard let img = UIImage(data: data) else { return UIImage() }
        return img
    }
    
    static func totalMonths(from: Date, to: Date) -> Int{
        
        let gregorian = Calendar.init(identifier: .gregorian)
        
        let components = gregorian.dateComponents([.month,.year], from: from, to: to)
        
        let year = components.year ?? 0
        let month = components.month ?? 0
        
        return year*12 + month
        
    }
    
    
    static func date(day: Int, month: Int, year: Int) -> Date {
        var dateComponents = DateComponents.init()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        dateComponents.timeZone = TimeZone.init(abbreviation: "UTC-3")
        
        let userCalendar = Calendar.current
        
        return userCalendar.date(from: dateComponents) ?? Date()
    }
    
    static func calculateTotalInvestido(obj: Objetivo) -> Double {
        let totalMonths = Util.totalMonths(from: obj.dataInicial, to: obj.metaData)
        
        return Double(totalMonths)*obj.investimentoMensal + obj.investimentoInicial
    }

    static func calculatePorcentagemMeta (obj: Objetivo) -> Double {
        let totalInvestido = Util.calculateTotalInvestido(obj: obj)
        return (totalInvestido*100)/obj.metaDinheiro
    }
    
    static func ordenaLicao(arr: [Licao]) {
        for (i,l) in arr.enumerated() {
            
        }
    }
    
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "R$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
}


