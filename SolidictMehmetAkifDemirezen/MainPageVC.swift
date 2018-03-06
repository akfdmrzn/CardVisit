//
//  MainPageVC.swift
//  SolidictMehmetAkifDemirezen
//
//  Created by akif demirezen on 28/12/2017.
//  Copyright © 2017 demirezenOrganization. All rights reserved.
//

import UIKit
import Gemini
import SDWebImage



class MainPageVC: BaseController,UISearchBarDelegate{

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: GeminiCollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var isSearching = false
    var arrayOfSearch : [CardVisitModel] = []
    var detailOfCard : CardTableViewCell?
    
    fileprivate var responseOfCards = [CardVisitModel()]{
        didSet{
            self.tableView.reloadData()
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar(whichPage: "Cards")
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
        
        self.title = "Cards"
        self.indicatorShow(status: true)
        
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.delegate = self
        
        tableView?.register(CardTableViewCell.nib, forCellReuseIdentifier: CardTableViewCell.identifier)
        tableView?.delegate = self
        tableView?.dataSource = self

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? FilmDetailVC {
            destinationViewController.detailOfMovie = detailOfCard
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }
        else {
            isSearching = true
            arrayOfSearch = self.responseOfCards.filter({$0.name.contains(searchBar.text!)})
            tableView.reloadData()
        }
    }
    func setUpNavBar(whichPage : String){
        //For title in navigation bar
        self.navigationController?.view.backgroundColor = UIColor.black
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = whichPage
        
    }
}
//Tableview

extension MainPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.3
    }
    
    
}

extension MainPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell {
            if isSearching{
            
                cell.configureWithItem(item: arrayOfSearch,index : indexPath.section)
                cell.selectionStyle = .none
            }
            else{
                cell.configureWithItem(item: self.responseModelFilms.movies,index : indexPath.section)
                cell.selectionStyle = .none
            }
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      
        if isSearching{
        return self.arrayOfSearch.count
        }
        else{
        return responseOfCards.movies.count
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching{
            self.sendDataToDetail =  self.arrayOfSearch[indexPath.section]
            
        }
        else{
            self.sendDataToDetail =  self.responseOfCards[indexPath.section]
            
        }
        
        self.performSegue(withIdentifier: "segueGoToDetail", sender: nil)
        
        
    }
    
}
