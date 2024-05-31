import Foundation
import LocalAuthentication

let arguments = CommandLine.arguments
var promptMessage = "authenticate to proceed"
if arguments.count > 1 {
    promptMessage = arguments[1]
}

let context = LAContext()
var error: NSError?

if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: promptMessage) { success, evaluationError in
        if success {
            print("Authentication was successful.")
        } else {
            print("Authentication failed.")
        }
        exit(success ? 0 : 1)
    }
} else {
    print("Touch ID is not available.")
    exit(1)
}

// Keep the run loop running to wait for the async authentication callback.
RunLoop.main.run()
