import Foundation

extension Thenable {
    
    @inlinable
    public static func whenAllComplete<C: Collection>(_ thenables: C) -> Future<[Result<C.Element.Success, C.Element.Failure>], C.Element.Failure> where C.Element: Thenable {
        let p = Promise<[Result<C.Element.Success, C.Element.Failure>], C.Element.Failure>()
        
        let count = Atom(thenables.count)
        
        for t in thenables {
            t.whenComplete { _ in
                if count.sub(1) == 0 {
                    p.succeed(thenables.map({ $0.inspectWithoutLock()! }))
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllComplete<T: Thenable>(_ thenables: T...) -> Future<[Result<T.Success, T.Failure>], T.Failure> {
        return self.whenAllComplete(thenables)
    }
    
    @inlinable
    public static func whenAllSucceed<C: Collection>(_ thenables: C) -> Future<[C.Element.Success], C.Element.Failure> where C.Element: Thenable {
        let p = Promise<[C.Element.Success], C.Element.Failure>()
        
        let count = Atom(thenables.count)
        
        for t in thenables {
            t.whenComplete { r in
                switch r {
                case .success:
                    if count.sub(1) == 0 {
                        p.succeed(thenables.map({ $0.inspectWithoutLock()!.value! }))
                    }
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllSucceed<T: Thenable>(_ thenables: T...) -> Future<[T.Success], T.Failure> {
        return self.whenAllSucceed(thenables)
    }
}
