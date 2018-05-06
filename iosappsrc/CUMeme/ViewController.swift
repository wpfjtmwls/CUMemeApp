//
//  ViewController.swift
//  CUMeme
//
//  Created by 毛悦 on 4/28/18.
//  Copyright © 2018 Yue mao. All rights reserved.
//
//
import UIKit

class ViewController: UIViewController {
    
    
    var pageTitle: UILabel!
    var campusButton: UIButton!
    var academicButton: UIButton!
    var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        pageTitle = UILabel()
        pageTitle.text = "CUMEME"
        pageTitle.font = UIFont.boldSystemFont(ofSize: 40)
        pageTitle.textColor = .red
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        
        campusButton = UIButton()
        campusButton.setTitle("Big Red Campus Life", for: .normal)
        campusButton.setTitleColor(.black, for: .normal)
        campusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        campusButton.addTarget(self, action: #selector(campusButtonPressed), for: .touchUpInside)
        campusButton.translatesAutoresizingMaskIntoConstraints = false
        
        academicButton = UIButton()
        academicButton.setTitle("Big Red Academic Life", for: .normal)
        academicButton.setTitleColor(.black, for: .normal)
        academicButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        academicButton.addTarget(self, action: #selector(academicButtonPressed), for: .touchUpInside)
        academicButton.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton = UIButton()
        searchButton.setTitle("Search Your Favorite Memes!", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageTitle)
        view.addSubview(academicButton)
        view.addSubview(campusButton)
        view.addSubview(searchButton)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            ])
        
        NSLayoutConstraint.activate([
            campusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            campusButton.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 60)
            ])
        
        NSLayoutConstraint.activate([
            academicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            academicButton.topAnchor.constraint(equalTo: campusButton.bottomAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: academicButton.bottomAnchor, constant: 30)
            ])
    }
    
    @objc func academicButtonPressed(sender: UIButton) {
        let academicView = AcademicView()
        //        academicView.delegate = self
        navigationController?.pushViewController(academicView, animated: true)

    }
    
    @objc func campusButtonPressed(sender: UIButton) {
        let campusView = CampusView()
        //        academicView.delegate = self
        navigationController?.pushViewController(campusView, animated: true)

    }
    
    @objc func searchButtonPressed(sender: UIButton) {
        print("search button pressed")
        let searchView = searchViewController()
//                searchView.delegate = self
        navigationController?.pushViewController(searchView, animated: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


