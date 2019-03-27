//
//  DetailViewController.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 24/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate{
    
    var id:Int = 0
    var comicsResult :[ResultsComicsAPi] = []
    var eventsResult :[ResultsEventsAPi] = []
    var storiesResult :[ResultsStoriesAPi] = []
    var seriesResult :[ResultsSeriesAPi] = []
    
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 3000
        view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        
        return view
    }()

    
    let boxView: UIView = {
        let vieW = UIView()
        vieW.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.6023158676, alpha: 1)
        return vieW
    }()
    
    
    let characterImage : UIImageView = {
        let character = UIImageView()
        character.image = UIImage(named: "Unknown")
        return character
    }()
    
    let characterLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Empty"
        return label
    }()
    
    
    let DescriptionTLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "DESCRIPTION"
        return label
    }()
    
    
    
    let DescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.text = "There is no Description"
        return label
    }()
        
    let ComicsTLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "COMICS"
        return label
    }()
    
    
    
    let NameComic1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionComic1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameComic2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionComic2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameComic3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionComic3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let storiesTLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.6367802899, blue: 0.8070749069, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "STORIES"
        return label
    }()
    
    let NameStorie1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionStories1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.text = "There are no Description"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameStorie2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionStories2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.text = "There are no Description"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameStorie3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionStories3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.text = "There are no Description"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    
    let eventsTLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "EVENTS"
        return label
    }()
    
    let NameEvents1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionEvents1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameEvents2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionEvents2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameEvents3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionEvents3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    
    
    let seriesTLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.backgroundColor = #colorLiteral(red: 0.6698070607, green: 0.5842461841, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "SERIES"
        return label
    }()
    
    let NameSeries1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionSeries1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameSeries2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionSeries2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let NameSeries3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        return label
    }()
    
    let descriptionSeries3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        setupScrollView()
        self.chamadaApiComics(id: id)
        self.eventsCallApi(id: id)
        self.StoriesCallApi(id: id)
        self.SeriesCallApi(id:id)
        self.setupInicialScreen()
    }
    
    
    
    func setupInicialScreen() {
        self.view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(BackButton))
        self.navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @objc func BackButton(){
        self.dismiss(animated: true, completion: nil)
    }

    func setupScrollView(){
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       
        
        scrollView.addSubview(boxView)
        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        boxView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        boxView.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant:10).isActive = true
        boxView.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        boxView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        boxView.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        characterImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        characterImage.topAnchor.constraint(equalTo: self.boxView.topAnchor, constant: 5).isActive = true
        characterImage.leadingAnchor.constraint(equalTo:self.boxView.leadingAnchor, constant: 5).isActive = true
        
        
        boxView.addSubview(characterLabel)
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.topAnchor.constraint(equalTo: self.characterImage.topAnchor,constant: 20).isActive = true
        characterLabel.leadingAnchor.constraint(equalTo: self.characterImage.trailingAnchor, constant: 6).isActive = true
        characterLabel.trailingAnchor.constraint(equalTo:self.boxView.trailingAnchor).isActive = true
        
        
      
        scrollView.addSubview(DescriptionTLabel)
        DescriptionTLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        DescriptionTLabel.textAlignment = .center
        DescriptionTLabel.translatesAutoresizingMaskIntoConstraints = false
        DescriptionTLabel.topAnchor.constraint(equalTo: boxView.bottomAnchor, constant: 10).isActive = true
        DescriptionTLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        DescriptionTLabel.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
      
        scrollView.addSubview(DescriptionLabel)
        DescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        DescriptionLabel.topAnchor.constraint(equalTo: DescriptionTLabel.bottomAnchor, constant: 10).isActive = true
        DescriptionLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        DescriptionLabel.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        scrollView.addSubview(ComicsTLabel)
        ComicsTLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ComicsTLabel.textAlignment = .center
        ComicsTLabel.translatesAutoresizingMaskIntoConstraints = false
        ComicsTLabel.topAnchor.constraint(equalTo: DescriptionLabel.bottomAnchor, constant: 10).isActive = true
        ComicsTLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        ComicsTLabel.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        
       
        scrollView.addSubview(NameComic1Label)
        NameComic1Label.translatesAutoresizingMaskIntoConstraints = false
        NameComic1Label.topAnchor.constraint(equalTo: ComicsTLabel.bottomAnchor, constant: 10).isActive = true
        NameComic1Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameComic1Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionComic1Label)
        descriptionComic1Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionComic1Label.topAnchor.constraint(equalTo: NameComic1Label.bottomAnchor, constant: 7).isActive = true
        descriptionComic1Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionComic1Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
       
        self.scrollView.addSubview(NameComic2Label)
        NameComic2Label.translatesAutoresizingMaskIntoConstraints = false
        NameComic2Label.topAnchor.constraint(equalTo: descriptionComic1Label.bottomAnchor, constant:10).isActive = true
        NameComic2Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameComic1Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor, constant:-10).isActive = true
        
        
        scrollView.addSubview(descriptionComic2Label)
        descriptionComic2Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionComic2Label.topAnchor.constraint(equalTo: NameComic2Label.bottomAnchor, constant: 7).isActive = true
        descriptionComic2Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionComic2Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
    
        self.scrollView.addSubview(NameComic3Label)
        NameComic3Label.translatesAutoresizingMaskIntoConstraints = false
        NameComic3Label.topAnchor.constraint(equalTo: descriptionComic2Label.bottomAnchor, constant:10).isActive = true
        NameComic3Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameComic3Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        scrollView.addSubview(descriptionComic3Label)
        descriptionComic3Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionComic3Label.topAnchor.constraint(equalTo: NameComic3Label.bottomAnchor, constant: 7).isActive = true
        descriptionComic3Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionComic3Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
    
        self.scrollView.addSubview(storiesTLabel)
        storiesTLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        storiesTLabel.textAlignment = .center
        storiesTLabel.translatesAutoresizingMaskIntoConstraints = false
        storiesTLabel.topAnchor.constraint(equalTo: descriptionComic3Label.bottomAnchor, constant: 10).isActive = true
        storiesTLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        storiesTLabel.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        self.scrollView.addSubview(NameStorie1Label)
        NameStorie1Label.translatesAutoresizingMaskIntoConstraints = false
        NameStorie1Label.topAnchor.constraint(equalTo: storiesTLabel.bottomAnchor, constant: 10).isActive = true
        NameStorie1Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameStorie1Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        scrollView.addSubview(descriptionStories1Label)
        descriptionStories1Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionStories1Label.topAnchor.constraint(equalTo: NameStorie1Label.bottomAnchor, constant: 7).isActive = true
        descriptionStories1Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionStories1Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
    
        self.scrollView.addSubview(NameStorie2Label)
        NameStorie2Label.translatesAutoresizingMaskIntoConstraints = false
        NameStorie2Label.topAnchor.constraint(equalTo: descriptionStories1Label.bottomAnchor, constant:10).isActive = true
        NameStorie2Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameStorie2Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor, constant:-10).isActive = true

        scrollView.addSubview(descriptionStories2Label)
        descriptionStories2Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionStories2Label.topAnchor.constraint(equalTo: NameStorie2Label.bottomAnchor, constant: 7).isActive = true
        descriptionStories2Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionStories2Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        self.scrollView.addSubview(NameStorie3Label)
        NameStorie3Label.translatesAutoresizingMaskIntoConstraints = false
        NameStorie3Label.topAnchor.constraint(equalTo: descriptionStories2Label.bottomAnchor, constant:10).isActive = true
        NameStorie3Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameStorie3Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionStories3Label)
        descriptionStories3Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionStories3Label.topAnchor.constraint(equalTo:NameStorie3Label.bottomAnchor, constant: 7).isActive = true
        descriptionStories3Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionStories3Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        self.scrollView.addSubview(eventsTLabel)
        eventsTLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        eventsTLabel.textAlignment = .center
        eventsTLabel.translatesAutoresizingMaskIntoConstraints = false
        eventsTLabel.topAnchor.constraint(equalTo: descriptionStories3Label.bottomAnchor, constant: 10).isActive = true
        eventsTLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        eventsTLabel.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        self.scrollView.addSubview(NameEvents1Label)
        NameEvents1Label.translatesAutoresizingMaskIntoConstraints = false
        NameEvents1Label.topAnchor.constraint(equalTo: eventsTLabel.bottomAnchor, constant: 10).isActive = true
        NameEvents1Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameEvents1Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionEvents1Label)
        descriptionEvents1Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionEvents1Label.topAnchor.constraint(equalTo: NameEvents1Label.bottomAnchor, constant: 7).isActive = true
        descriptionEvents1Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionEvents1Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        self.scrollView.addSubview(NameEvents2Label)
        NameEvents2Label.translatesAutoresizingMaskIntoConstraints = false
        NameEvents2Label.topAnchor.constraint(equalTo: descriptionEvents1Label.bottomAnchor, constant:10).isActive = true
        NameEvents2Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant:  10).isActive = true
        NameEvents2Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
    
        scrollView.addSubview(descriptionEvents2Label)
        descriptionEvents2Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionEvents2Label.topAnchor.constraint(equalTo: NameEvents2Label.bottomAnchor, constant: 7).isActive = true
        descriptionEvents2Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionEvents2Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        self.scrollView.addSubview(NameEvents3Label)
        NameEvents3Label.translatesAutoresizingMaskIntoConstraints = false
        NameEvents3Label.topAnchor.constraint(equalTo: descriptionEvents2Label.bottomAnchor, constant:10).isActive = true
        NameEvents3Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameEvents3Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionEvents3Label)
        descriptionEvents3Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionEvents3Label.topAnchor.constraint(equalTo: NameEvents3Label.bottomAnchor, constant: 7).isActive = true
        descriptionEvents3Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionEvents3Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        
        self.scrollView.addSubview(seriesTLabel)
        seriesTLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        seriesTLabel.textAlignment = .center
        seriesTLabel.translatesAutoresizingMaskIntoConstraints = false
        seriesTLabel.topAnchor.constraint(equalTo: descriptionEvents3Label.bottomAnchor, constant: 10).isActive = true
        seriesTLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        seriesTLabel.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
       
        
        self.scrollView.addSubview(NameSeries1Label)
        NameSeries1Label.translatesAutoresizingMaskIntoConstraints = false
        NameSeries1Label.topAnchor.constraint(equalTo: seriesTLabel.bottomAnchor, constant: 10).isActive = true
        NameSeries1Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameSeries1Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionSeries1Label)
        descriptionSeries1Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionSeries1Label.topAnchor.constraint(equalTo: NameSeries1Label.bottomAnchor, constant: 7).isActive = true
        descriptionSeries1Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionSeries1Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        self.scrollView.addSubview(NameSeries2Label)
        NameSeries2Label.translatesAutoresizingMaskIntoConstraints = false
        NameSeries2Label.topAnchor.constraint(equalTo: descriptionSeries1Label.bottomAnchor, constant: 10).isActive = true
        NameSeries2Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameSeries2Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionSeries2Label)
        descriptionSeries2Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionSeries2Label.topAnchor.constraint(equalTo: NameSeries2Label.bottomAnchor, constant: 7).isActive = true
        descriptionSeries2Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionSeries2Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        self.scrollView.addSubview(NameSeries3Label)
        NameSeries3Label.translatesAutoresizingMaskIntoConstraints = false
        NameSeries3Label.topAnchor.constraint(equalTo: descriptionSeries2Label.bottomAnchor, constant: 10).isActive = true
        NameSeries3Label.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        NameSeries3Label.trailingAnchor.constraint(equalTo:self.scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
        scrollView.addSubview(descriptionSeries3Label)
        descriptionSeries3Label.translatesAutoresizingMaskIntoConstraints = false
        descriptionSeries3Label.topAnchor.constraint(equalTo: NameSeries3Label.bottomAnchor, constant: 7).isActive = true
        descriptionSeries3Label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionSeries3Label.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        
    }
    
    
    
   
    func chamadaApiComics(id:Int){
        ComicsApi().ComicsCallApi(id: id) { (APIComics) in
            for item in APIComics.data.results {
                self.comicsResult.append(item)
            }
            DispatchQueue.main.async {
                if self.comicsResult.count >= 3{
                    self.NameComic1Label.text = "\(self.comicsResult[0].title):"
                    self.descriptionComic1Label.text  = self.comicsResult[0].description ?? ""
                    self.NameComic2Label.text = "\(self.comicsResult[1].title):"
                    self.descriptionComic2Label.text  = self.comicsResult[1].description ?? ""
                    self.NameComic3Label.text = "\(self.comicsResult[2].title):"
                    self.descriptionComic3Label.text  = self.comicsResult[2].description ?? ""
                }else if self.comicsResult.count == 2{
                    self.NameComic1Label.text = "\(self.comicsResult[0].title):"
                    self.descriptionComic1Label.text  = self.comicsResult[0].description ?? ""
                    self.NameComic2Label.text = "\(self.comicsResult[1].title):"
                    self.descriptionComic2Label.text  = self.comicsResult[2].description ?? ""
                }else if self.comicsResult.count == 1{
                    self.NameComic1Label.text = "\(self.comicsResult[0].title):"
                    self.descriptionComic1Label.text  = self.comicsResult[0].description ?? ""
                }else {
                     self.NameComic1Label.text = "There are no Comics"
                }
            }
        }
    }

    
    
    func eventsCallApi(id:Int){
        EventsApi().EventsCallApi(id: id) { (APIEvents) in
            for item in APIEvents.data.results {
                self.eventsResult.append(item)
            }
            DispatchQueue.main.async {
                if self.eventsResult.count >= 3{
                    self.NameEvents1Label.text = "\(self.eventsResult[0].title):"
                    self.descriptionEvents1Label.text =  self.eventsResult[0].description ?? ""
                    self.NameEvents2Label.text = "\(self.eventsResult[1].title):"
                    self.descriptionEvents2Label.text  = self.eventsResult[1].description ?? ""
                    self.NameEvents3Label.text = "\(self.eventsResult[2].title):"
                    self.descriptionEvents3Label.text  = self.eventsResult[2].description ?? ""
                }else if self.eventsResult.count == 2{
                    self.NameEvents1Label.text = "\(self.eventsResult[0].title):"
                    self.descriptionEvents1Label.text  = self.eventsResult[0].description ?? ""
                    self.NameEvents2Label.text = "\(self.eventsResult[1].title):"
                    self.descriptionEvents2Label.text  = self.eventsResult[1].description ?? ""
                }else if self.eventsResult.count == 1{
                    self.NameEvents1Label.text = "\(self.eventsResult[0].title):"
                    self.descriptionEvents1Label.text  = self.eventsResult[0].description ?? ""
                }else {
                    self.NameEvents1Label.text = "There are no Events"
                }
            }
        }
    }
    
    
    
    func StoriesCallApi(id:Int){
        StoriesApi().StoriesCallApi(id: id) { (APIStories) in
            for item in APIStories.data.results {
                self.storiesResult.append(item)
            }
            DispatchQueue.main.async {
                if self.storiesResult.count >= 3{
                    self.NameStorie1Label.text = "\(self.storiesResult[0].title):"
                    self.descriptionStories1Label.text =  self.storiesResult[0].description ?? ""
                    self.NameStorie2Label.text = "\(self.storiesResult[1].title):"
                    self.descriptionStories2Label.text  = self.storiesResult[1].description ?? ""
                    self.NameStorie3Label.text = "\(self.storiesResult[2].title):"
                    self.descriptionStories3Label.text  = self.storiesResult[2].description ?? ""
                }else if self.storiesResult.count == 2{
                    self.NameStorie1Label.text = "\(self.storiesResult[0].title):"
                    self.descriptionStories1Label.text  = self.storiesResult[0].description ?? ""
                    self.NameStorie2Label.text = "\(self.storiesResult[1].title):"
                    self.descriptionStories2Label.text  = self.storiesResult[1].description ?? ""
                }else if self.storiesResult.count == 1{
                    self.NameStorie1Label.text = "\(self.storiesResult[0].title):"
                    self.descriptionStories1Label.text  = self.storiesResult[0].description ?? ""
                }else {
                    self.NameStorie1Label.text = "There are no Stories"
                }
            }
        }
    }
    
    
    func SeriesCallApi(id:Int){
        
        SeriesApi().SeriesCallApi(id: id) { (APISeries) in
            for item in APISeries.data.results {
                self.seriesResult.append(item)
            }
            DispatchQueue.main.async {
                if self.seriesResult.count >= 3{
                    self.NameSeries1Label.text = "\(self.seriesResult[0].title):"
                    self.descriptionSeries1Label.text =  self.seriesResult[0].description ?? ""
                    self.NameSeries2Label.text = "\(self.seriesResult[1].title):"
                    self.descriptionSeries2Label.text =  self.seriesResult[1].description ?? ""
                    self.NameSeries3Label.text = "\(self.seriesResult[2].title):"
                    self.descriptionSeries3Label.text =  self.seriesResult[2].description ?? ""
                }else if self.seriesResult.count == 2{
                    self.NameSeries1Label.text = "\(self.seriesResult[0].title):"
                    self.descriptionSeries1Label.text =  self.seriesResult[0].description ?? ""
                    self.NameSeries2Label.text = "\(self.seriesResult[1].title):"
                    self.descriptionSeries2Label.text =  self.seriesResult[1].description ?? ""
                }else if self.seriesResult.count == 1{
                    self.NameSeries1Label.text = "\(self.seriesResult[0].title):"
                    self.descriptionSeries1Label.text =  self.seriesResult[0].description ?? ""
                }else {
                    self.NameSeries1Label.text = "There are no Series"
                }
            }
        }
    }
}
