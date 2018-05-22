//
//  FootballTeamSchemeViewController.swift
//  CollectionViewFlowLayoutTest
//
//  Created by user on 5/21/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class FootballTeamSchemeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var homeTeamCollectionView: UICollectionView!
    @IBOutlet weak var awayTeamCollectionView: UICollectionView!
    @IBOutlet weak var homeTeamSchemeNameLabel: UILabel!
    @IBOutlet weak var awayTeamSchemeNameLabel: UILabel!
    
    private var homeTeamCurrentScheme: Scheme!
    private var homeTeamCurrentIndex: Int = 0
    
    private var awayTeamCurrentScheme: Scheme!
    private var awayTeamCurrentIndex: Int = 0
    
    // constants
    private let cellIdentifier = "FootballPlayerCell"
    private let navigationBarTitle = "Main Screen"
    private let sizeKoeff: CGFloat = 0.99
    
    private var homeTeamSchemesArray: [Scheme] = [Scheme]()
    private var awayTeamSchemesArray: [Scheme] = [Scheme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupCollectionView()
        self.setupSchemesArray()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
        self.navigationItem.title = navigationBarTitle
    }
    
    private func setupCollectionView() {
        self.homeTeamCollectionView.delegate = self
        self.homeTeamCollectionView.dataSource = self
        self.homeTeamCollectionView.register(UINib(nibName: "FootballPlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.cellIdentifier)
        
        self.awayTeamCollectionView.delegate = self
        self.awayTeamCollectionView.dataSource = self
        self.awayTeamCollectionView.register(UINib(nibName: "FootballPlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.cellIdentifier)
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
        
        self.homeTeamSchemesArray.append(scheme1)
        self.homeTeamSchemesArray.append(scheme2)
        self.homeTeamSchemesArray.append(scheme3)
        self.homeTeamSchemesArray.append(scheme4)
        self.homeTeamSchemesArray.append(scheme5)
        self.homeTeamSchemesArray.append(scheme6)
        self.homeTeamSchemesArray.append(scheme7)
        self.homeTeamSchemesArray.append(scheme8)
        self.homeTeamCurrentScheme = self.homeTeamSchemesArray[homeTeamCurrentIndex]
        self.homeTeamSchemeNameLabel.text = self.homeTeamCurrentScheme.schemeName
        
        self.awayTeamSchemesArray.append(scheme1)
        self.awayTeamSchemesArray.append(scheme2)
        self.awayTeamSchemesArray.append(scheme3)
        self.awayTeamSchemesArray.append(scheme4)
        self.awayTeamSchemesArray.append(scheme5)
        self.awayTeamSchemesArray.append(scheme6)
        self.awayTeamSchemesArray.append(scheme7)
        self.awayTeamSchemesArray.append(scheme8)
        self.awayTeamCurrentScheme = self.awayTeamSchemesArray[awayTeamCurrentIndex]
        self.awayTeamSchemeNameLabel.text = self.awayTeamCurrentScheme.schemeName
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == self.homeTeamCollectionView) {
            let numberOfLines: Int = self.homeTeamCurrentScheme.fifthLine != nil ? 5 : 4
            let height: CGFloat = self.homeTeamCollectionView.frame.height / (CGFloat(numberOfLines))
            let size: CGSize = CGSize(width: sizeKoeff * height * 5 / 6, height: sizeKoeff * height)
            
            return size
        } else {
            let numberOfLines: Int = self.awayTeamCurrentScheme.fifthLine != nil ? 5 : 4
            let height: CGFloat = self.awayTeamCollectionView.frame.height / (CGFloat(numberOfLines))
            let size: CGSize = CGSize(width: sizeKoeff * height * 5 / 6, height: sizeKoeff * height)
            
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var currentScheme: Scheme = self.homeTeamCurrentScheme
        if (collectionView == self.awayTeamCollectionView) {
            currentScheme = self.awayTeamCurrentScheme
        }
        
        let numberOfLines: Int = currentScheme.fifthLine != nil ? 5 : 4
        let width: CGFloat = self.homeTeamCollectionView.frame.height * 5 / (CGFloat(numberOfLines) * 6)
        
        let cellWidth = width
        var cellCount: Int = 1
        let cellSpacing = 10.0
        
        if (collectionView == self.homeTeamCollectionView) {
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
        } else {
            switch section {
            case 0:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.fifthLine! : currentScheme.fourthLine!
            case 1:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.fourthLine! : currentScheme.thirdLine!
            case 2:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.thirdLine! : currentScheme.secondLine!
            case 3:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.secondLine! : currentScheme.firstLine!
            case 4:
                if (currentScheme.fifthLine != nil) {
                    cellCount = currentScheme.firstLine!
                }
            default:
                cellCount = 1
            }
        }
        
        let totalCellWidth = Double(cellWidth) * Double(cellCount)
        let totalSpacingWidth = cellSpacing * (Double(cellCount) - 1)
        
        let leftInset = (self.homeTeamCollectionView!.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, leftInset * sizeKoeff, 0, rightInset * sizeKoeff)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == self.homeTeamCurrentScheme) {
            if (self.homeTeamCurrentScheme.fifthLine != nil) {
                return 5
            } else {
                return 4
            }
        } else {
            if (self.awayTeamCurrentScheme.fifthLine != nil) {
                return 5
            } else {
                return 4
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var returnItemsValue: Int = 0
        
        var currentScheme: Scheme = self.homeTeamCurrentScheme
        if (collectionView == self.awayTeamCollectionView) {
            currentScheme = self.awayTeamCurrentScheme
        }
        
        if (collectionView == self.homeTeamCollectionView) {
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
        } else {
            switch section {
            case 0:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.fifthLine! : currentScheme.fourthLine!
            case 1:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.fourthLine! : currentScheme.thirdLine!
            case 2:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.thirdLine! : currentScheme.secondLine!
            case 3:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.secondLine! : currentScheme.firstLine!
            case 4:
                if (currentScheme.fifthLine != nil) {
                    returnItemsValue = currentScheme.firstLine!
                }
            default:
                returnItemsValue = 1
            }
        }
        
        return returnItemsValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.homeTeamCollectionView) {
            let cell = self.homeTeamCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
            
            return cell
        } else {
            let cell = self.awayTeamCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
            
            return cell
        }
    }

    @IBAction func backButtonHomeTeamTapped(_ sender: Any) {
        if (self.homeTeamCurrentIndex == 0) {
            self.homeTeamCurrentIndex = self.homeTeamSchemesArray.count - 1
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        } else {
            self.homeTeamCurrentIndex -= 1
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        }
        self.homeTeamSchemeNameLabel.text = self.homeTeamCurrentScheme.schemeName
        self.homeTeamCollectionView.reloadData()
    }
    
    @IBAction func nextButtonHomeTeamTapped(_ sender: Any) {
        if (self.homeTeamCurrentIndex == self.homeTeamSchemesArray.count - 1) {
            self.homeTeamCurrentIndex = 0
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        } else {
            self.homeTeamCurrentIndex += 1
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        }
        self.homeTeamSchemeNameLabel.text = self.homeTeamCurrentScheme.schemeName
        self.homeTeamCollectionView.reloadData()
    }
    
    @IBAction func backButtonAwayTeamTapped(_ sender: Any) {
        if (self.awayTeamCurrentIndex == 0) {
            self.awayTeamCurrentIndex = self.awayTeamSchemesArray.count - 1
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        } else {
            self.awayTeamCurrentIndex -= 1
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        }
        self.awayTeamSchemeNameLabel.text = self.awayTeamCurrentScheme.schemeName
        self.awayTeamCollectionView.reloadData()
    }
    
    @IBAction func nextButtonAwayTeamTapped(_ sender: Any) {
        if (self.awayTeamCurrentIndex == self.awayTeamSchemesArray.count - 1) {
            self.awayTeamCurrentIndex = 0
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        } else {
            self.awayTeamCurrentIndex += 1
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        }
        self.awayTeamSchemeNameLabel.text = self.awayTeamCurrentScheme.schemeName
        self.awayTeamCollectionView.reloadData()
    }
    
    @IBAction func homeTeamChangeTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ChooseTeamViewController")
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func awayTeamChangeTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ChooseTeamViewController")
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}