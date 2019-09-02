import Foundation

// For performance

extension Thenable {
    
    @inlinable
    public static func whenAllCompleteVoid<C: Collection>(_ thenables: C) -> Future<Void, C.Element.Failure> where C.Element: Thenable {
        let p = Promise<Void, C.Element.Failure>()
        
        let count = Atom(thenables.count)
        
        for t in thenables {
            t.whenComplete { _ in
                if count.sub(1) == 0 {
                    p.succeed(())
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T: Thenable>(_ thenables: T...) -> Future<Void, T.Failure> {
        return self.whenAllCompleteVoid(thenables)
    }
    
    @inlinable
    public static func whenAllSucceedVoid<C: Collection>(_ thenables: C) -> Future<Void, C.Element.Failure> where C.Element: Thenable {
        let p = Promise<Void, C.Element.Failure>()
        
        let count = Atom(thenables.count)
        
        for t in thenables {
            t.whenComplete { r in
                switch r {
                case .success:
                    if count.sub(1) == 0 {
                        p.succeed(())
                    }
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllSucceedVoid<T: Thenable>(_ thenables: T...) -> Future<Void, T.Failure> {
        return self.whenAllSucceedVoid(thenables)
    }
}
