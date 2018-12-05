//
//  SearchMoviesViewController.swift
//  Movies
//
//  Created by Dario on 3/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit
import Alamofire

class SearchMoviesViewController: UIViewController,  UINavigationControllerDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var moviesTitleTextField: UITextField!
    @IBOutlet weak var moviesYearTextField: UITextField!
    @IBOutlet weak var lblMessageText: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var movieDetailsButton: UIButton!
    
    
    var moviesTitle : String = ""
    var moviesYear : String = ""
    var imageView : String = ""
    var image: String = ""
    var movie :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        moviesTitleTextField.delegate = self
    

        // Do any additional setup after loading the view.
        updateSaveButtonState()
       
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Movies List")
        let leftItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftbtn))
        
        navItem.leftBarButtonItem = leftItem
        //navItem.rightBarButtonItem = rightItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
   
    @objc func leftbtn() { // remove @objc for Swift 3
        self.dismiss(animated:true, completion: nil)
        
    }

    @IBAction func searchButton(_ sender: Any) {
        var url = "http://www.omdbapi.com/?"
        let param3 = "&apikey=ea65c27a"
        
        if moviesTitleTextField.text != "" {
            url = url + "t=" + moviesTitleTextField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            print("URL= " + url)
            if moviesYearTextField.text != "" {
                url = url + "&y=" + moviesYearTextField.text! + param3
            }
            else {
                url = url  + param3
            }
        }
        else {
            self.movieDetailsButton.setTitle("You must enter at least the title to do the movie search", for: .normal)
        }
          Alamofire.request(url).responseJSON { response in // 1
                   // server data
                print("result:",response.result)   // result of response serialization
            
            if let json = response.result.value as? [String: Any] {
                print("JSON: \(json)") // serialized json response
                guard let Title = json["Title"] as? String
                    //let Year = json["Year"] as? String
                    else {
                            print("Failed to parse JSON")
                            return
                    }
                    self.movieDetailsButton.setTitle(Title, for: .normal)//+ " - " + Year,
                }
            else{
                
            }
        }
    }
    
    @IBAction func movieDetails(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let movieViewController = storyBoard.instantiateViewController(withIdentifier: "movieDetails") as! MovieViewController
        movieViewController.movie = movieDetailsButton.currentTitle!
        self.present(movieViewController, animated:true, completion:nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = moviesTitleTextField.text ?? ""
        searchButton.isEnabled = !text.isEmpty
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if(segue.identifier == "MovieDetails"){
    
            guard let movieDetailsViewController = segue.destination as? MovieViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
           /* guard let searchMovieController = sender as? SearchMoviesViewController else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }*/
            
            guard let movieinfo = movieDetailsButton else {
                fatalError("The selected movie is not being displayed")
            }
            
            let selectedMovie = movieinfo.currentTitle//.title(for: .normal)
            movieDetailsViewController.movie = selectedMovie!
      
        }
    }
    
   
    

}
