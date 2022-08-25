//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Harry Lopez on 23/08/22.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase : ObservableObject {
    @Published var loadingState : LoadingState = .none
    
}
