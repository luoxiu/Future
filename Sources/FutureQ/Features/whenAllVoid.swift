import Foundation

// For performance

extension Thenable {
    
    public static func whenAllCompleteVoid<T: Thenable>(_ thenables: [T]) -> Future<Void> {
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
    
    public static func whenAllSucceedVoid<T: Thenable>(_ thenables: [T]) -> Future<Void> {
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
}
