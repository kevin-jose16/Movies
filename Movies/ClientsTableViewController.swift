//
//  ClientsTableViewController.swift
//  Movies
//
//  Created by Dario on 30/11/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit
import os.log

class ClientsTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var clientslist = [Clients] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Load any saved meals, otherwise load sample data.
        if let savedClients = loadClients() {
            clientslist += savedClients
        }
        else {
            // Load the sample data.
            loadSampleClients()
        }
       
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new client.", log: OSLog.default, type: .debug)
        case "ClientDetail":
            guard let clientsDetailViewController = segue.destination as? ClientViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedClientCell = sender as? ClientTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedClientCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedClient = clientslist[indexPath.row]
            clientsDetailViewController.client = selectedClient
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    private func loadSampleClients() {
        let name1 = "charity"
        let name2 = "kevin"
        let email1 = "charity@tcs.com"
        let email2 = "kevin@tcs.com"
        
        
        guard let client1 = Clients(name: name1, email: email1, favouritemoviesGenre: "Animated", movies: [Movie]()) else {
            fatalError("Unable to instantiate client1")
        }
        
        guard let client2 = Clients(name: name2, email: email2, favouritemoviesGenre: "Action", movies: [Movie]()) else {
            fatalError("Unable to instantiate client1")
        }
        
        clientslist += [client1, client2]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return clientslist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let cellIdentifier = "ClientTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClientTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ClientTableViewCell.")
        }
        // cell.textLabel?.text = cell[indexPath.row]
        // Fetches the appropriate meal for the data source layout.
        let client = clientslist[indexPath.row]
        
        cell.name.text = client.name
        cell.email.text = client.email
        
        return cell
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            clientslist.remove(at: indexPath.row)
            // Save the meals.
            saveClients()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else
            if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    private func saveClients() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(clientslist, toFile: Clients.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Clients successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save clients...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadClients() -> [Clients]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Clients.ArchiveURL.path) as? [Clients]
    }
}


    // MARK: - Table view data source


    

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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation




