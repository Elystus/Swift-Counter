//
//  CounterTableViewCell.swift
//  countPlusPlus
//
//  Created by Andrew Black on 6/18/16.
//  Copyright © 2016 Andrew Black. All rights reserved.
//

import UIKit

class CounterCell: UITableViewCell {
    
    @IBOutlet weak var cellValueLabel: UILabel!
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellAddButton: UIButton!
    @IBOutlet weak var cellMinusButton: UIButton!
    // @IBOutlet weak var cellColorOutput:
    
    var cellCounter: Counter?
    var cellColor: UIColor?
    
    static var inc = 0
    
    let availableColors = ["purple", "red", "blue", "Pink", "Orange", "green"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.styleCell()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setColor(color: String) {
        let color = color.lowercaseString
        switch color {
            case "purple":
                cellColor = UIColor.appColorPurple()
            case "pink":
                cellColor = UIColor.appColorPink()
            case "blue":
                cellColor = UIColor.appColorBlue()
            case "orange":
                cellColor = UIColor.appColorOrange()
            case "green":
                cellColor = UIColor.appColorGreen()
            case "red":
                cellColor = UIColor.appColorRed()
            default:
                cellColor = UIColor.appColorThemeSecondary()
        }
    }
    
    func styleCell() {
        let randomColor = availableColors[Int(arc4random_uniform(UInt32(availableColors.count)))]
        self.setColor(randomColor)
        
        // Generic Cell Formatting
        self.backgroundColor = cellColor
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        // Value Label
        cellValueLabel.textColor = UIColor.whiteColor()
        cellValueLabel.adjustsFontSizeToFitWidth = true
        cellValueLabel.minimumScaleFactor = 0.5
        
        // Name Label
        cellNameLabel.textColor = UIColor.whiteColor()
        cellNameLabel.adjustsFontSizeToFitWidth = true
        cellNameLabel.minimumScaleFactor = 0.5
        
        // Add Button Style
        // cellAddButton.backgroundColor = UIColor.whiteColor()
        cellAddButton.tintColor = UIColor.whiteColor()
        
        // Minus Button Style
        // cellMinusButton.backgroundColor = UIColor.whiteColor()
        cellMinusButton.tintColor = UIColor.whiteColor()
    }
    
    @IBAction func cellCounterIncrement(addButton: UIButton) {
        if(cellCounter != nil) {
            cellCounter?.valueIncrement()
            cellValueLabel.text = "\(cellCounter!.value)"
        }
    }
    
    @IBAction func cellCounterDecrement(minusButton: UIButton) {
        if(cellCounter != nil) {
            cellCounter?.valueDecrement()
            cellValueLabel.text = "\(cellCounter!.value)"
        }
    }
    
}
