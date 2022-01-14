//
//  RecipeModel.swift
//  api_test
//
//  Created by Arjun Doel on 14/01/2022.
//

import Foundation

struct Meal: Decodable {
    var idMeal: String
    var strMeal: String
    var strCategory: String
    var strArea: String
}
