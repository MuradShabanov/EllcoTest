//
//  SecondViewController.swift
//  EllcoTest
//
//  Created by Мурад on 05.08.2020.
//  Copyright © 2020 Murad. All rights reserved.
//

import UIKit

class SecondViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let networkService = NetworkService()
    private var ticketModel = TicketModel()
    var section:Int?
    var preSection:Int?
    var expand:Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicatory()
        title = "Ваши тикеты"
        
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CellID")
        loadTicketData()
    }
    
    private func loadTicketData() {
        ticketModel.fetchTickets{ [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.collectionView.layoutIfNeeded()
                self?.stopActivityIndicator()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ticketModel.numberOfRowsInSection(section: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! CustomCell
        
        let ticket = ticketModel.cellRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(ticket)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.expand, let row = self.section, row == indexPath.row  {
            return CGSize(width: self.view.bounds.width, height: 300)
        }else{
            return CGSize(width: self.view.bounds.width, height: 200)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if (self.section != nil) {
            self.preSection = self.section
        }

        self.section = indexPath.row

        if self.preSection == self.section {
            self.preSection = nil
            self.section = nil
        }else if (self.preSection != nil) {
            self.expand = false
        }
        self.expand = !self.expand
        self.collectionView.reloadItems(at: collectionView.indexPathsForSelectedItems!)

    }
    
    let activityView = UIActivityIndicatorView(style: .large)
    
    func showActivityIndicatory() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityView.stopAnimating()
    }
}

