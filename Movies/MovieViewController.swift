//
//  MovieViewController.swift
//  Movies
//
//  Created by Dario on 3/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit
import Alamofire

class MovieViewController: UIViewController,UINavigationControllerDelegate {
    @IBOutlet weak var lblMesseageReleased: UILabel!
    @IBOutlet weak var lblMessageRunTime: UILabel!
    @IBOutlet weak var lblMessageGenre: UILabel!
    @IBOutlet weak var lblMessagePlot: UILabel!
    @IBOutlet weak var lblMessageLanguage: UILabel!
    @IBOutlet weak var lblMessageCountry: UILabel!
    @IBOutlet weak var lblMessageRating: UILabel!
    
    @IBOutlet weak var lblMessageTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var movie : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        doAlamoFireRequest()
     

        // Do any additional setup after loading the view.
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Movie Details")
        //let rightItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightbtn))
        let leftItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftbtn))
        
        navItem.leftBarButtonItem = leftItem
        //navItem.rightBarButtonItem = rightItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
//    @objc func rightbtn() { // remove @objc for Swift 3
//
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let clientsViewController = storyBoard.instantiateViewController(withIdentifier: "searchMovies") as! SearchMoviesViewController
//        self.present(clientsViewController, animated:true, completion:nil)
//    }
    
    @objc func leftbtn() { // remove @objc for Swift 3
        self.dismiss(animated:true, completion: nil)
        
    }
    func doAlamoFireRequest(){
        let url = "http://www.omdbapi.com/?t=" + movie.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! + "&apikey=ea65c27a"
        Alamofire.request(url).responseJSON { response in // 1
            // server data
            print("result:",response.result)   // result of response serialization
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)") // serialized json response
                guard let Title = json["Title"] as? String,
                
                    let Released = json["Released"] as? String,
                    let Runtime = json["Runtime"] as? String,
                    let Genre = json["Genre"] as? String,
                    let Plot = json["Plot"] as? String,
                    let Language = json["Language"] as? String,
                    let Country = json["Country"] as? String,
                    let ImageView = json["Poster"] as? String
                
                    else {
                        print("Failed to parse JSON")
                        return
                }
               self.lblMessageTitle.text = Title
                self.lblMessageRunTime.text = Runtime
                self.lblMessageGenre.text = Genre
                self.lblMessagePlot.text = Plot
                self.lblMessageLanguage.text = Language
                self.lblMessageCountry.text = Country
                self.lblMesseageReleased.text = Released
                
                do {
                    let imageurl = URL(string: ImageView)
                    let data = try Data(contentsOf: imageurl!)
                    self.imageView.image = UIImage(data: data)
                }
                catch{
                    print(error)
                }
            }
            else{
                
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
}
