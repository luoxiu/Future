import Foundation

extension Thenable {
    
    @inlinable
    public static func whenAnyComplete<S: Sequence>(_ thenables: S) -> Future<S.Element.Success, S.Element.Failure> where S.Element: Thenable {
        let p = Promise<S.Element.Success, S.Element.Failure>()
        for t in thenables {
            t.pipe(to: p)
        }
        return p.future
    }
    
    @inlinable
    public static func whenAnyComplete<T: Thenable>(_ thenables: T...) -> Future<T.Success, T.Failure> {
        return self.whenAnyComplete(thenables)
    }
    
    @inlinable
    public static func whenAnySucceed<S: Sequence>(_ thenables: S) -> Future<S.Element.Success, S.Element.Failure> where S.Element: Thenable {
        let p = Promise<S.Element.Success, S.Element.Failure>()
        for t in thenables {
            t.pipeSuccess(to: p)
        }
        return p.future
    }
    
    @inlinable
    public static func whenAnySucceed<T: Thenable>(_ thenabls: T...) -> Future<T.Success, T.Failure> {
        return self.whenAnySucceed(thenabls)
    }
}
