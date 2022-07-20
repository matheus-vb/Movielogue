//
//  Movie.swift
//  projeto_filme
//
//  Created by matheusvb on 12/07/22.
//

import Foundation

struct Movie: Codable {
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Float
    let releaseDate: String?
    let overview: String
    let genres: [String]?
    
    func getUpcomingDate() -> String {
        
        guard let rDate = releaseDate else {
            return ""
        }
        
        // ?? "
        
        
        let startYear = rDate.index(rDate.startIndex, offsetBy: 2)
        let endYear = rDate.index(rDate.startIndex, offsetBy: 3)
        let rangeYear = startYear...endYear
        
        let year = Int(rDate[rangeYear])!
        
        
        let startMonth = rDate.index(rDate.startIndex, offsetBy: 5)
        let endMonth = rDate.index(rDate.startIndex, offsetBy: 6)
        let rangeMonth = startMonth...endMonth

        let month = Int(rDate[rangeMonth])!
        let monthLabel: String
        
        switch(month){
        case 1:
            monthLabel = "Jan"
        case 2:
            monthLabel = "Feb"
        case 3:
            monthLabel = "Mar"
        case 4:
            monthLabel = "Abr"
        case 5:
            monthLabel = "May"
        case 6:
            monthLabel = "Jun"
        case 7:
            monthLabel = "Jul"
        case 8:
            monthLabel = "Agu"
        case 9:
            monthLabel = "Sep"
        case 10:
            monthLabel = "Oct"
        case 11:
            monthLabel = "Nov"
        case 12:
            monthLabel = "Dez"
        default:
            monthLabel = ""
        }
    
        return "\(monthLabel) \(year)"
    }
}
