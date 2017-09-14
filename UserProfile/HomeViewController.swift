//
//  HomeViewController.swift
//  UserProfile
//
//  Created by Gaurav on 12/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblList: UITableView!
    
    var obj = ["str1","str2","str3","str4","str5","str6","str7","str8","str9","str10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblList.isEditing=true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return obj.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.lblTitle.text=obj[indexPath.row]
        
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.obj[sourceIndexPath.row]
        obj.remove(at: sourceIndexPath.row)
        obj.insert(movedObject, at: destinationIndexPath.row)
        
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(obj)")
        // To check for correctness enable: self.tableView.reloadData()
     //   tableView.reloadData()
    }
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pushtocoll", sender: self)
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
