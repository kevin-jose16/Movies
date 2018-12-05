//
//  ClientViewController.swift
//  Movies
//
//  Created by Dario on 3/12/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController, UINavigationControllerDelegate { //UIPickerViewDelegate, UIPickerViewDataSource,
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var favouriteMoviesTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        // Connect data:
//        self.picker.delegate = self
//        self.picker.dataSource = self

        // Input the data into the array
//        pickerData = ["Action", "Animated", "Horror", "Romantic", "Adventure", "Reality Show"]
    
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Client")
        let rightItem = UIBarButtonItem(title: "Movies", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightbtn))
        let leftItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftbtn))
        
        navItem.leftBarButtonItem = leftItem
        navItem.rightBarButtonItem = rightItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func rightbtn() { // remove @objc for Swift 3
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let clientsViewController = storyBoard.instantiateViewController(withIdentifier: "searchMovies") as! SearchMoviesViewController
        self.present(clientsViewController, animated:true, completion:nil)
    }
    
    @objc func leftbtn() { // remove @objc for Swift 3
        self.dismiss(animated:true, completion: nil)
        
    }
    
    
    
    @IBAction func addClientButton(_ sender: Any) { 
        
    }
    
    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
