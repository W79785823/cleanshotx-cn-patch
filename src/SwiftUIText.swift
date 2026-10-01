import AppKit
import SwiftUI

private let translations: [String: String] = {
    let path = Bundle.main.bundlePath + "/Contents/Resources/zh-Hans.lproj/Localizable.strings"
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
          let dictionary = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String] else {
        return [:]
    }
    return dictionary
}()

private func translatedText(_ text: String) -> String {
    translations[text] ?? text
}

@_silgen_name("CNTranslateSwiftUIText")
public func translateSwiftUIText<Content: StringProtocol>(_ content: Content) -> Text {
    Text(verbatim: translatedText(String(content)))
}

@_silgen_name("CNTranslateSwiftUIAttributedText")
public func translateSwiftUIAttributedText(_ content: AttributedString) -> Text {
    let plain = String(content.characters)
    if let replacement = translations[plain] {
        var attributes = content.runs.first?.attributes ?? AttributeContainer()
        attributes.link = nil
        var translated = AttributedString(replacement, attributes: attributes)
        for run in content.runs {
            let runText = String(content[run.range].characters)
            if let range = translated.range(of: translatedText(runText)) {
                translated[range].setAttributes(run.attributes)
            }
        }
        return Text(translated)
    }

    var translated = AttributedString()
    for run in content.runs {
        let runText = String(content[run.range].characters)
        translated += AttributedString(translatedText(runText), attributes: run.attributes)
    }
    return Text(translated)
}
