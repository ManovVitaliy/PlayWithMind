//
//  FootballTeamSchemeViewController.swift
//  CollectionViewFlowLayoutTest
//
//  Created by user on 5/21/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class FootballTeamSchemeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var schemeNameLabel: UILabel!
    
    private var currentScheme: Scheme!
    private var currentIndex: Int = 0
    
    // constants
    private let cellIdentifier = "FootballPlayerCell"
    
    private var schemesArray: [Scheme] = [Scheme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.setupSchemesArray()
    }
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "FootballPlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.cellIdentifier)
    }
    
    private func setupSchemesArray() {
        let scheme1 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 3,
                             fourthLine: 1,
                             fifthLine: 2).self
        let scheme2 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 3,
                             fourthLine: 3,
                             fifthLine: nil).self
        let scheme3 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 4,
                             fourthLine: 2,
                             fifthLine: nil).self
        let scheme4 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 1,
                             fourthLine: 4,
                             fifthLine: 1).self
        let scheme5 = Scheme(firstLine: 1,
                             secondLine: 3,
                             thirdLine: 4,
                             fourthLine: 3,
                             fifthLine: nil).self
        let scheme6 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 4,
                             fourthLine: 1,
                             fifthLine: 1).self
        let scheme7 = Scheme(firstLine: 1,
                             secondLine: 5,
                             thirdLine: 3,
                             fourthLine: 2,
                             fifthLine: nil).self
        let scheme8 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 3,
                             fourthLine: 2,
                             fifthLine: 1).self
        
        self.schemesArray.append(scheme1)
        self.schemesArray.append(scheme2)
        self.schemesArray.append(scheme3)
        self.schemesArray.append(scheme4)
        self.schemesArray.append(scheme5)
        self.schemesArray.append(scheme6)
        self.schemesArray.append(scheme7)
        self.schemesArray.append(scheme8)
        self.currentScheme = self.schemesArray[0]
        self.schemeNameLabel.text = self.currentScheme.schemeName
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfLines: Int = self.currentScheme.fifthLine != nil ? 5 : 4
        let height: CGFloat = self.collectionView.frame.height / (2 * CGFloat(numberOfLines))
        let size: CGSize = CGSize(width: height * 5 / 6, height: height)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let numberOfLines: Int = self.currentScheme.fifthLine != nil ? 5 : 4
        let width: CGFloat = self.collectionView.frame.height * 5 / (2 * CGFloat(numberOfLines) * 6)
        
        let cellWidth = width
        var cellCount: Int = 1
        let cellSpacing = 15.0
        
        switch section {
        case 0:
            if let firstL = currentScheme.firstLine {
                cellCount = firstL
            }
        case 1:
            if let secondL = currentScheme.secondLine {
                cellCount = secondL
            }
        case 2:
            if let thirdL = currentScheme.thirdLine {
                cellCount = thirdL
            }
        case 3:
            if let fourthL = currentScheme.fourthLine {
                cellCount = fourthL
            }
        case 4:
            if let fifthL = currentScheme.fifthLine {
                cellCount = fifthL
            }
        default:
            cellCount = 1
        }
        
        let totalCellWidth = Double(cellWidth) * Double(cellCount)
        let totalSpacingWidth = cellSpacing * (Double(cellCount) - 1)
        
        let leftInset = (self.collectionView.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (self.currentScheme.fifthLine != nil) {
            return 5
        } else {
            return 4
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var returnItemsValue: Int = 0
        switch section {
        case 0:
            if let firstL = currentScheme.firstLine {
                returnItemsValue = firstL
            }
        case 1:
            if let secondL = currentScheme.secondLine {
                returnItemsValue = secondL
            }
        case 2:
            if let thirdL = currentScheme.thirdLine {
                returnItemsValue = thirdL
            }
        case 3:
            if let fourthL = currentScheme.fourthLine {
                returnItemsValue = fourthL
            }
        case 4:
            if let fifthL = currentScheme.fifthLine {
                returnItemsValue = fifthL
            }
        default:
            returnItemsValue = 0
        }
        return returnItemsValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) 
        
        return cell
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        if (self.currentIndex == 0) {
            self.currentIndex = self.schemesArray.count - 1
            self.currentScheme = self.schemesArray[self.currentIndex]
        } else {
            self.currentIndex -= 1
            self.currentScheme = self.schemesArray[self.currentIndex]
        }
        self.schemeNameLabel.text = self.currentScheme.schemeName
        self.collectionView.reloadData()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if (self.currentIndex == self.schemesArray.count - 1) {
            self.currentIndex = 0
            self.currentScheme = self.schemesArray[0]
        } else {
            self.currentIndex += 1
            self.currentScheme = self.schemesArray[self.currentIndex]
        }
        self.schemeNameLabel.text = self.currentScheme.schemeName
        self.collectionView.reloadData()
    }
    
}
