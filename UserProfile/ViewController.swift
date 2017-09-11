//
//  ViewController.swift
//  UserProfile
//
//  Created by Gaurav on 11/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      /*  let maxL = 5
        let cstr:NSString = textField.text! as NSString
        
        let newstr:NSString = cstr.replacingCharacters(in: range, with: string) as NSString
        return newstr.length <= maxL*/
        
    /*    let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        */
        return true
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = testStr.range(of: emailRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
        
    }

    @IBAction func btntapped(_ sender: UIButton) {
        
        if isValidEmail(testStr: txtUsername.text!) == false {
            print("false")
        } else {
            print("true")
        }
        
        if txtUsername.text == "" {
            let alert = UIAlertController(title: "MyApp", message: "Please insert name", preferredStyle: UIAlertControllerStyle.alert)
            
            let okaction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            })
            
            alert.addAction(okaction)
            self.present(alert, animated: true, completion: nil)
        }
    }

}

