//
//  ViewController.swift
//  GoMovies
//
//  Created by zafre MAD on 5/25/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//
import CarbonKit
import UIKit
import Alamofire

class ViewController: UIViewController,CarbonTabSwipeNavigationDelegate {
    @IBOutlet var viewCarboonKit: UIView!
    static var models = [Model]()
     var modelsObject = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GOMOVIES"
        navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "Untitled-12"), for: .default)
       navigationController?.navigationBar.shadowImage = #imageLiteral(resourceName: "Untitled-12")
        loadurl()

        
    
    }
      func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
    
        switch index
        {
        case 0:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sxx =  storyboard.instantiateViewController(withIdentifier: "action") as! GenresViewController
            
            
            
            
            
            return sxx
            
        
            
            
        default:
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sxx =  storyboard.instantiateViewController(withIdentifier: "other") as! OtherViewController
            
            return sxx
        }
    
    }

//MARK:init
    func loadurl() {
    
        Alamofire.request(Server.json,method:.get).responseJSON { (rsponse) in
            switch rsponse.result {
            case .failure(let error):
            print("Validation failure\(error)")
                
            case .success(let json):
            print("Validation Successful")
            let response = json as! [NSDictionary]
            for js in response {
                
                let model = Model()
                let rate = Rating()
                let image = Image()
                
                if ((js["name"] as? String) != nil) {
                model.name = (js["name"] as? String)!
                }
                if ((js["summary"] as? String) != nil) {
                    model.desciptin = (js["summary"] as? String)!
                }
                if js["genres"] as? [String] !=  nil {
                model.genres = (js["genres"] as? [String])!
                }
                if ((js["id"] as? Int) != nil) {
                    model.id = (js["id"] as? Int)!
                }
                if let rates = js["rating"] as? NSDictionary  {
                    
                    if let rate2 = rates["average"] as? Double {
                        rate.average = rate2
                    }
                
                }
                
                if let images = js["image"] as? NSDictionary{
                    image.medium = (images["medium"] as? String)!
                    image.original = (images["original"] as? String)!
                    
                }
                model.image = image
                
                model.rating = rate
                
                
                ViewController.models.append(model)
                
                }
            //MARK:CarbonKit
            
            let items = ["ACTIONS","ANIMATION","BIGRAPHY","DRAMA"]
            
            let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
            carbonTabSwipeNavigation.toolbar.isTranslucent = false
            carbonTabSwipeNavigation.toolbar.barTintColor =  UIColor(hexString: "323236")
            //        let screenSize: CGRect = UIScreen.main.bounds
            carbonTabSwipeNavigation.currentTabIndex = 0
            
            let screenWidth = self.view.frame.size.width/4
            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 0)
            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 1)
            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 2)
            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 3)
            carbonTabSwipeNavigation.setTabExtraWidth(10)
            carbonTabSwipeNavigation.setSelectedColor(UIColor.white)
            carbonTabSwipeNavigation.setIndicatorColor(UIColor(hexString: "FACE52"))
            carbonTabSwipeNavigation.setNormalColor(UIColor(hexString: "E6E6E6"))
            carbonTabSwipeNavigation.insert(intoRootViewController: self)
                

                
            }
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
}
}

