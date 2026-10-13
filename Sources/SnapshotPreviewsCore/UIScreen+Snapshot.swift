#if canImport(UIKit) && !os(watchOS) && !os(visionOS)
import UIKit

extension UIScreen {
  /// The screen previews render on: the active window scene's. On a device with more than one built-in display,
  /// such as a foldable, that is the display in use, which `UIScreen.main` isn't always.
  static var snapshot: UIScreen {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let scene = scenes.first { $0.activationState == .foregroundActive } ?? scenes.first
    return scene?.screen ?? .main
  }
}
#endif
