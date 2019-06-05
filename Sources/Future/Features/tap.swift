import Foundation

extension Thenable {
    
    @inlinable
    public func tap(_ body: @escaping (Success) -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete {
            if case .success(let s) = $0 {
                body(s)
            }
            p.complete($0)
        }
        
        return p.future
    }
    
    @inlinable
    public func tapError(_ body: @escaping (Failure) -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete {
            if case .failure(let e) = $0 {
                body(e)
            }
            p.complete($0)
        }
        
        return p.future
    }
}
