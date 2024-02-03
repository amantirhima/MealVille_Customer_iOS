//
//  CompaniesModel.swift
//  InterviewTask
//
//  Created by Amandeep tirhima on 06/06/22.
//

import Foundation

import Foundation

// MARK: - Welcome
struct CompaniesModel: Codable {
    let statusCode: Int
    let message: String
    let hasData: Bool
    let data: [Companies]

    enum CodingKeys: String, CodingKey {
        case statusCode, message
        case hasData = "has_data"
        case data
    }
}

// MARK: - Datum
struct Companies: Codable {
    let id: Int
    let name, plotNumber: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case plotNumber = "plot_number"
    }
}
