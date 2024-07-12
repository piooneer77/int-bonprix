//
//  RouterView.swift
//  int-bonprix
//
//  Created by Halawany on 10.07.24.
//

import SwiftUI

struct RouterView<Content: View>: View {
    
    @StateObject var router: Router = Router()
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) { route in
                    router.view(for: route)
                }
        }
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarItems(leading: backButton)
        .onAppear {
            configureNavigationBarAppearance()
        }
        .environmentObject(router)
    }
    
    private var backButton: some View {
            Button(action: {
                router.navigateBack()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        }
    
    private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.clear]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
    }
    
}
