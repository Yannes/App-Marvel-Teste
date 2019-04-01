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


    var comics: [ResultsComics] = []
    var comics2: [ResultsComics] = []
    var itemsSource: [Any] = []
     var itemsSource2: [Any] = []
    var loadingData = false
    var offset = 0

    

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsSource.append(ResultsComicsLoading())
        setupInicial()
        configuraSearch()
    }
    
  
 
    func configuraSearch() {
        self.searchController.searchBar.barStyle = .blackTranslucent
        self.searchController.searchBar.delegate = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
    }
    
    func setupInicial(){
        self.tableView.separatorColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
        tableView.register(CharacterLoadingCell.self, forCellReuseIdentifier: CharacterLoadingCell.identifier)
        
        self.title = "Searching..."
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize:24, weight: .heavy)]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = itemsSource[indexPath.row]
        if model is ResultsComicsLoading {
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterLoadingCell.identifier, for: indexPath) as! CharacterLoadingCell
            cell.indicatorView.startAnimating()
            return cell
        }
        //  Carregar celula
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as! CharacterCell
        cell.model = model as? ResultsComics
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let model = itemsSource[indexPath.row] as? ResultsComics {
            let newViewDetail    = DetailViewController()
            let titulo = "MARVEL"
            newViewDetail.title  = titulo.uppercased()
            if model.description != ""{
                newViewDetail.DescriptionLabel.text = model.description
            }
            newViewDetail.characterLabel.text = model.name
            newViewDetail.id = model.id
            let url = "\(model.thumbnail.path).\(model.thumbnail.extension)"
            newViewDetail.characterImage.download(from: url)
            self.present(UINavigationController(rootViewController:newViewDetail), animated: true,completion: nil)
        }
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func chamadaApi(offset:Int){
        ServerApi().CallApi(offset: offset) { (MarvelApi) in
            self.comics.append(contentsOf: MarvelApi.data.results)
            self.itemsSource = self.comics + [ResultsComicsLoading()]
           DispatchQueue.main.async {
            self.imageNavigation()
            self.offset = self.offset + 1
            self.loadingData = false
            self.tableView.reloadData()
            }
        }
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        let scrollSize = scrollOffset + scrollViewHeight
        if scrollSize >= scrollContentSizeHeight - 50 {
            if !self.loadingData {
                self.loadingData = true
                self.chamadaApi(offset:offset)
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
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let texto = searchBar.text {

            if texto.isEmpty {
                itemsSource = comics + [ResultsComicsLoading()]
            } else {
                self.comics2.removeAll()
                SearchApi().SearchApi(name: texto) { (MarvelApi) in
                    self.comics2.append(contentsOf: MarvelApi.data.results)
                    DispatchQueue.main.async {
                     self.itemsSource2 = self.comics2
                     self.itemsSource = self.itemsSource2
                     self.loadingData = true
                     self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.loadingData = false
        itemsSource = comics + [ResultsComicsLoading()]
         tableView.reloadData()
    }
    
   
}
