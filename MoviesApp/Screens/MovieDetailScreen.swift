//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Harry Lopez on 24/08/22.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId : String
    @ObservedObject var movieDetailVm = MovieDetailViewModel()
    
    var body: some View {
        VStack{
            if movieDetailVm.loadingState == .loading {
                LoadingView()
            }else if movieDetailVm.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVm)
            }else if movieDetailVm.loadingState == .failed {
                FailedView()
            }
        }.onAppear{
            self.movieDetailVm.getDetailsbyImdbId(imdbId: self.imdbId)
        }
    }
}


