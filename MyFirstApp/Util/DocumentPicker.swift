import SwiftUI
import UniformTypeIdentifiers

struct DocumentPicker: UIViewControllerRepresentable {
    let forOpeningContentTypes: [UTType]
    let onPicked:  (_ urls: [URL]) -> Void
    
    public class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker

        init(parent: DocumentPicker) {
            self.parent = parent
        }

        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.onPicked(urls)
        }
    }
    
    init(forOpeningContentTypes: [UTType], onPicked: @escaping  (_ urls: [URL]) -> Void) {
        self.forOpeningContentTypes = forOpeningContentTypes
        self.onPicked = onPicked
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: forOpeningContentTypes)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ controller: UIDocumentPickerViewController, context: Context) {}
}
