import SwiftUI

func share(items: [Any]) -> Void {
    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController!.present(activityVC, animated: true, completion: nil)
}
