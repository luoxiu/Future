import Foundation

extension Future {
    
    public static func whenAllCompleteVoid<T>(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<Void> {
        let p = Promise<Void>(on: queue)
        
        var complete = false
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { _ in
                count.write { i in
                    i -= 1
                    if i == 0 {
                        complete = true
                    }
                }
                
                if complete {
                    p.succeed(())
                }
            }
        }
        
        return p.future
    }
    
    public static func whenAllSucceedVoid<T>(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<Void> {
        let p = Promise<Void>(on: queue)
        
        var succeed = false
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { r in
                switch r {
                case .success:
                    count.write { i in
                        i -= 1
                        if i == 0 {
                            succeed = true
                        }
                    }
                    
                    if succeed {
                        p.succeed(())
                    }
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
}
