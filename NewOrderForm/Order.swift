//
//  Order.swift
//  NewOrderForm
//
//  Created by Ivo Radoslavov on 12/17/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    //MARK Properties:
    
    var client : String
    var unitPrice : Double
    var priceSold : Double
    var quantity : Double
    
    //extras
    var screenH : Double
    var screenCharged : Double
    var house : Double
    var shipCo : Double
    var shipping : Double
    /*
    var total : Double {
        return unitPrice * quantity
    }
    */
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("orders")
    
    //MARK: Types
    
    struct PropertyKey {
        static let clientKey = "client"
        static let unitPriceKey = "unitPrice"
        static let priceSold = "priceSold"
        static let quantityKey = "quantity"
        
        static let screenHKey = "screenH"
        static let screenChargedKey = "screenCharged"
        static let houseKey = "house"
        static let shipCoKey = "shipCo"
        static let shippingKey = "shipping"
    }
    
    //MARK Initialization:
    
    init(client: String, unitPrice: Double, priceSold: Double, quantity: Double, screenH : Double, screenCharged : Double, house : Double, shipCo : Double, shipping : Double) {
        self.client = client
        self.unitPrice = unitPrice
        self.priceSold = priceSold
        self.quantity = quantity
        self.screenH = screenH
        self.screenCharged = screenCharged
        self.house = house
        self.shipCo = shipCo
        self.shipping = shipping
        
        super.init()
    }
    
    
    //MARK Methods:
    
//    func calculateTotal() -> Double {
//        return unitPrice * quantity
//    }
    
    //calculates the company cost
    func calculateCompanyCost() -> Double {
        
//        let result = unitPrice! * q! + screenH! + shipC!
        return unitPrice * quantity + screenH + shipCo
    }
    
    //calculates the subTotal
    func calculateSubTotal() -> Double {
        return (priceSold * quantity) + screenCharged
    }
    
    //calculates the tax
    func calculateTax()->Double {
        let result = calculateSubTotal() * 0.08875
        return result
    }
    
    //calculates Total Compant Cost
   func calculateTotalCost()->Double {

        return (quantity * unitPrice) + screenH + (house * quantity) + shipCo + shipping + calculateTax()
    }
//
//    
//    func calculateTotalCharged() -> Double {
//        var unitSold = Double(priceSold.text!)
//        if unitSold == nil {unitSold = 0}
//        
//        var q = Double(quantity.text!)
//        if q == nil {q = 0}
//        
//        var scrn = Double(screenCharged.text!)
//        if scrn == nil {scrn = 0}
//        
//        var shipCost = Double(shipping.text!)
//        if shipCost == nil {shipCost = 0}
//        
//        return (unitSold! * q!) + scrn! + shipCost!
//    }
//    
//    func calculateProfit()->Double {
//        var chargedClient = Double(charged.text!)
//        if chargedClient == nil {
//            chargedClient = 0
//        }
//        var totalCost = Double(totalCostLabel.text!)
//        if totalCost == nil {
//            totalCost = 0
//        }
//        let result = chargedClient! - totalCost!
//        return result
//    }
//    
//    func calculateCommission()->Double {
//        var profit = Double(profitLabel.text!)
//        if profit == nil {
//            profit = 0
//        }
//        let result = profit!/2
//        return result
//    }
//    
//    func calculateActualUnit()->Double {
//        var houseCost = Double(housePerUnit.text!)
//        if houseCost == nil {
//            houseCost = 0
//        }
//        var shipC = Double(shipCo.text!)
//        if shipC == nil {
//            shipC = 0
//        }
//        var shipCost = Double(shipping.text!)
//        if shipCost == nil {
//            shipCost = 0
//        }
//        var chargedClient = Double(charged.text!)
//        if chargedClient == nil {
//            chargedClient = 0
//        }
//        let top = (chargedClient! - (scrn! + (scrn! * 0.08875)) - shipC! - shipCost! - (houseCost! * q!))
//        let bottom = q!+(q!*0.08875)
//        let result = top/bottom
//        return result
//    }
//    
//    func calculateActualComiss() -> Double {
//        var actualUnitCharged = Double(actualUnitLabel.text!)
//        if actualUnitCharged == nil {
//            actualUnitCharged = 0
//        }
//        var taxCost = Double(taxLabel.text!)
//        if taxCost == nil {
//            taxCost = 0
//        }
//        var chargedClient = Double(charged.text!)
//        if chargedClient == nil {
//            chargedClient = 0
//        }
//        
//        let subTotal = actualUnitCharged! * q! + scrn!
//        let subTotalTax = subTotal * 0.08875
//        
//        let totalCost = calculateTotalCost() - (taxCost! - subTotalTax)
//        let profit = chargedClient! - totalCost
//        let comission = profit/2
//        
//        return comission
//    }

    
    //MARK NSCoding:
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(client, forKey: PropertyKey.clientKey)
        aCoder.encodeDouble(unitPrice, forKey: PropertyKey.unitPriceKey)
        aCoder.encodeDouble(priceSold, forKey: PropertyKey.priceSold)
        aCoder.encodeDouble(quantity, forKey: PropertyKey.quantityKey)
        aCoder.encodeDouble(screenH, forKey: PropertyKey.screenHKey)
        aCoder.encodeDouble(screenCharged, forKey: PropertyKey.screenChargedKey)
        aCoder.encodeDouble(house, forKey: PropertyKey.houseKey)
        aCoder.encodeDouble(shipCo, forKey: PropertyKey.shipCoKey)
        aCoder.encodeDouble(shipping, forKey: PropertyKey.shippingKey)
    }
    
    required convenience init? (coder aDecoder: NSCoder){
        let client = aDecoder.decodeObjectForKey(PropertyKey.clientKey) as! String
        let unitPrice = aDecoder.decodeDoubleForKey(PropertyKey.unitPriceKey)
        let priceSold = aDecoder.decodeDoubleForKey(PropertyKey.priceSold)
        let quantity = aDecoder.decodeDoubleForKey(PropertyKey.quantityKey)
        let screenH = aDecoder.decodeDoubleForKey(PropertyKey.screenHKey)
        let screenCharged = aDecoder.decodeDoubleForKey(PropertyKey.screenChargedKey)
        let house = aDecoder.decodeDoubleForKey(PropertyKey.houseKey)
        let shipCo = aDecoder.decodeDoubleForKey(PropertyKey.shipCoKey)
        let shipping = aDecoder.decodeDoubleForKey(PropertyKey.shippingKey)
        
        //must call designated initializer
        self.init(client: client, unitPrice: unitPrice, priceSold: priceSold, quantity: quantity, screenH: screenH, screenCharged:screenCharged, house:house, shipCo:shipCo, shipping:shipping)
    }
}
