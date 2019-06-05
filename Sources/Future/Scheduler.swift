import Foundation

public protocol Scheduler {
    
    func schedule(_ task: @escaping () -> Void)
}

public protocol TimeoutScheduler: Scheduler {

    func schedule(after seconds: Double, _ task: @escaping () -> Void)
}

extension DispatchQueue: TimeoutScheduler, Scheduler {
    
    public func schedule(_ task: @escaping () -> Void) {
        self.async(execute: task)
    }
    
    public func schedule(after seconds: Double, _ task: @escaping () -> Void) {
        self.asyncAfter(wallDeadline: .now() + seconds, execute: task)
    }
}

extension RunLoop: TimeoutScheduler, Scheduler {
    
    public func schedule(_ task: @escaping () -> Void) {
        self.perform(task)
    }
    
    public func schedule(after seconds: Double, _ task: @escaping () -> Void) {
        let timer = Timer(timeInterval: seconds, repeats: false) { t in
            task()
            t.invalidate()
        }
        self.add(timer, forMode: .common)
    }
}

extension OperationQueue: Scheduler {
    
    public func schedule(_ task: @escaping () -> Void) {
        self.addOperation(task)
    }
}
