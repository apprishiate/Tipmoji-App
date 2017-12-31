//
//  ViewController.swift
//  tipmoji
//
//  Created by Rishi Talati on 12/29/17.
//  Copyright © 2017 Rishi Talati. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tipsSlider: UISlider!
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var amountTipTextfield: UITextField!
    @IBOutlet weak var totalTipsTextField: UITextField!
    @IBOutlet weak var emojiImageView: UIImageView!
    let lowTipAmountThreshold: Float = 10
    let averageTipAmountThreshold: Float = 15
    let goodTipAmountThreshold: Float = 20
    
    var currency = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        billLabel.becomeFirstResponder()
        
        // Listening for notification of 15s timeout
        
        // Add observer and reload the view everytime we receive a notification on selected player
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.reload(notification:)), name: NSNotification.Name(rawValue: "RefreshUIAfterTimeOut"), object: nil)
    
    }
    
    
    @objc func reload(notification: Notification)
    {
        self.amountTipTextfield.text = ""
        self.billLabel.text = ""
        self.totalTipsTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // If there's a value then set to the current slider
        if ((UserDefaults.standard.object(forKey: "TipsDefaultKey")) != nil)
        {
            // Grab the value from user default if it's there
            let tipsValueInSettings = UserDefaults.standard.float(forKey: "TipsDefaultKey")
            
            self.tipsSlider.setValue(tipsValueInSettings, animated: true)
        }
    }
    
    // Bill input by users
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        // Add step value by 5
        let step: Float = 0.05
        let valueSlider = Float((sender as! UISlider).value)
        let roundedValue = round(valueSlider/step) * step
        (sender as! UISlider).value = roundedValue
        
        // We retrieve value of the slider
        let currentValue = Float((sender as! UISlider).value)
        
        // We calculate then value in percentage
        let percentageTips = Float(currentValue * 100)
        print("Slider changing to \(percentageTips) ?")
        
        // Check if the bill amount is empty or not
        if let text = billLabel.text {
            // We calculate the tips depending on total bill amount
            let amountBill: String = text
            
            // Check if the bill amount is a number
            if let amountBillFloat: Float = Float(amountBill) {
                
                let tipAmount = amountBillFloat * percentageTips / 100
                
                let tipInDollars = String(format: "\(currency)%.02f", tipAmount)
                
                self.amountTipTextfield.text = "\(tipInDollars)"
                
                // Then calculate the total
                
                self.totalTipsTextField.text = ("\(tipAmount + amountBillFloat)")
             
                // Now display an image depending on tip amount
                // if low tip
                print("percentageTips = \(percentageTips)")
                
                if percentageTips < self.lowTipAmountThreshold
                {
                    self.emojiImageView.image = UIImage.init(named: "bademoji")
                }
                else if percentageTips < self.averageTipAmountThreshold
                {
                    self.emojiImageView.image = UIImage.init(named: "averageemoji")
                }
                else if percentageTips < self.goodTipAmountThreshold
                {
                    self.emojiImageView.image = UIImage.init(named: "goodemoji")
                }
                else if percentageTips > self.goodTipAmountThreshold
                {
                    self.emojiImageView.image = UIImage.init(named: "awesomeemoji")
                }
                
            }
            
        }
    }
}

