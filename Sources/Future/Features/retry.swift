import Foundation

extension Thenable {
    
    @inlinable
    public static func retry<Success, Failure>(count: Int, task: @escaping () -> Future<Success, Failure>) -> Future<Success, Failure> {
        return self._retry(count: count, task: task)
    }
    
    @inlinable
    static func _retry<Success, Failure>(count: Int, task: @escaping () -> Future<Success, Failure>) -> Future<Success, Failure> {
        return task().flatMapError {
            if count == 0 {
                return Future<Success, Failure>.failure($0)
            } else {
                return _retry(count: count - 1, task: task)
            }
        }
    }
}
