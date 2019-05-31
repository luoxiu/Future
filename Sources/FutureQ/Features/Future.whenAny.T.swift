/*
 ⚠️️️️⚠️️️️⚠️️️️
 This file was generated from `./Future.whenAny.T.gyb`, you shouldn't modify it directly.
 ./utils/gyb.py ./Sources/FutureQ/Features/Future.whenAny.T.gyb -o ./Sources/FutureQ/Features/Future.whenAny.T.swift --line-directive ''
 */


import Foundation

extension Future {

    public static func whenAnyComplete<T1, T2>(
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5, T6>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5, T6, T7>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5, T6, T7, T8>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>
        )
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
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
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny(), future9.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
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
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny(), future9.asAny(), future10.asAny()])
    }

    public static func whenAnyComplete<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
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
        -> Future<Any>
    {
        return self.whenAnyComplete([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny(), future9.asAny(), future10.asAny(), future11.asAny()])
    }

    public static func whenAnySucceed<T1, T2>(
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5, T6>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5, T6, T7>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5, T6, T7, T8>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>
        )
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
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
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny(), future9.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
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
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny(), future9.asAny(), future10.asAny()])
    }

    public static func whenAnySucceed<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
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
        -> Future<Any>
    {
        return self.whenAnySucceed([future1.asAny(), future2.asAny(), future3.asAny(), future4.asAny(), future5.asAny(), future6.asAny(), future7.asAny(), future8.asAny(), future9.asAny(), future10.asAny(), future11.asAny()])
    }

}
