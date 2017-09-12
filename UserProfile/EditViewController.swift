//
//  EditViewController.swift
//  UserProfile
//
//  Created by Gaurav on 12/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var txtEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = UserDefaults.standard.value(forKey: "data2") as! Dictionary<String,String>
        
        txtEdit.text = data["uname"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
