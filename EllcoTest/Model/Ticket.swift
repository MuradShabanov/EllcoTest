//
//  Ticket.swift
//  EllcoTest
//
//  Created by Мурад on 06.08.2020.
//  Copyright © 2020 Murad. All rights reserved.
//

import Foundation

struct Tickets: Codable {
    let bug_trackers: [Ticket]
}

struct Ticket: Codable {
    let description: String
    let name: String
    let createdAt: DateOf
    let sender: Sender
    let status: Status
    let version: String
}

struct Sender: Codable {
    let id: Int
    let username: String
}

struct DateOf: Codable {
    let offset: Int
    let timestamp: Int
}

struct Status: Codable {
    let description: String
    let badge: String
    let id: Int
    let tooltip: String
}

