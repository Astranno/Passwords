import Combine

public enum PasswordManagerClientError: Error {
    case accessibilityNotAllowed
    case scriptNotFound
}

public struct PasswordManagerClient {
    public let showPasswordManager: () -> AnyPublisher<Bool, Error>
    
    public init(
        showPasswordManager: @escaping () -> AnyPublisher<Bool, Error>
    ) {
        self.showPasswordManager = showPasswordManager
    }
}
