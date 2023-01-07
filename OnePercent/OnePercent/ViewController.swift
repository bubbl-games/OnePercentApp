//
//  ViewController.swift
//  OnePercent
//
//  Created by Andrew Beers on 12/23/22.
//

import SwiftUI

import AuthenticationServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a new ASAuthorizationAppleIDButton and add it to the view
        let appleSignInButton = ASAuthorizationAppleIDButton()
        view.addSubview(appleSignInButton)

        // Set up the layout constraints for the button
        appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        appleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appleSignInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        // Set the action for the button
        appleSignInButton.addTarget(self, action: #selector(handleAppleSignIn), for: .touchUpInside)
    }

    @objc func handleAppleSignIn() {
        // Initiate the sign in flow using the requestAuthorization method
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension ViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        // The user has successfully signed in. You can retrieve the access token and other information about the user using the authorization object
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // An error occurred during the sign in process
        print("Sign in with Apple failed: \(error.localizedDescription)")
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // Return the current view controller's view as the presentation anchor for the sign in window
        return view.window!
    }
}
