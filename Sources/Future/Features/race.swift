import Foundation

extension Thenable {
    
    // Alias for `whenAnyComplete`.
    @inlinable
    public static func race<T: Thenable>(_ futures: [T]) -> Future<T.Success, T.Failure> {
        return self.whenAnyComplete(futures)
    }
}
