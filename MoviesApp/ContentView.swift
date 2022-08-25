//
//  ContentView.swift
//  MoviesApp
//
//  Created by Harry Lopez on 17/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        
            .onAppear(perform: {
                HTTPClient().getMoviesBy(search: "batman"){ result in
                    
                    switch result {
                    case .success(let movies):
                        print(movies)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
