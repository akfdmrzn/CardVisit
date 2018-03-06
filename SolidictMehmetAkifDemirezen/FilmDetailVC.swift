//
//  FilmDetailVC.swift
//  SolidictMehmetAkifDemirezen
//
//  Created by akif demirezen on 28/12/2017.
//  Copyright © 2017 demirezenOrganization. All rights reserved.
//

import UIKit

class FilmDetailVC: UIViewController {
  
  
    
    var detailOfCard = CardVisitModel()
    let user = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar(whichPage: "Business Card")
        
        
        
        
    }
        func setUpNavBar(whichPage : String){
        //For title in navigation bar
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = whichPage
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
