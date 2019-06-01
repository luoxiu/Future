/*
 ⚠️️️️⚠️️️️⚠️️️️
 This file was generated from `./whenAll.T.gyb`, you shouldn't modify it directly.
 ./utils/gyb.py ./Sources/FutureQ/Features/whenAll.T.gyb -o ./Sources/FutureQ/Features/whenAll.T.swift --line-directive ''
 */
import Foundation

extension Thenable {
    
    public static func whenAllComplete<T1, T2>(
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>, Result<T6, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!, future6.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>, Result<T6, Error>, Result<T7, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!, future6.inspectWildly()!, future7.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>, Result<T6, Error>, Result<T7, Error>, Result<T8, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!, future6.inspectWildly()!, future7.inspectWildly()!, future8.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>,
		_ future9: Future<T9>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>, Result<T6, Error>, Result<T7, Error>, Result<T8, Error>, Result<T9, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!, future6.inspectWildly()!, future7.inspectWildly()!, future8.inspectWildly()!, future9.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>,
		_ future9: Future<T9>,
		_ future10: Future<T10>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>, Result<T6, Error>, Result<T7, Error>, Result<T8, Error>, Result<T9, Error>, Result<T10, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!, future6.inspectWildly()!, future7.inspectWildly()!, future8.inspectWildly()!, future9.inspectWildly()!, future10.inspectWildly()!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>,
		_ future9: Future<T9>,
		_ future10: Future<T10>,
		_ future11: Future<T11>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>, Result<T6, Error>, Result<T7, Error>, Result<T8, Error>, Result<T9, Error>, Result<T10, Error>, Result<T11, Error>)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid(), future11.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!, future2.inspectWildly()!, future3.inspectWildly()!, future4.inspectWildly()!, future5.inspectWildly()!, future6.inspectWildly()!, future7.inspectWildly()!, future8.inspectWildly()!, future9.inspectWildly()!, future10.inspectWildly()!, future11.inspectWildly()!)
            }
    }
    
    public static func whenAllSucceed<T1, T2>(
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<(T1, T2)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<(T1, T2, T3)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<(T1, T2, T3, T4)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<(T1, T2, T3, T4, T5)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>
        )
        -> Future<(T1, T2, T3, T4, T5, T6)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!, future6.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>
        )
        -> Future<(T1, T2, T3, T4, T5, T6, T7)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!, future6.inspectWildly()!.value!, future7.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>
        )
        -> Future<(T1, T2, T3, T4, T5, T6, T7, T8)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!, future6.inspectWildly()!.value!, future7.inspectWildly()!.value!, future8.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>,
		_ future9: Future<T9>
        )
        -> Future<(T1, T2, T3, T4, T5, T6, T7, T8, T9)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!, future6.inspectWildly()!.value!, future7.inspectWildly()!.value!, future8.inspectWildly()!.value!, future9.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>,
		_ future9: Future<T9>,
		_ future10: Future<T10>
        )
        -> Future<(T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!, future6.inspectWildly()!.value!, future7.inspectWildly()!.value!, future8.inspectWildly()!.value!, future9.inspectWildly()!.value!, future10.inspectWildly()!.value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>,
		_ future9: Future<T9>,
		_ future10: Future<T10>,
		_ future11: Future<T11>
        )
        -> Future<(T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)>
    {
        return self.whenAllSucceedVoid(
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid(), future11.asVoid()]
            )
            .map { _ in
                (future1.inspectWildly()!.value!, future2.inspectWildly()!.value!, future3.inspectWildly()!.value!, future4.inspectWildly()!.value!, future5.inspectWildly()!.value!, future6.inspectWildly()!.value!, future7.inspectWildly()!.value!, future8.inspectWildly()!.value!, future9.inspectWildly()!.value!, future10.inspectWildly()!.value!, future11.inspectWildly()!.value!)
            }
    }

}
