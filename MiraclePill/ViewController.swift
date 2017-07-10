//
//  ViewController.swift
//  MiraclePill
//
//  Created by Ulices Meléndez on 29/06/17.
//  Copyright © 2017 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var stateBtn: UIButton!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    let stateBtnDefaultTitle = "Choose Your State"
    let states = ["Lima", "La Libertad", "San Martin", "Cuzco", "Arequipa"]
    let country = "Perú"

    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
    }
    
    @IBAction func buyNowBtnPressed(_ sender: Any) {
        
        if (nameTextField.text?.isEmpty)! || (streetAddressTextField.text?.isEmpty)! || (cityTextField.text?.isEmpty)! || (countryTextField.text?.isEmpty)! || (zipCodeTextField.text?.isEmpty)! || stateBtn.titleLabel!.text == stateBtnDefaultTitle {
            
            let alertError = UIAlertController(title: "Ups!", message: "Please provide the required information", preferredStyle: UIAlertControllerStyle.alert)
            alertError.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction) in alertError.dismiss(animated: true, completion: nil) }))
            present(alertError, animated: true, completion: nil)
        }
        else {
            let alertSuccess = UIAlertController(title: "Success!", message: "Thanks for buying!", preferredStyle: UIAlertControllerStyle.alert)
        
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            action.isEnabled = false
            var successImage = UIImage(named: "successIndicator")
            successImage = successImage?.withAlignmentRectInsets(UIEdgeInsetsMake(0, -35, 0, 0))
            action.setValue(successImage?.withRenderingMode(.alwaysOriginal), forKey: "image")
            alertSuccess.addAction(action)
        
            alertSuccess.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction) in alertSuccess.dismiss(animated: true, completion: nil) }))
            
            present(alertSuccess, animated: true, completion: nil)
        }
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateBtn.setTitle(states[row], for: UIControlState.normal)
        
        statePicker.isHidden = true
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        zipCodeLabel.isHidden = false
        zipCodeTextField.isHidden = false
        
        countryTextField.text = country
    }
    
}

