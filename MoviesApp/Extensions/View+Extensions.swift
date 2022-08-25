//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Harry Lopez on 23/08/22.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView {self}
    }
    
}
