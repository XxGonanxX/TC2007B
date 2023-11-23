//
//  CoordinatorView.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 21/10/23.
//

import SwiftUI
import FlowStacks

/// Main view to manage navigation flow on different presentations mode
struct CoordinatorView: View {
    /// Use this variable to set the main screen the app should start
    @State var routes: Routes<Screen> = [.root(.login)]

    enum Screen {
        case login
        case menu
        case profile
        
    }
    
    var body: some View {
        Router($routes) { screen, _ in
            /// For each screen setup the corresponding view
            switch screen {
            case .login:
                /// Setup page/view will be shown when referring this case
                LoginView(
                    /// The function `goMenu` is declared in LoginView, we use it to send the action to present a specific screen
                    /// Set up the route screen and the presenting mode for the flow desired
                    goMenu: { routes.presentCover(.menu) }
                )
            case .menu:
                MenuView(
                    goRoot: { routes.presentCover(.login) }
                )
           
            case .profile:
                PerfilView(goRoot: { routes.presentCover(.login) }
                           
                )
            }
        }
    }

    /// Return to main screen [eg. Logout] that returns to first screen in flow
    private func goRoot() {
        Task { @MainActor in
            await $routes.withDelaysIfUnsupported {
                $0.goBackToRoot()
            }
        }
    }
}

#Preview {
    CoordinatorView()
}
