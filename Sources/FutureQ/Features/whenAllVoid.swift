import Foundation

// For performance

extension Thenable {
    
    @inlinable
    public static func whenAllCompleteVoid<C: Collection>(_ thenables: C) -> Future<Void> where C.Element: Thenable {
        let p = Promise<Void>()
        
        let count = Atomic(thenables.count)
        
        for t in thenables {
            t.whenComplete { _ in
                count.writeVoid { i in
                    i -= 1
                    if i == 0 {
                        p.succeed(())
                    }
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T: Thenable>(_ thenables: T...) -> Future<Void> {
        return self.whenAllCompleteVoid(thenables)
    }
    
    @inlinable
    public static func whenAllSucceedVoid<C: Collection>(_ thenables: C) -> Future<Void> where C.Element: Thenable {
        let p = Promise<Void>()
        
        let count = Atomic(thenables.count)
        
        for t in thenables {
            t.whenComplete { r in
                switch r {
                case .success:
                    count.writeVoid { i in
                        i -= 1
                        if i == 0 {
                            p.succeed(())
                        }
                    }
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllSucceedVoid<T: Thenable>(_ thenables: T...) -> Future<Void> {
        return self.whenAllSucceedVoid(thenables)
    }
}
