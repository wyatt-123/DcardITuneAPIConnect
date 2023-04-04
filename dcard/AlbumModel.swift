

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let albumResult = try? JSONDecoder().decode(AlbumResult.self, from: jsonData)

import Foundation

//https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
//https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
//https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let albumResult = try? JSONDecoder().decode(AlbumResult.self, from: jsonData)

// MARK: - AlbumResult
struct AlbumResult: Codable {
    let resultCount: Double
    let results: [Album]
}

// MARK: - Result
struct Album: Codable {
    let wrapperType, collectionType: String
    let artistID, collectionID, amgArtistID: Double
    let artistName, collectionName, collectionCensoredName: String
    let artistViewURL, collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: Double
    let copyright, country, currency: String
    let releaseDate: String
    let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
}
