//
//  TableMarvelCharacter.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 23/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit
import CryptoSwift

class TableMarvelCharacter: UITableViewController, UISearchBarDelegate  {

    
    let publicKey  = "6d0586440891a03b22bdad697752fb2f"
    let privateKey = "e0215c13b509a960ac2ec6a7e4beff46c0067049"
    let ts         = NSDate().timeIntervalSince1970.description
    
    
    var comics :[ResultsComics] = []
    var comicsResult :[ResultsComicsAPi] = []
    var loadingData = false
    
    var offset = 0
    var limit  = 50
    

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInicial()
        configuraSearch()
        chamadaApi(limit: limit, offset: offset)
    }

  
    func configuraSearch() {
        self.searchController.searchBar.barStyle = .blackTranslucent
        self.searchController.searchBar.delegate = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    func setupInicial(){
        self.tableView.separatorColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        self.title = "Searching..."
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize:24, weight: .heavy)]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let character = self.comics[indexPath.row]
        
        cell.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.detailTextLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font =  UIFont.boldSystemFont(ofSize: 20.0)
        cell.textLabel?.text  = character.name
        cell.imageView?.image = UIImage(named: "Marvel-Black")
        let url = "\(character.thumbnail.path).\(character.thumbnail.extension)"
        cell.imageView?.download(from: url)
        
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "favorite2"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        starButton.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        starButton.addTarget(self, action: #selector(Favorite), for: .touchUpInside)
        cell.accessoryView = starButton
        return cell
    }
    
    @objc func Favorite(sender: UIButton){
    
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            sender.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
           
        } else {
        //    sender.isSelected = true
            sender.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            sender.tintColor = #colorLiteral(red: 0.9764705896, green: 0.9138895617, blue: 0, alpha: 1)
        }
    }
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
          let userSelected     = self.comics[indexPath.row]
          let newViewDetail    = DetailViewController()
          let titulo = "MARVEL"
          newViewDetail.title  = titulo.uppercased()
        
          if userSelected.description != ""{
             newViewDetail.DescriptionLabel.text = userSelected.description
          }
          newViewDetail.characterLabel.text = userSelected.name
          newViewDetail.id = userSelected.id
        
          let url = "\(userSelected.thumbnail.path).\(userSelected.thumbnail.extension)"
          newViewDetail.characterImage.download(from: url)
          self.present(UINavigationController(rootViewController:newViewDetail), animated: true,completion: nil)
    }
   
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }


    func chamadaApi(limit:Int,offset:Int){
        ServerApi().CallApi(limit: limit, offset: offset) { (MarvelApi) in
           self.comics = MarvelApi.data.results
           DispatchQueue.main.async {
             self.imageNavigation()
             self.loadingData = false
             self.limit  =  self.limit + 20
//             self.offset =  self.offset + 1
             self.tableView?.reloadData()
            }
        }
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        let scrollSize = scrollOffset + scrollViewHeight
        if scrollSize >= scrollContentSizeHeight - 200 {
            if !self.loadingData {
                self.loadingData = true
                self.chamadaApi(limit: limit, offset:offset)
            }
        }
    }
    
    
    func imageNavigation(){
        let image: UIImage = UIImage(named: "Marvel")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowRadius = 1
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
}
