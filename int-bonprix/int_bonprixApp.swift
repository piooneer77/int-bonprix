//
//  int_bonprixApp.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import SwiftUI

@main
struct int_bonprixApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {
                let viewModel = ProductListViewModel(productService: ProductService.shared,
                                                     imageService: ImageService.shared)
                ProductListView(viewModel: viewModel)
            }
        }
    }
}
