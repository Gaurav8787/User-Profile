//
//  ViewController.swift
//  UserProfile
//
//  Created by Gaurav on 11/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

struct studentMarks {
    var mark1 = 100
    var mark2 = 200
    var mark3 = 300
}

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
        
        UserDefaults.standard.setValue(txtUsername.text, forKey: "uname")
        print(UserDefaults.standard.value(forKey: "uname"))
        
        let marks = studentMarks()
        print("Mark1 is \(marks.mark1)")
        print("Mark2 is \(marks.mark2)")
        print("Mark3 is \(marks.mark3)")
        
        let dictionary = ["myKey" : NSNumber(value: 12)] as NSDictionary
        UserDefaults.standard.set(dictionary, forKey: "myDict") //[myKey : 12]
        let d = UserDefaults.standard.dictionary(forKey: "myDict") //{[myKey : 12]}
    
        print(d)
        
        var arr=[NSDictionary]()
        
        let dic = ["obj":"val"]
        arr.append(dic as NSDictionary)
        print(arr)
        
        UserDefaults.standard.set(arr, forKey: "data")
        
        print("data=")
        print(UserDefaults.standard.value(forKey: "data") ?? "dd")
        
    }

}

