//
//  DetailsViewController.swift
//  GoMovies
//
//  Created by zafre MAD on 5/29/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//

import UIKit
import Alamofire
import CarbonKit

class DetailsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CarbonTabSwipeNavigationDelegate {
    @IBOutlet var tabelViews: UITableView!
    var modelCast = [ModelCast]()
    var modelCrew = ModelCrew()
    var passId = 0
    var passIndex = 0
    var flagFirst = false
    var passStory = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViews.estimatedRowHeight = 90// height be sorate dynamic mibashad
        tabelViews.rowHeight = UITableViewAutomaticDimension
        loadCrew()
        loadCast()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailsTableViewCell
        let segment = ViewController.models[passIndex]

        cell.nameLabel.text = segment.name

        if flagFirst {
        for (index,value) in segment.genres.enumerated() {
            if index == 0 {
                cell.genres.text?.append( value )
                
            }else{
                cell.genres.text?.append("," + value )
            }
        }
            flagFirst = false
        }
        passStory = segment.desciptin
        cell.rateLabel.text = "\(segment.rating.average)"
        cell.bannerImage.sd_setImage(with: URL(string: segment.image.original))
        cell.mediumImage.sd_setImage(with: URL(string: segment.image.medium))
        cell.mediumImage.layer.masksToBounds = true
        cell.mediumImage.layer.cornerRadius = 3
        
        
        
//MARK:CarbonKit

        let items = ["Info","Trailer","Comments","Awards"]
        
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor =  UIColor.white
        //        let screenSize: CGRect = UIScreen.main.bounds
        carbonTabSwipeNavigation.currentTabIndex = 0
        
        let screenWidth = self.view.frame.size.width/4
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 2)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(screenWidth, forSegmentAt: 3)
    
        carbonTabSwipeNavigation.setTabExtraWidth(10)
        
        carbonTabSwipeNavigation.setSelectedColor(UIColor.black)
        carbonTabSwipeNavigation.setIndicatorColor(UIColor(hexString: "FACE52"))
        carbonTabSwipeNavigation.setNormalColor(UIColor(hexString: "4C4C4C"))
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: cell.carbonViews)
        
        if modelCrew.name != "" {
        cell.directorLabel.text = modelCrew.name
        cell.directorLabel2.text = modelCrew.name
        }
        var desc =  segment.desciptin
        desc = desc.replacingOccurrences(of: "<p>", with: "")
        desc = desc.replacingOccurrences(of: "</p>", with: "")
        desc = desc.replacingOccurrences(of: "<b>", with: "")
        desc = desc.replacingOccurrences(of: "</b>", with: "")
        
        cell.storyLabel.text = "          " + desc
        
        for (index,value) in modelCast.enumerated() {
            
            if index == 0 {
                cell.starLabel.text?.append(value.name)
                
            }else{
                cell.starLabel.text?.append("," + value.name)
            }
        }

        

        
        
        
        return cell
    }

    
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
 
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sxx =  storyboard.instantiateViewController(withIdentifier: "other") as! OtherViewController
            
            return sxx
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    func loadCrew() {
        Alamofire.request(Server.json + "/\(passId)/crew",method:.get).responseJSON { (rsponse) in
            switch rsponse.result {
            case .failure(let error):
                print("Validation failure\(error)")
                
            case .success(let json):
                print("Validation Successful")
                let response = json as! [NSDictionary]
                for js in response {
                    let model = ModelCrew()
                    
                    
                    if ((js["type"] as? String) != nil) {
                        let type = js["type"] as? String
                        if type == "Creator" {
                            
                            if ((js["person"] as? NSDictionary) != nil) {
                                let person = js["person"] as? NSDictionary
                                if ((person?["name"] as? String) != nil) {
                                    model.name = (person?["name"] as? String)!
                                    
                                   self.modelCrew = model
                                }
                                
                            }
                        }
                        
                        
                        
                        
                    }
                    
                    
                }
              self.tabelViews.reloadData()
                
            }
            
        }
        
    }
    
    
    func loadCast() {
        
        Alamofire.request(Server.json + "/\(passId)/cast",method:.get).responseJSON { (rsponse) in
            switch rsponse.result {
            case .failure(let error):
                print("Validation failure\(error)")
                
            case .success(let json):
                print("Validation Successful")
                let response = json as! [NSDictionary]
                
                for js in response {
                    let model = ModelCast()
                    
                    if ((js["person"] as? NSDictionary) != nil) {
                        let person = js["person"] as? NSDictionary
                        
                        if ((person?["name"] as? String) != nil) {
                            model.name = (person?["name"] as? String)!
                        }
                        
                        
                        
                    }
                    
                   self.modelCast.append(model)
                    
                }
                self.tabelViews.reloadData()

                
                
            }
            
        }
        
    }


}
