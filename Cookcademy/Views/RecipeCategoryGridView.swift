//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Ben Stone on 4/19/21.
//

import SwiftUI

struct RecipeCateogryGrid: View {
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(
                            destination: RecipesListView(),
                            label: {
                                CategoryView(category: category)
                            })
                    }
                })
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue.capitalized)
                .font(.title)
        }
    }
}

struct RecipeCateogryGrid_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCateogryGrid().preferredColorScheme(.dark)
        RecipeCateogryGrid().preferredColorScheme(.light)
    }
}
