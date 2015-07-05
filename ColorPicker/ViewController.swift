//
//  ViewController.swift
//  ColorPicker
//
//  Created by Samuel C on 5/07/2015.
//  Copyright (c) 2015 Zipa Smart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var ColorPicker: UIPickerView!
    
    var pickerColors:NSMutableArray!
    var R:CGFloat = 255
    var G:CGFloat = 255
    var B:CGFloat = 255
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ColorPicker.delegate = self
        ColorPicker.dataSource = self
        
        pickerColors = []
        
        for i in 0...255
        {
            pickerColors.addObject("\(255-i)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerColors.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerColors[row] as! String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.backgroundColor = GetColor(pickerColors[row] as! String, colorValue: component)
    }
    
    func GetColor(colorName:String, colorValue:Int) -> UIColor {
        switch(colorValue) {
            case 0:
                R = StringToFloat(colorName)
            case 1:
                G = StringToFloat(colorName)
            case 2:
                B = StringToFloat(colorName)
            default:
                R = StringToFloat("0")
            
        }
        
        return UIColor(red: R/255, green: G/255, blue: B/255, alpha: 1)
    }


    func StringToFloat(value:String) -> CGFloat {
        if let n = NSNumberFormatter().numberFromString(value) {
            let f = CGFloat(n)
            return f
        }
        
        return CGFloat(0)
    }
}

