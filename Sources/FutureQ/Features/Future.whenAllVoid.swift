import Foundation

extension Future {
    
    public static func whenAllCompleteVoid<T>(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<Void> {
        let p = Promise<Void>()
        
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { _ in
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
    
    public static func whenAllSucceedVoid<T>(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<Void> {
        let p = Promise<Void>()
        
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { r in
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
