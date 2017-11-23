//
//  KategoriTableViewController.swift
//  AplikasiBerita
//
//  Created by Gw on 14/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class KategoriTableViewController: UITableViewController {
    
    var arrKategori = [[String : String]]() //array dictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/ServerBerita/index.php/DataGuru/getKategori").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["List Berita"].arrayObject {
                    self.arrKategori = resData as! [[String : String]]
                }
                if self.arrKategori.count > 0 {
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
        return arrKategori.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKategori", for: indexPath) as! KategoriTableViewCell
        
        // Configure Cell
        var serverid = arrKategori[indexPath.row]

        
        var id = serverid["id_kategori"]
        let kategori = serverid["nama_kategori"]
        
        //move to label
        cell.labelKategori.text = kategori
        
        return cell
    }
    
    //move to next layout
    //throwing kategori
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let IdStoryBoard = storyboard?.instantiateViewController(withIdentifier: "beritaKategori") as! BeritaKategoriTableViewController
        
        let id_kategori = arrKategori[indexPath.row]["id_kategori"]
//        variable to menampung id_kategori yg di lempar
        IdStoryBoard.nampungId = id_kategori!
        
        show(IdStoryBoard, sender: self)
        
    }
}
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = arrKategori[indexPath.row]
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
         let value = arrKategori[indexPath.row]
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
*/
