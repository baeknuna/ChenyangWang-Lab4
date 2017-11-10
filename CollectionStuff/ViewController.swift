//
//  ViewController.swift
//  CollectionStuff
//
//  Created by Todd Sproull on 9/28/16.
//  Copyright © 2016 Todd Sproull. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate{

    @IBOutlet weak var yearSearch: UITextField!
    var posterArray = [JSON]()
    var poster = [UIImageView]()
    var selectedImage = String()
    var selectedYear = String()
    var selectedTitle = UILabel()
    var titleArray = [JSON]()
    var yearArray = [JSON]()
    var favoriteArray = [String]()
   // var new String = String()
    @IBOutlet weak var theCollectionView: UICollectionView!
    var searchContent = ""
   // var scrollView = UIScrollView()
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
        self.theCollectionView.dataSource = self
        theCollectionView.delegate = self
        theCollectionView.backgroundColor = UIColor.whiteColor()
        createSearchBar()
       // let theFrame = CGRect(x:10, y:10, width: 400, height: 800)
        
       // let scrollView = UIScrollView(frame: theFrame)
        
      //  scrollView.maximumZoomScale = 10.0;
      //  scrollView.minimumZoomScale = 1.0;
        
      //  scrollView.delegate = self
        
      //  view.addSubview(scrollView)
        //collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
    }
    func createSearchBar(){
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        var posterArray1 = [JSON]()
        var titleArray1 = [JSON]()
        var yearArray1 = [JSON]()
         // print("searchText \(searchText)")
          searchContent = searchText
        let range = Int(searchContent)
        print("range is \(range)")
        var str = "http://www.omdbapi.com/?s=\(searchContent)&t=movie&y=&plot=short&r=json"
        if  range != nil{
           //   str = "http://www.omdbapi.com/?s=&t=movie&y=\(searchContent)&plot=short&r=json"
           // print(str)
        }
        else{
         str = "http://www.omdbapi.com/?s=\(searchContent)&t=movie&y=&plot=short&r=json"
        }
        var newString = str
        if str.rangeOfString(" ") != nil{
          newString = str.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        }
        else{
            
        }
        let url = NSURL(string: newString)
        //print(url)
        
        
        let request = NSURLRequest(URL: url!)
        
        var data:NSData
        
        do {
            
            data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
            let json = JSON(data: data)
           // print("json is \(json)")
            // let  = String(json["Search"].array)
            // print(posterUaRL)
            
            // imageView.image = UIImage.imageWithData(data)
            if (searchText.characters.count>1)  {
                if(json["Search"].array != nil){
            let someArray = (json["Search"].array)!
            
             for name in someArray {
                //print(name["Poster"])
                posterArray1.append(name["Poster"])
                titleArray1.append(name["Title"])
                yearArray1.append(name["Year"])
                
                
            }
            // let someName = (name.string)!
            //myArray.append(someName)
            
            //theTable.reloadData()
                    posterArray = posterArray1
                    titleArray = titleArray1
                    yearArray = yearArray1
                   theCollectionView.reloadData()
                }

            }
            
        } catch {
            print ("in error")
            
        }
        //print(posterArray)
        
        
        // print("searchText \(searchText)")
     
       
        let str2 = "http://www.omdbapi.com/?s=\(searchContent)&t=movie&y=&page=2&plot=short&r=json"
        
        var newString2 = str2
        if str2.rangeOfString(" ") != nil{
            newString2 = str2.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        }
        else{
            
        }
        let url2 = NSURL(string: newString2)
        //print(url)
        
        
        let request2 = NSURLRequest(URL: url2!)
        
        var data2:NSData
        
        do {
            
            data2 = try NSURLConnection.sendSynchronousRequest(request2, returningResponse: nil)
            let json = JSON(data: data2)
            // print("json is \(json)")
            // let  = String(json["Search"].array)
            // print(posterUaRL)
            
            // imageView.image = UIImage.imageWithData(data)
            if (searchText.characters.count>1)  {
                if(json["Search"].array != nil){
                    let someArray = (json["Search"].array)!
                    
                    for name in someArray {
                        //print(name["Poster"])
                        posterArray1.append(name["Poster"])
                        titleArray1.append(name["Title"])
                        yearArray1.append(name["Year"])
                        
                        
                    }
                    // let someName = (name.string)!
                    //myArray.append(someName)
                    
                    //theTable.reloadData()
                    posterArray = posterArray1
                    titleArray = titleArray1
                    yearArray = yearArray1
                    theCollectionView.reloadData()
                }
                
            }
            
        } catch {
            print ("in error")
            
        }
        //print(posterArray)
        
       
        // print("searchText \(searchText)")
               let str1 = "http://www.omdbapi.com/?s=\(searchContent)&t=movie&y=&page=3&plot=short&r=json"
       
     
        var newString1 = str1
        if str1.rangeOfString(" ") != nil{
            newString1 = str1.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        }
        else{
            
        }
        let url1 = NSURL(string: newString1)
        //print(url)
        
        
        let request1 = NSURLRequest(URL: url1!)
        
        var data1:NSData
        
        do {
            
            data1 = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: nil)
            let json = JSON(data: data1)
            // print("json is \(json)")
            // let  = String(json["Search"].array)
            // print(posterUaRL)
            
            // imageView.image = UIImage.imageWithData(data)
            if (searchText.characters.count>1)  {
                if(json["Search"].array != nil){
                    let someArray = (json["Search"].array)!
                    
                    for name in someArray {
                        //print(name["Poster"])
                        posterArray1.append(name["Poster"])
                        titleArray1.append(name["Title"])
                        yearArray1.append(name["Year"])
                        
                        
                    }
                    // let someName = (name.string)!
                    //myArray.append(someName)
                    
                    //theTable.reloadData()
                    posterArray = posterArray1
                    titleArray = titleArray1
                    yearArray = yearArray1
                    theCollectionView.reloadData()
                }
                
            }
            
        } catch {
            print ("in error")
            
        }
        //print(posterArray)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  //  @IBOutlet weak var searchContent: UISearchBar!
    
    
     func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
        
    }
    
    @IBAction func searchYear(sender: AnyObject) {
        var posterArray1 = [JSON]()
        var titleArray1 = [JSON]()
        var yearArray1 = [JSON]()
        if (Int(yearSearch.text!) == nil){
            let alert = UIAlertView()
            
            alert.title = "Alert"
            alert.message = "The input is invalid"
            alert.addButtonWithTitle("Understod")
            alert.show()
        }
        let str = "http://www.omdbapi.com/?s=\(searchContent)&t=movie&y=\(yearSearch.text!)&plot=short&r=json"
        
                  let newString = str
       
        let url = NSURL(string: newString)
        //print(url)
        
        
        let request = NSURLRequest(URL: url!)
        
        var data:NSData
        
        do {
            
            data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
            let json = JSON(data: data)
            // print("json is \(json)")
            // let  = String(json["Search"].array)
            // print(posterUaRL)
            
            // imageView.image = UIImage.imageWithData(data)
            if (searchContent.characters.count>1)  {
                if(json["Search"].array != nil){
                    let someArray = (json["Search"].array)!
                    
                    for name in someArray {
                        //print(name["Poster"])
                        posterArray1.append(name["Poster"])
                        titleArray1.append(name["Title"])
                        yearArray1.append(name["Year"])
                        
                        
                    }
                    // let someName = (name.string)!
                    //myArray.append(someName)
                    
                    //theTable.reloadData()
                    posterArray = posterArray1
                    titleArray = titleArray1
                    yearArray = yearArray1
                    theCollectionView.reloadData()
                }
                else{
                    let alert = UIAlertView()
                    
                    alert.title = "Alert"
                    alert.message = "The input is invalid"
                    alert.addButtonWithTitle("Understod")
                    alert.show()
                }
                
                
            }
            
        } catch {
            
            
            print ("in error")
            
        }
        //print(posterArray)

        
    }
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchContent.characters.count != 0{
        return posterArray.count
        }
        return 3
    }
   // let imageview:UIImageView=UIImageView(frame: CGRectMake(50, 0, self.frame.width-200, 50))
   // var imageView:UIImageView!
   
   // var test  = ["http://ia.media-imdb.com/images/M/MV5BMTExMTM1MzQ5NjJeQTJeQWpwZ15BbWU3MDk5NzE2MjE@._V1_SX300.jpg","http://ia.media-imdb.com/images/M/MV5BZGRjYzM2MmYtOWVmNy00ZWM5LWE4YTEtYmUzNTg1OTZhZGZkXkEyXkFqcGdeQXVyMTQzMjU1NjE@._V1_SX300.jpg"]

     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       //print ("in cell for item at row \(indexPath.row) and section \(indexPath.section) ")
        //print("here")
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("mycell", forIndexPath: indexPath) as UICollectionViewCell
        //cell.buttonView.addTarget(self, action: Selector("action"), forControlEvents: UIControlEvents.TouchUpInside)

       //cell.name.numberOfLines = 0
        cell.backgroundColor = UIColor(white: 0.3, alpha: 0.55)
        let imageView = cell.viewWithTag(1) as! UIImageView!
        let label = cell.viewWithTag(2) as! UILabel
        //imageView.image = UIImage(named: "Nothing.png")
       // cell.contentView.addSubview(imageView)
       
        
       // cell.backgroundColor = UIColor.greenColor()
        
        //if(indexPath.section % 2 == 1){
         //   cell.backgroundColor = UIColor.blueColor()
       // }
        //cell.contentView.
        
       // let con = CatService(test:"test")
        
      //  let temp = NSUserDefaults()
      //  let  number = temp.integerForKey("num_of_images")
        
     //   var title_array:Array<String> = con.imageNamesForCategoryAtIndex(number)
        
      //  var string:String = title_array[indexPath.item]
        
    //    print("indexPath.row \(indexPath.item)");
    //    print("string is \(string)")
        
       // let cell = collectionView.dequeueReusableCellWithReuseIdentifier("firstCollectionCell", forIndexPath: indexPath)
        
        //let imageview:UIImageView=UIImageView(frame: CGRectMake(50, 0, self.view.frame.width-200, 50))
        //let image:UIImage = UIImage(named:string)!
        
       // if (posterArray.count < 10){
            
           if(posterArray.count != 0) {
        //for name in posterArray{
         label.text = String(titleArray[indexPath.row])
          //  selectedTitle.text = String(titleArray[indexPath.row])
            let imageURL = String(posterArray[indexPath.row])
            //print(imageURL)
            let url: NSURL? = NSURL(string: imageURL)
            if url != nil{

                let data:NSData? = NSData(contentsOfURL:url!)
                if (data != nil){
            imageView.image = UIImage(data:data!)
                   // cell.image
                  //  selectedImage = imageURL
                cell.contentView.addSubview(imageView)
                    poster.append(imageView)
                //    scrollView.addSubview(imageView)
                //    scrollView.contentSize = CGSize(width: 512, height: 512)
        //}
        //}
            }
                
                else{
                    imageView.image = UIImage(named: "Nothing.png")
                    cell.contentView.addSubview(imageView)
                    poster.append(imageView)

                }
            }
            
        
        /*
        let url1 = NSURL(string: test[indexPath.row])
        
        let data = NSData(contentsOfURL:url1!)
            if (data != nil){
        imageView.image = UIImage(data:data!)
            }
            else{
                imageView.image = UIImage(named: "Nothing.png")
        }
        cell.contentView.addSubview(imageView)
        
        }
 */
       //
        }
        //collectionView.reloadData()
        //self.view.performSegueWithIdentifer("showDetail", sender: self)
        

        return cell
    
    }
    
    /*
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
   {
    if let cell = theCollectionView.cellForItemAtIndexPath(indexPath){
                //selectedImage = poster[indexPath.row]
       // print("the title \(selectedTitle)")
        self.performSegueWithIdentifier("showDetail", sender: cell)
    }
    }
 */
    
    /*
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.superview?.bringSubviewToFront(cell!)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[], animations: ({
            cell?.frame = collectionView.bounds
            collectionView.scrollEnabled = false
        }), completion: nil)
    }
 */
    var runtime = String()
    var genre = String()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //var DestViewController: detail  = segue.destinationViewController as! detail
        //let indexPath = theCollectionView.
       // print("the path\(indexPath)")
        //DestViewController.thetitle = indexPath.
       // theCollectionView.reloadData()

        if let indexPath = self.theCollectionView?.indexPathForCell(sender as! UICollectionViewCell){
        if segue.identifier == "showDetail" {
           
            let DestViewController: detail = segue.destinationViewController as! detail
            selectedTitle.text = String(titleArray[indexPath.row])
            selectedImage = String(posterArray[indexPath.row])
            selectedYear = String(yearArray[indexPath.row])
           // print(indexPath.row)

            //DestViewController.image = selectedImage
       // print(selectedImage)
     //   print("the title \(selectedTitle)")
            DestViewController.labelText = selectedTitle.text!
          //  let otherURL = NSURL(string: "http://www.omdbapi.com/?t=\(selectedTitle.text!)&y=&plot=short&r=json")
            let url : NSString = "http://www.omdbapi.com/?t=\(selectedTitle.text!)&y=&plot=short&r=json"
           // print("http://www.omdbapi.com/?t=\(selectedTitle.text!)&y=&plot=short&r=json")
           // print("the url \(otherURL)")
            let urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            let otherURL : NSURL = NSURL(string: urlStr as String)!
           // print("url \(otherURL)")
            let request = NSURLRequest(URL: otherURL)
            
            var data:NSData
            
            do {
                
                data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
                let json = JSON(data: data)
                //print("json is \(json)")
                // let  = String(json["Search"].array)
                // print(posterUaRL)
                
                // imageView.image = UIImage.imageWithData(data)
                
              
                    
                   // for name in someArray {
                        //print(name["Poster"])
                        runtime = String(json["Runtime"])
                       // print("time \(runtime)")
                        genre = String(json["Genre"])
                       // print(genre)
                        
                   // }
                    // let someName = (name.string)!
                    //myArray.append(someName)
                    
                    //theTable.reloadData()
                    
                }
                
                
                
            catch {
                print ("in error")
                
            }

            DestViewController.url = selectedImage
            DestViewController.year = selectedYear
            //theCollectionView.reloadData()
            DestViewController.runtimeText = runtime
            DestViewController.genreText = genre
            
           // let favorite = NSUserDefaults.standardUserDefaults().objectForKey("favorite")
            let favorite : [String]? = NSUserDefaults.standardUserDefaults().objectForKey("favorite") as? [String]
            print("first print here \(favorite!)")
            if (favorite != nil){
           
            favoriteArray = favorite!
            DestViewController.array = favoriteArray
            }


            
       }
        }
    }
    
 
    

}
