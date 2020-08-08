//
//  TicketModel.swift
//  EllcoTest
//
//  Created by Мурад on 07.08.2020.
//  Copyright © 2020 Murad. All rights reserved.
//

import Foundation

class TicketModel {
    
    private var networkService = NetworkService()
    private var tickets = [Ticket]()
    
    func fetchTickets(completion: @escaping () -> ()) {
        
        networkService.getData { [weak self] (result) in
            switch result {
            case .success(let listOF):
                self?.tickets = listOF.bug_trackers
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if tickets.count != 0 {
            return tickets.count
        }
        return 0
    }
    
    func cellRowAt(indexPath: IndexPath) -> Ticket {
        return tickets[indexPath.row]
    }
}


