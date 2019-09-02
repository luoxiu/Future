#if canImport(Combine)
import Combine

extension Future {
    
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public var publisher: Combine.Future<Success, Failure> {
        return .init(self.whenComplete)
    }
}

#endif
