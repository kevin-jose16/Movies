//
//  ClientsTableViewController.swift
//  Movies
//
//  Created by Dario on 30/11/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit

class ClientsTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var clientslist : [Clients] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.dataSource = self
        tableView.delegate = self
        clientslist = []
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(getter: ClientsTableViewController.nibBundle))
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Clients")
        let rightItem = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightbtn))
        let leftItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftbtn))

        navItem.leftBarButtonItem = leftItem
        navItem.rightBarButtonItem = rightItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }

    @objc func rightbtn() { // remove @objc for Swift 3
       
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let clientsViewController = storyBoard.instantiateViewController(withIdentifier: "Client") as! ClientViewController
        self.present(clientsViewController, animated:true, completion:nil)
    }
    
    @objc func leftbtn() { // remove @objc for Swift 3
        self.dismiss(animated:true, completion: nil)

    }
  
}


    // MARK: - Table view data source

func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
       // cell.textLabel?.text = cell[indexPath.row]
        return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


