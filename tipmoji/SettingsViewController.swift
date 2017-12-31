//
//  SettingsViewController.swift
//  tipmoji
//
//  Created by Rishi Talati on 12/31/17.
//  Copyright © 2017 Rishi Talati. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var tipsSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // If there's a value then set to the current slider
        if ((UserDefaults.standard.object(forKey: "TipsDefaultKey")) != nil)
        {
            // Grab the value from user default if it's there
            let tipsValueInSettings = UserDefaults.standard.float(forKey: "TipsDefaultKey")
            
            // Set to the slider
            self.tipsSlider.value = tipsValueInSettings
        }
    }
    
    // We put our logic here
    @IBAction func sliderValueChanged(_ sender: Any) {
        // We still want to increment by 5% the slider
        let step: Float = 0.05
        let valueSlider = Float((sender as! UISlider).value)
        let roundedValue = round(valueSlider/step) * step
        (sender as! UISlider).value = roundedValue
        
        // Display it to the users
        tipsLabel.text = "\(roundedValue*100)%"
        // Then we save in user default
        print("current Value in Setting \(roundedValue)")
        UserDefaults.standard.set(roundedValue, forKey: "TipsDefaultKey")
    }
    
}
