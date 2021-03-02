import AXSwift
import Combine
import Foundation

public extension PasswordManagerClient {
    static let live = Self(
        showPasswordManager: {
            let passthroughSubject = PassthroughSubject<Bool, Error>()

            if !UIElement.isProcessTrusted(withPrompt: true) {
                passthroughSubject.send(completion: .failure(PasswordManagerClientError.accessibilityNotAllowed))
            }
            
            if let file = Bundle.module.url(forResource: "script", withExtension: "applescript") {
                do {
                    let task = try NSUserScriptTask(url: file.absoluteURL)
                    task.execute { error in
                        if let error = error {
                            passthroughSubject.send(completion: .failure(error))
                        } else {
                            passthroughSubject.send(true)
                            passthroughSubject.send(completion: .finished)
                        }
                    }
                } catch {
                    passthroughSubject.send(completion: .failure(error))
                }
            } else {
                passthroughSubject.send(completion: .failure(PasswordManagerClientError.scriptNotFound))
            }
            
            return passthroughSubject
                .eraseToAnyPublisher()
        }
    )
}
