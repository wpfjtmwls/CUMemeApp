//
//  AcademicView.swift
//  CUMeme
//
//  Created by 毛悦 on 4/28/18.
//  Copyright © 2018 Yue mao. All rights reserved.
//

import Foundation
import UIKit

enum CampusCategories: String {
    case party,tuition,weather,others
}

class CampusView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    var pickerTextField: UITextField!
    var displayView: UICollectionView!
    var memesSelected: [UIImage]?
    var finishButton: UIButton!
    
    
    let options:[CampusCategories] = [.party,.tuition,.weather,.others]
    
    let partyMemes = [#imageLiteral(resourceName: "party1")]
    let tuitionMemes = [#imageLiteral(resourceName: "tuition1"),#imageLiteral(resourceName: "tuition2")]
    let weatherMemes = [#imageLiteral(resourceName: "weather1"),#imageLiteral(resourceName: "weather2"),#imageLiteral(resourceName: "weather3"),#imageLiteral(resourceName: "weather4"),#imageLiteral(resourceName: "weather5"),#imageLiteral(resourceName: "weather6"),#imageLiteral(resourceName: "weather7"),#imageLiteral(resourceName: "weather8"),#imageLiteral(resourceName: "weather9")]
    let otherMemes = [#imageLiteral(resourceName: "others")]
//    let mescellaneousMemes: [UIImage] = []
    
    let reuseCell = "reuseCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Academic Life"
        view.backgroundColor = .white
        
        memesSelected = []
        memesSelected?.append(contentsOf: partyMemes)
        memesSelected?.append(contentsOf: tuitionMemes)
        memesSelected?.append(contentsOf: weatherMemes)
        memesSelected?.append(contentsOf: otherMemes)
        
        pickerTextField = UITextField()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerTextField.inputView = pickerView
        pickerTextField.backgroundColor = UIColor(displayP3Red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        pickerTextField.translatesAutoresizingMaskIntoConstraints  = false
        
        finishButton = UIButton()
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize.height = 130
        layout.itemSize.width = 130
        
        displayView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        displayView.backgroundColor = UIColor(displayP3Red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        displayView.delegate = self
        displayView.dataSource = self
        displayView.translatesAutoresizingMaskIntoConstraints = false
        displayView.register(collectionViewCell.self, forCellWithReuseIdentifier: reuseCell)
        
        view.addSubview(pickerTextField)
        view.addSubview(displayView)
        
        setupConstraints()
    }
    
    //--------------------------------picker view----------------------------------------------------------------------------------
    // Sets number of columns in picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row].rawValue
    }
    
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = options[row].rawValue
        memesSelected = []
        switch options[row] {
        case .party: memesSelected?.append(contentsOf: partyMemes)
        case .tuition: memesSelected?.append(contentsOf: tuitionMemes)
        case .weather: memesSelected?.append(contentsOf: weatherMemes)
        case .others: memesSelected?.append(contentsOf: otherMemes)
        }
        
        displayView.reloadData()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @objc func finishButtonPressed(sender: UIButton){
        
    }
    
    //--------------------------------------collection view----------------------------------------------------------------------------------------

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCell, for: indexPath) as! collectionViewCell
        cell.imageView.image = memesSelected?[indexPath.item]
        cell.backgroundColor = .white

        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = DetailView()
        detailView.image = memesSelected?[indexPath.item]
        navigationController?.pushViewController(detailView, animated: true)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (memesSelected?.count)!
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pickerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pickerTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            pickerTextField.heightAnchor.constraint(equalToConstant: 30),

            ])
        
        NSLayoutConstraint.activate([
            displayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            displayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            displayView.topAnchor.constraint(equalTo: pickerTextField.bottomAnchor, constant: 30),
            displayView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
    }
    
}

