//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Harry Lopez on 23/08/22.
//

import Foundation

extension String {
    
    func trimmedAndEScapped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
        
    }
    
}
