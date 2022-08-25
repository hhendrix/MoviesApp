//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Harry Lopez on 23/08/22.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM : MovieListViewModel
    @State private var movieName : String = ""
    
    init(){
        self.movieListVM = MovieListViewModel()
        //self.movieListVM.searchByName("batman")
    }
    
    var body: some View {
        VStack{
            
            TextField("Search", text: $movieName,
                      onEditingChanged: { _ in }, onCommit: {
                print(self.movieName)
                self.movieListVM.searchByName(self.movieName)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
                
            
            Spacer()
            
                .navigationTitle("Movies")
            
            if self.movieListVM.loadingState == .success {
                MoviesListView(movies: self.movieListVM.movies)
            }else if self.movieListVM.loadingState == .failed {
                FailedView()
            }else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
            
            
                
        }.padding()
        .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
