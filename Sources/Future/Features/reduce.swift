import Foundation

extension Thenable {
    
    @inlinable
    public static func reduce<S: Sequence, U>(_ thenables: S, initial: U, nextPartial: @escaping (U, S.Element.Success) -> Future<U, S.Element.Failure>) -> Future<U, S.Element.Failure> where S.Element: Thenable {
        return self.reduce(thenables, initial: Future<U, S.Element.Failure>.success(initial), nextPartial: nextPartial)
    }
    
    @inlinable
    public static func reduce<S: Sequence, U: Thenable>(_ thenables: S, initial: U, nextPartial: @escaping (U.Success, S.Element.Success) -> Future<U.Success, U.Failure>) -> Future<U.Success, U.Failure> where S.Element: Thenable, S.Element.Failure == U.Failure {
        return thenables.reduce(initial.toFuture()) { (fu, ft) -> Future<U.Success, U.Failure> in
            return whenAllSucceed(fu, ft).flatMap { (ut) in
                return nextPartial(ut.0, ut.1)
            }
        }
    }
}
