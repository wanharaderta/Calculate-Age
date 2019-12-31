//
//  ViewController.swift
//  Find My Age
//
//  Created by Wanhar on 31/12/19.
//  Copyright © 2019 Karya anak Takalar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calendar    = Calendar.current

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lbAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func calculateMyAge(_ sender: Any) {
        let birthDate   = self.datePicker.date
        let today       = Date()
        
        if birthDate >= today{
            alertDate()
            return
        }
        let components  = calendar.dateComponents([.year,.month,.day], from: birthDate,to: today)
        
        guard let ageYears  = components.year else {return}
        guard let ageMonth  = components.month else {return}
        guard let ageDay    = components.day else {return}
        
        self.lbAge.text = "\(ageYears) years, \(ageMonth) month, \(ageDay) day"
    }
    
    func alertDate(){
        let alertController = UIAlertController(title: "Error", message: "Please enter a date", preferredStyle: .alert)
        let alertAction     = UIAlertAction(title: "yes", style: .default, handler: nil)
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

}

