/*
 ⚠️️️️⚠️️️️⚠️️️️
 This file was generated from `./whenAny.T.gyb`, you shouldn't modify it directly.
 ./utils/gyb.py ./Sources/FutureQ/Features/whenAny.T.gyb -o ./Sources/FutureQ/Features/whenAny.T.swift --line-directive ''
 */

import Foundation

extension Thenable {

    public static func whenAnyComplete<T1: Thenable, T2: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2
    )
        -> Future<Any>
    {
        return self.whenAnyComplete([thenable1.asAny(), thenable2.asAny()])
    }

    public static func whenAnyComplete<T1: Thenable, T2: Thenable, T3: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3
    )
        -> Future<Any>
    {
        return self.whenAnyComplete([thenable1.asAny(), thenable2.asAny(), thenable3.asAny()])
    }

    public static func whenAnyComplete<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4
    )
        -> Future<Any>
    {
        return self.whenAnyComplete([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny()])
    }

    public static func whenAnyComplete<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5
    )
        -> Future<Any>
    {
        return self.whenAnyComplete([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny(), thenable5.asAny()])
    }

    public static func whenAnyComplete<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6
    )
        -> Future<Any>
    {
        return self.whenAnyComplete([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny(), thenable5.asAny(), thenable6.asAny()])
    }

    public static func whenAnyComplete<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable, T7: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6,
		_ thenable7: T7
    )
        -> Future<Any>
    {
        return self.whenAnyComplete([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny(), thenable5.asAny(), thenable6.asAny(), thenable7.asAny()])
    }

    public static func whenAnySucceed<T1: Thenable, T2: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2
    )
        -> Future<Any>
    {
        return self.whenAnySucceed([thenable1.asAny(), thenable2.asAny()])
    }

    public static func whenAnySucceed<T1: Thenable, T2: Thenable, T3: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3
    )
        -> Future<Any>
    {
        return self.whenAnySucceed([thenable1.asAny(), thenable2.asAny(), thenable3.asAny()])
    }

    public static func whenAnySucceed<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4
    )
        -> Future<Any>
    {
        return self.whenAnySucceed([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny()])
    }

    public static func whenAnySucceed<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5
    )
        -> Future<Any>
    {
        return self.whenAnySucceed([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny(), thenable5.asAny()])
    }

    public static func whenAnySucceed<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6
    )
        -> Future<Any>
    {
        return self.whenAnySucceed([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny(), thenable5.asAny(), thenable6.asAny()])
    }

    public static func whenAnySucceed<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable, T7: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6,
		_ thenable7: T7
    )
        -> Future<Any>
    {
        return self.whenAnySucceed([thenable1.asAny(), thenable2.asAny(), thenable3.asAny(), thenable4.asAny(), thenable5.asAny(), thenable6.asAny(), thenable7.asAny()])
    }

}
