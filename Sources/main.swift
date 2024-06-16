/*
  tidcli - Touch ID Command Line
  by @singe

  tidcli is a simple utility to invoke Touch ID and produce an appropriate exit
  code for a successful or failed authentication.

  It's primary use is to add TouchID auth to shell scripts.
*/

import Darwin  // required for simple fputs stderr output
import Foundation
import LocalAuthentication

let arguments = CommandLine.arguments
var promptMessage = "authenticate to proceed"
if arguments.count > 1 {
  // Limit potential input to 100 characters
  promptMessage = String(arguments[1].prefix(100))
}

let context = LAContext()
var error: NSError?

if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
  context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: promptMessage) {
    success, evaluationError in
    if success {
      fputs("Authentication was successful.\n", stderr)
    } else {
      fputs("Authentication failed.\n", stderr)
    }
    exit(success ? 0 : 1)
  }
} else {
  fputs("Touch ID is not available.\n", stderr)
  exit(1)
}

// Keep the run loop running to wait for the async authentication callback.
RunLoop.main.run()
