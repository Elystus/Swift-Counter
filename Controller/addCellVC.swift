//
//  addCellViewController.swift
//  countPlusPlus
//
//  Created by Andrew Black on 6/20/16.
//  Copyright © 2016 Andrew Black. All rights reserved.
//

import UIKit

class addCellVC: UIViewController {
    var returnViewController: ViewController?
    
    @IBOutlet weak var addCounterNameText: UITextField!
    @IBOutlet weak var addCounterValueStepper: UIStepper!
    @IBOutlet weak var addCounterValueStepperLabel: UILabel!
    @IBOutlet weak var addCounterButton: UIButton!
    @IBOutlet weak var addCounterToolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setViewStyle()
        setAddCounterValueStepper()
        addCounterValueStepper.minimumValue = Double(Int.min)
        addCounterValueStepper.maximumValue = Double(Int.max)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setViewStyle () {
        // Toolbar Style
        addCounterToolbar.barTintColor = UIColor.appColorThemePrimary()
        addCounterToolbar.tintColor = UIColor.appColorThemePrimary()
        
        // Textfield Style
        addCounterNameText.layer.borderWidth = 1
        addCounterNameText.layer.cornerRadius = 6
        addCounterNameText.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Stepper Style
        addCounterValueStepper.layer.cornerRadius = 6
        addCounterValueStepper.clipsToBounds = true
        addCounterValueStepper.backgroundColor = UIColor.appColorThemePrimary()
        addCounterValueStepper.tintColor = UIColor.whiteColor()
        
        // Stepper Label Style
        addCounterValueStepperLabel.textColor = UIColor.darkTextColor()
        
        // View Submit Style
        addCounterButton.layer.cornerRadius = 6
        addCounterButton.clipsToBounds = true
        addCounterButton.backgroundColor = UIColor.appColorThemePrimary()
        addCounterButton.tintColor = UIColor.whiteColor()
    }
    
    @IBAction func dismissView(cancelBtn: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func addCounterValueStepperTapped(sender: AnyObject) {
        setAddCounterValueStepper()
    }
    
    func setAddCounterValueStepper () {
        addCounterValueStepperLabel.text = "\(Int(addCounterValueStepper.value))"
    }
    
    @IBAction func addCounterButton(sender: AnyObject) {
        if addCounterNameText.text == nil || addCounterNameText.text == "" {
            addCounterNameText.layer.borderColor = UIColor.appColorRed().CGColor
            return
        }
        
        if(returnViewController == nil) {
            return
        }
        
        returnViewController?.appendCounter(addCounterNameText.text!, value: Int(addCounterValueStepper.value))
        
        returnViewController?.updateTableView()
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
}
