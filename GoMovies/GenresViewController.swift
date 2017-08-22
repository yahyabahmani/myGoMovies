//
//  GenresViewController.swift
//  GoMovies
//
//  Created by zafre MAD on 5/26/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//
import SDWebImage
import UIKit

class GenresViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var index = IndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(ViewController.models.count)
            return ViewController.models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GenresTableViewCell
        let segment = ViewController.models[indexPath.row]
        
        cell.nameLabel.text = segment.name
        
        for (index,value) in segment.genres.enumerated() {
            if index == 0 {
                cell.genresLabel.text?.append( value )

            }else{
            cell.genresLabel.text?.append("," + value )
            }
            }
        cell.rateLabel.text = "\(segment.rating.average)"
        cell.rateLabel.layer.masksToBounds = true
        cell.rateLabel.layer.cornerRadius = cell.rateLabel.frame.width/2
        cell.filmImage.layer.masksToBounds = true
        cell.filmImage.layer.cornerRadius = 3
        
        cell.filmImage.sd_setImage(with: URL(string: segment.image.medium) )
        
        var desc =  segment.desciptin //chon descreption shamele <p> va </p> </b> mibashad,migim ke az ina estefade nashe va character khali estefade beshe
        desc = desc.replacingOccurrences(of: "<p>", with: "")
        desc = desc.replacingOccurrences(of: "</p>", with: "")
        desc = desc.replacingOccurrences(of: "<b>", with: "")
        desc = desc.replacingOccurrences(of: "</b>", with: "")
        
        cell.descriptionLabel.text = desc
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        index = indexPath
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendIndex" {
            let destination  = segue.destination as! DetailsViewController
            
            let segment = ViewController.models[index.row]
            
            destination.passIndex = index.row
            destination.passId = segment.id
            destination.flagFirst = true
        }
        
    }

}
