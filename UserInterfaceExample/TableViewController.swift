//
//  TableViewController.swift
//  UserInterfaceExample
//
//  Created by Nicholas Larsen on 9/1/21.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    lazy var imageModel:ImageModel = {
        return ImageModel.sharedInstance()
    }()
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return self.imageModel.numberOfImages()
        }
        else{
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            cell.textLabel!.text = self.imageModel.getImageName(for: indexPath.row)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            
            cell.textLabel?.text = "All Image"
            cell.detailTextLabel?.text = "Summary"
            
            return cell
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // If it casts properlly to MY ViewController class
//        if let vc = segue.destination as? ViewController{
//            if let name = sender as? UITableViewCell{
//                vc.diaplayImageName = cell.textLabel.text // ANOTHER IF LET
//            }
//        }
        if let vc = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text{
            vc.disaplayImageName = name
        }
    }
    

}
