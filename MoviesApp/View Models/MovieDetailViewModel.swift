//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Harry Lopez on 24/08/22.
//

import Foundation

class MovieDetailViewModel : ObservableObject {
    
    private var movieDetail: MovieDetail?
    
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil){
        self.movieDetail = movieDetail
    }
    
    
    func getDetailsbyImdbId(imdbId:String){
        httpClient.getMovieDetailsBy(imdbId: imdbId, completion: { result in
            
            switch result{
            case .success(let details):
                DispatchQueue.main.async {
                    self.movieDetail = details
                    self.loadingState = .success
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .success
                }
            }
        })
    }
    
    
    var title: String  {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String  {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String  {
        self.movieDetail?.plot ?? ""
    }
    
    var rating : Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
    
    
    
    
}
