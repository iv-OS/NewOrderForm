//
//  OrderViewController.swift
//  NewOrderForm
//
//  Created by Ivo Radoslavov on 12/17/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITextFieldDelegate {
    
    var order : Order?
    
    //MARK: Properties
    
    //text fields and labels
    @IBOutlet weak var clientNameTextField: UITextField!
    @IBOutlet weak var unitPriceTextField: UITextField!
    @IBOutlet weak var priceSoldTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var screenHouseTextField: UITextField!
    @IBOutlet weak var screenChargedTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var shipCoTextField: UITextField!
    @IBOutlet weak var shippingTextField: UITextField!
    
    
    //buttons
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var calculateTotalButton: UIButton!
    
    //MARK: Actions
    
    @IBAction func calculateTotal(sender: UIButton) {
        /*
        var unitPrice = Double(unitPriceTextField.text!)
        if unitPrice == nil {unitPrice = 0}
        
        var quantity = Double(quantityTextField.text!)
        if quantity == nil {quantity = 0}
        
        let result = unitPrice! * quantity!
        */
        calculateTotalButton.setTitle(String(order!.calculateTotal()), forState: .Normal)
        //totalLabel.text = String(order!.calculateTotal())
        
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    /*
    func textFieldDidBeginEditing(textField: UITextField) {
        //disable save button while typing in text fields
        saveButton.enabled = false
    }
    
    func checkValidClientName() {
        //disable save button if text field is empty
        let text = clientNameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    */
    
    func textFieldDidEndEditing(textField: UITextField) {
        //checkValidClientName()
        navigationItem.title = clientNameTextField.text
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    //MARK: Navigation
    
    @IBAction func cancel(sender: AnyObject) {
        if presentingViewController is UINavigationController {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let client = clientNameTextField.text ?? ""
            let unitPrice = Double(unitPriceTextField.text!) ?? 0.0
            let priceSold = Double(priceSoldTextField.text!) ?? 0.0
            let quantity = Double(quantityTextField.text!) ?? 0.0
            let screenH = Double(screenHouseTextField.text!) ?? 0.0
            let screenCharged = Double(screenChargedTextField.text!) ?? 0.0
            let house = Double(houseTextField.text!) ?? 0.0
            let shipCo = Double(shipCoTextField.text!) ?? 0.0
            let shipping = Double(shippingTextField.text!) ?? 0.0
            
            
            order = Order(client: client, unitPrice: unitPrice, priceSold: priceSold, quantity: quantity, screenH: screenH, screenCharged: screenCharged, house: house, shipCo: shipCo, shipping: shipping)
        }
    }

    
    override func viewDidLoad(){
        super.viewDidLoad()
        clientNameTextField.delegate = self
        unitPriceTextField.delegate = self
        priceSoldTextField.delegate = self
        quantityTextField.delegate = self
        screenHouseTextField.delegate = self
        screenChargedTextField.delegate = self
        houseTextField.delegate = self
        shipCoTextField.delegate = self
        shippingTextField.delegate = self
        
        if presentingViewController is UINavigationController {
        let client = clientNameTextField.text ?? ""
        let unitPrice = Double(unitPriceTextField.text!) ?? 0.0
        let priceSold = Double(priceSoldTextField.text!) ?? 0.0
        let quantity = Double(quantityTextField.text!) ?? 0.0
        let screenH = Double(screenHouseTextField.text!) ?? 0.0
        let screenCharged = Double(screenChargedTextField.text!) ?? 0.0
        let house = Double(houseTextField.text!) ?? 0.0
        let shipCo = Double(shipCoTextField.text!) ?? 0.0
        let shipping = Double(shippingTextField.text!) ?? 0.0
        order = Order(client: client, unitPrice: unitPrice, priceSold: priceSold, quantity: quantity, screenH: screenH, screenCharged: screenCharged, house: house, shipCo: shipCo, shipping: shipping)
        }
        
        //enable save button only if the text field has a valid meal name
        //checkValidClientName()
        
        //set up if editing an existing Meal
        
        if let order = order {
            navigationItem.title = order.client
            clientNameTextField.text = order.client
            unitPriceTextField.text = String(order.unitPrice)
            priceSoldTextField.text = String(order.priceSold)
            quantityTextField.text = String(order.quantity)
            screenHouseTextField.text = String(order.screenH)
            screenChargedTextField.text = String(order.screenCharged)
            houseTextField.text = String(order.house)
            shipCoTextField.text = String(order.shipCo)
            shippingTextField.text = String(order.shipping)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

