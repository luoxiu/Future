import Foundation

public typealias Async = Future<Void, Never>

extension Async {
    
    public static func background<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .background), body: body)
    }
    
    public static func utility<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .utility), body: body)
    }
    
    public static func userInitiated<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .userInitiated), body: body)
    }
    
    public static func userInteractive<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .userInteractive), body: body)
    }
    
    public static func main<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .main, body: body)
    }
    
    private static func async<T>(after seconds: Double = 0, queue: DispatchQueue, body: @escaping () throws -> T) -> Future<T, Error> {
        let p = Promise<T, Error>()
        
        queue.asyncAfter(deadline: .now() + seconds) {
            p.complete(Result(catching: body))
        }
        
        return p.future
    }
}

extension Future {
    
    public func background<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.delay(seconds, on: .global(qos: .background)).map(body)
    }
    
    public func utility<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.delay(seconds, on: .global(qos: .utility)).map(body)
    }
    
    public func userInitiated<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.delay(seconds, on: .global(qos: .userInitiated)).map(body)
    }
    
    public func userInteractive<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.delay(seconds, on: .global(qos: .userInteractive)).map(body)
    }
    
    public func main<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.delay(seconds, on: .main).map(body)
    }
    
    public func background() -> Future<Success, Failure> {
        return self.yield(on: .global(qos: .background))
    }
    
    public func utility() -> Future<Success, Failure> {
        return self.yield(on: .global(qos: .utility))
    }
    
    public func userInitiated() -> Future<Success, Failure> {
        return self.yield(on: .global(qos: .userInitiated))
    }
    
    public func userInteractive() -> Future<Success, Failure> {
        return self.yield(on: .global(qos: .userInteractive))
    }
    
    public func main() -> Future<Success, Failure> {
        return self.yield(on: .main)
    }
}
