//
//  ChallengeViewController.swift
//  Core Data Challenge
//
//  Created by Andrew W Stoll on 12/1/17.
//  Copyright © 2017 Andrew W Stoll. All rights reserved.
//

import UIKit
import CoreData

class ChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var challengeTableView: UITableView!
    var websites = [Website]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewWebsite(_ sender: Any) {
        performSegue(withIdentifier: "showWebsite", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = challengeTableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)
        let website = websites[indexPath.row]
        
        cell.textLabel?.text = website.name
        cell.detailTextLabel?.text = website.url
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showWebsite", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Website> = Website.fetchRequest()
        
        do{
            websites = try managedContext.fetch(fetchRequest)
            
            challengeTableView.reloadData()
        }catch{
            print("Fetch could not be completed.")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SingleSiteViewController,
            let selectedRow = self.challengeTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.existingWebsite = websites[selectedRow]
    }

}
