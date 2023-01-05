//
//  AppDelegate.swift
//  MoneyManager
//
//  Created by Roman on 07.01.2021.
//

// import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn
import FacebookLogin
import AuthenticationServices

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    // Firebase setup
    FirebaseApp.configure()
    print("provider1= \(Auth.auth().currentUser?.providerData.first?.providerID)")
    // Facebook sign in signIn setup
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

      // Retrieve user ID saved in UserDefaults
    if let userID = UserDefaults.standard.string(forKey: "appleAuthorizedUserIdKey") {

      // Check Apple ID credential state
      ASAuthorizationAppleIDProvider().getCredentialState(forUserID: userID, completion: { [unowned self]
        credentialState, error in

        switch(credentialState) {
        case .authorized:
          break
        case .notFound,
            .transferred,
            .revoked:
            // Perform sign out
          UserRepository.shared.logOut()
          break
        @unknown default:
          break
        }
      })
    }
    return true
  }

  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    ApplicationDelegate.shared.application(
      application,
      open: url,
      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
      annotation: options[UIApplication.OpenURLOptionsKey.annotation]
    )


    let handled = GIDSignIn.sharedInstance.handle(url)
    if handled {
      return true
    }

    return false
  }


}
