//
//  Movie.swift
//  projeto_filme
//
//  Created by matheusvb on 12/07/22.
//

import Foundation

struct Movie {
    let title: String
    let poster: String
    let backdrop: String
    let voteAverage: Float
    let releaseDate: String
    let overview: String
    let genres: [String]
    
    func getUpcomingDate() -> String {
        
        let startYear = releaseDate.index(releaseDate.startIndex, offsetBy: 2)
        let endYear = releaseDate.index(releaseDate.startIndex, offsetBy: 3)
        let rangeYear = startYear...endYear
        
        let year = Int(releaseDate[rangeYear])!
        
        let startMonth = releaseDate.index(releaseDate.startIndex, offsetBy: 5)
        let endMonth = releaseDate.index(releaseDate.startIndex, offsetBy: 6)
        let rangeMonth = startMonth...endMonth

        let month = Int(releaseDate[rangeMonth])!
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
        
        //switch(releaseDate)
        return "\(monthLabel) \(year)"
    }
}
