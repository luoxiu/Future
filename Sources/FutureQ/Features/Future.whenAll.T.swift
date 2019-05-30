/*
 ⚠️️️️⚠️️️️⚠️️️️
 This file was generated from `./Future.whenAll.T.gyb`, you shouldn't modify it directly.
 ./utils/gyb.py ./Sources/Future/Future.whenAll.T.gyb -o ./Sources/Future/Future.whenAll.T.swift --line-directive ''
 */


import Foundation

extension Future {
    public static func whenAllComplete<T1, T2>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<(Result<T1, Error>, Result<T2, Error>, Result<T3, Error>, Result<T4, Error>, Result<T5, Error>)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!, future6._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!, future6._result!, future7._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!, future6._result!, future7._result!, future8._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!, future6._result!, future7._result!, future8._result!, future9._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!, future6._result!, future7._result!, future8._result!, future9._result!, future10._result!)
            }
    }
    
    public static func whenAllComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid(), future11.asVoid()]
            )
            .map { _ in
                (future1._result!, future2._result!, future3._result!, future4._result!, future5._result!, future6._result!, future7._result!, future8._result!, future9._result!, future10._result!, future11._result!)
            }
    }
    
    public static func whenAllSucceed<T1, T2>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<(T1, T2)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<(T1, T2, T3)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<(T1, T2, T3, T4)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5>(
        on queue: DispatchQueue = .main, 
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<(T1, T2, T3, T4, T5)>
    {
        return self.whenAllSucceedVoid(
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!, future6._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!, future6._value!, future7._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!, future6._value!, future7._value!, future8._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!, future6._value!, future7._value!, future8._value!, future9._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!, future6._value!, future7._value!, future8._value!, future9._value!, future10._value!)
            }
    }

    public static func whenAllSucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
        on queue: DispatchQueue = .main, 
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
            on: queue,
            [future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid(), future11.asVoid()]
            )
            .map { _ in
                (future1._value!, future2._value!, future3._value!, future4._value!, future5._value!, future6._value!, future7._value!, future8._value!, future9._value!, future10._value!, future11._value!)
            }
    }

}
