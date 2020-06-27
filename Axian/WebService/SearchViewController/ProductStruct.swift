//
//  ProductStruct.swift
//  Axian
//
//  Created by Admin on 6/27/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

// MARK: - ProductStruct
struct ProductStruct: Codable {
    let status: Status?
    let pageType: String?
    let plpResults: PlpResults?
}

// MARK: - PlpResults
struct PlpResults: Codable {
    let label: String?
    let plpState: PlpState?
    let sortOptions: [SortOption]?
    let refinementGroups: [RefinementGroup]?
    let records: [Record]?
    let navigation: Navigation?
}

// MARK: - Navigation
struct Navigation: Codable {
    let current: [Current]?
}

// MARK: - Current
struct Current: Codable {
    let label, categoryID: String?

    enum CodingKeys: String, CodingKey {
        case label
        case categoryID = "categoryId"
    }
}

// MARK: - PlpState
struct PlpState: Codable {
    let categoryID, currentSortOption, currentFilters: String?
    let firstRecNum, lastRecNum, recsPerPage, totalNumRecs: Int?

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case currentSortOption, currentFilters, firstRecNum, lastRecNum, recsPerPage, totalNumRecs
    }
}

// MARK: - Record
struct Record: Codable {
    let productID, skuRepositoryID, productDisplayName, productType: String?
    let productRatingCount: Int?
    let productAvgRating: Double?
    let listPrice, minimumListPrice, maximumListPrice: Int?
    let promoPrice, minimumPromoPrice, maximumPromoPrice: Double?
    let isHybrid, isMarketPlace, isImportationProduct: Bool?
    let smImage, lgImage, xlImage: String?
    let groupType: String?
    let variantsColor: [VariantsColor]?
    let marketplaceSLMessage, marketplaceBTMessage: String?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case skuRepositoryID = "skuRepositoryId"
        case productDisplayName, productType, productRatingCount, productAvgRating, listPrice, minimumListPrice, maximumListPrice, promoPrice, minimumPromoPrice, maximumPromoPrice, isHybrid, isMarketPlace, isImportationProduct, smImage, lgImage, xlImage, groupType, variantsColor, marketplaceSLMessage, marketplaceBTMessage
    }
}

// MARK: - VariantsColor
struct VariantsColor: Codable {
    let colorName, colorHex, colorImageURL: String?
}

// MARK: - RefinementGroup
struct RefinementGroup: Codable {
    let name: String?
    let refinement: [Refinement]?
    let multiSelect: Bool?
    let dimensionName: String?
}

// MARK: - Refinement
struct Refinement: Codable {
    let count: Int?
    let label, refinementID: String?
    let selected: Bool?
    let colorHex: String?

    enum CodingKeys: String, CodingKey {
        case count, label
        case refinementID = "refinementId"
        case selected, colorHex
    }
}

// MARK: - SortOption
struct SortOption: Codable {
    let sortBy, label: String?
}

// MARK: - Status
struct Status: Codable {
    let status: String?
    let statusCode: Int?
}

