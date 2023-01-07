//
//  AuthenticationView.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {

    @State var userName = ""
    @StateObject private var viewModel = AuthenticationViewModel()

    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.2)
                .ignoresSafeArea(.all, edges: .all)

            VStack(spacing: 20) {
                welcome()
                userNameField()
                findMyWeatherInfo()
            }
            .padding()
        }
    }

    private func welcome() -> some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Text("Welcome to BioWeather")
                .font(.title2)
        }
        .padding(.bottom, 30)
    }

    private func userNameField() -> some View {
        HStack {
            Image(systemName: "person.crop.circle")
            TextField("Username", text: $userName)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal, 20)
    }

    private func findMyWeatherInfo() -> some View {
        Button(action: viewModel.authenticateUser, label: {
            Text("Find My Weather Info")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
        })
        .padding(.horizontal, 50)
        .padding(.top, 20)
        .buttonStyle(.borderedProminent)
        .disabled(userName.isEmpty)
    }
}

#if DEBUG
struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
#endif
