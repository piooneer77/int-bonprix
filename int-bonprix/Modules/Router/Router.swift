//
//  Router.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import SwiftUI
import Combine

final class Router: ObservableObject {
    
    enum Route: Hashable {
        case productList
        case productDetails(productId: Int)
    }
    
    @Published var path: NavigationPath = NavigationPath()
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .productList:
            let viewModel = ProductListViewModel(productService: ProductService.shared,
                                                 imageService: ImageService.shared)
            ProductListView(viewModel: viewModel)
        case .productDetails(let productId):
            let viewModel = ProductDetailsViewModel(productId: productId,
                                                    productService: ProductService.shared,
                                                    imageService: ImageService.shared,
                                                    favouriteService: FavouriteService.shared)
            ProductDetailsView(viewModel: viewModel)
        }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
}
