//
//  NetworkManager.swift
//  api_test
//
//  Created by Arjun Doel on 14/01/2022.
//

import Combine
import SwiftUI

class NetworkManager: BindableObject {
  var didChange = PassthroughSubject<NetworkManager, Never>()
  var movies = MealList(results: []){
    didSet {
      didChange.send(self)
    }
  }
  
  init() {
    guard let url = URL(string: "www.themealdb.com/api/json/v1/1/search.php?s=Chicken") else { return }
    URLSession.shared.dataTask(with: url){ (data, _, _) in
      guard let data = data else { return }
      let movies = try! JSONDecoder().decode(MealList.self, from: data)
      DispatchQueue.main.async {
        self.movies = movies
      }
    }.resume()
  }
}
