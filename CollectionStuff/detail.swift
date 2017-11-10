//
//  detail.swift
//  CollectionStuff
//
//  Created by 王琛阳 on 10/18/16.
//  Copyright © 2016 Todd Sproull. All rights reserved.
//

import UIKit
import Social
class detail: UIViewController, UIScrollViewDelegate {
    var runtimeText = String()
    var genreText = String()
  
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
    @IBOutlet weak var genre: UILabel!
  @IBOutlet weak var thetitle: UILabel!
    var labelText = String()
    var array = [String]()
    var url = String()
    var year = String()
  //  @IBOutlet weak var rating: UILabel!
  //  @IBOutlet weak var year: UILabel!
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
       // print("in did scroll")
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
        
        let theFrame = CGRect(x:10, y:100, width: 200, height: 300)
        
        let scrollView = UIScrollView(frame: theFrame)
        
        scrollView.maximumZoomScale = 10.0;
        scrollView.minimumZoomScale = 1.0;
        
        scrollView.delegate = self
        
        
        //scrollView.backgroundColor = UIColor.redColor()
        view.addSubview(scrollView)

       thetitle.text = labelText
        releaseYear.text = "Release: \(year)"
        runtime.text = "Runtime: \(runtimeText)"
        genre.text = "Genre: \(genreText)"
        let bigFrame = CGRect(x:10, y:100, width: 300, height: 400)
        let myImageView = UIImageView(frame: bigFrame)
        let url1: NSURL? = NSURL(string: url)
        if url1 != nil{
            
            
            let data:NSData? = NSData(contentsOfURL:url1!)
            if (data != nil){
                myImageView.image = UIImage(data:data!)
            }
            else{
                myImageView.image = UIImage(named: "Nothing.png")
                
            }
            scrollView.addSubview(myImageView)
            scrollView.contentSize = CGSize(width: 300, height: 400)


            
    }
 
    }
    
    @IBAction func sharing(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.presentViewController(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func addFavorite(sender: AnyObject) {
        
        
        array.append(labelText)
        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "favorite")
       
        NSUserDefaults.standardUserDefaults().synchronize()
        //let favorite = NSUserDefaults.standardUserDefaults().objectForKey("favorite")
        let favorite : [String]? = NSUserDefaults.standardUserDefaults().objectForKey("favorite") as? [String]
        print("begin favorite\(favorite!)")
      
            }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
