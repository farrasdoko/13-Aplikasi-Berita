//
//  TableViewController.swift
//  AplikasiBerita
//
//  Created by Gw on 14/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

//import library
import Alamofire
import SwiftyJSON


class TableViewController: UITableViewController {
    var arrRes = [[String:AnyObject]]() //array dictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/ServerBerita1/index.php/DataGuru/getberita").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["List Berita"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrRes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // Configure Cell
        var dict = arrRes[indexPath.row]
        cell.labelber.text = dict["id_berita"] as? String
        cell.isber.text = dict["isi_berita"] as? String
//        cell.pot.image = dict["gambar"] as? String
        cell.labelCat.text = dict["id_cat"] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = arrRes[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
    /*
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arrRes[indexPath.row]
                controller.passname = value["name"] as! String
                controller.passid = value["id"] as! String
            }*/
            //                controller.passaddress = value["address"] as! String
            //                controller.passhome = value["home"] as! String
            //                controller.passemail = value["email"] as! String
            //                controller.passgender = value["gender"] as! String
            //                controller.passmobile = value["mobile"] as! String
            //                controller.passoffice = value["office"] as! String
        }
        
        
    }

