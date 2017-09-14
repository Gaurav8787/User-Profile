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
class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var imgProfile: UIImageView!
    var strName="hello"
    lazy var strSurName = "surname"
    
    let dtpicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showdtpicker()
    }
    
    func showdtpicker() {
        dtpicker.datePickerMode = .date
        
        var date = Date()
        print(date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        
        let minute:TimeInterval = 60.0
        let hour:TimeInterval = 60.0 * minute
        let day:TimeInterval = 24 * hour
        
       let strdate = Date(timeIntervalSinceNow: day)
        
        let newstr:String = formatter.string(from: strdate)
        
        let dte:Date = formatter.date(from: "11/11/2011")!
        print(dte,newstr)
        
        // Age of 18.
        let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
        print(MINIMUM_AGE)
        
        dtpicker.minimumDate = MINIMUM_AGE

        // Age of 100.
        let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: 10, to: Date())!;
        print(MAXIMUM_AGE)
        
        dtpicker.maximumDate=MAXIMUM_AGE
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebtn = UIBarButtonItem(title: "done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(doneFunction))
        let spacingbtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        let nobtn = UIBarButtonItem(title: "done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(noFunction))

        toolbar.setItems([nobtn,spacingbtn,donebtn], animated: true)
        
        txtUsername.inputAccessoryView=toolbar
        txtUsername.inputView=dtpicker
        
    }
    
    func doneFunction(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtUsername.text=formatter.string(from: dtpicker.date)
        
        self.view.endEditing(true)
    }
    
    func noFunction(){
        self.view.endEditing(true)
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
    
    func alerDisplayForOK(pTitle:String,pMessage:String) {
        
        let alert = UIAlertController(title: pTitle, message: pMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(okaction)
        self.present(alert, animated: true, completion: nil)

    }

    @IBAction func uploadPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "app", message: "please select", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "Gallery", style: .default, handler: { action in
            self.opnegallery()
        })
        
        let actioncamera = UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.opncamera()
        })


        alert.addAction(action)
        alert.addAction(actioncamera)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func opnegallery()  {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func opncamera()  {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgProfile.contentMode = .scaleAspectFit
            imgProfile.image = pickedImage
            
            let imageData = UIImageJPEGRepresentation(imgProfile.image!, 0.6)
            let compressedJPGImage = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
            
            let path = try! FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            let newPath = path.appendingPathComponent("image.jpg")
           // let jpgImageData = UIImageJPEGRepresentation(image, 1.0)
            do {
                try imageData!.write(to: newPath)
            } catch {
                print(error)
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btntapped(_ sender: UIButton) {
        
        if isValidEmail(testStr: txtUsername.text!) == false {
            print("false")
        } else {
            print("true")
        }
        
        if txtUsername.text == "" {
            alerDisplayForOK(pTitle: "App", pMessage: "Please enter value")
            return
        }
        
        var dicuser = Dictionary<String,String>()
        
        dicuser["uname"]=txtUsername.text
        dicuser["pass"]="pwd"
        
       
        
        var dicuser2 = Dictionary<String,String>()
        dicuser2["uname"]="2"
        dicuser2["pass"]="pwd2"
        
        var dataA = [Dictionary<String, String>]()
        dataA.append(dicuser)
        dataA.append(dicuser2)
        
        UserDefaults.standard.setValue(dataA, forKey: "creden")
        
        UserDefaults.standard.setValue(dicuser2, forKey: "data2")
        
        let dic2 = UserDefaults.standard.value(forKey: "data2") as! Dictionary<String,String>
        
        print(dic2)
        
        print(UserDefaults.standard.value(forKey: "creden")!)
        
        let arr = UserDefaults.standard.value(forKey: "creden") as!  [Dictionary<String, String>];
        
        for element in arr{
            print(element)
            
            print(element["uname"] ?? "dfv")
            print(element["pass"] ?? "dfv")
        }
        
        UserDefaults.standard.set(true, forKey: "dones")
        
        return
        /*
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
        print(UserDefaults.standard.value(forKey: "data") ?? "dd")*/
        
    }

}

