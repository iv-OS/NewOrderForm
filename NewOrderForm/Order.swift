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
    
    func calculateTotal() -> Double {
        return unitPrice * quantity
    }
    
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
