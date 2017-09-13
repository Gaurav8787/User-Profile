//
//  DetailViewController.swift
//  UserProfile
//
//  Created by Gaurav on 12/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var clview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = clview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.minimumInteritemSpacing = 10; // this number could be anything <=5. Need it here because the default is 10.
        
//        let size = CGSize(width: (clview.frame.size.width)/5, height: 100) // CGFloat, Double, Int
        let size = CGSize(width: 100, height: 100) // CGFloat, Double, Int

        layout.itemSize = size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.title.text="hello"
        cell.imgV.image=UIImage(named:"hello.png")
        
        return cell
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
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
