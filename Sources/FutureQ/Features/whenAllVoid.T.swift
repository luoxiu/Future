/*
 ⚠️️️️⚠️️️️⚠️️️️
 This file was generated from `./whenAllVoid.T.gyb`, you shouldn't modify it directly.
 ./utils/gyb.py ./Sources/FutureQ/Features/whenAllVoid.T.gyb -o ./Sources/FutureQ/Features/whenAllVoid.T.swift --line-directive ''
 */

import Foundation

extension Thenable {

    public static func whenAllCompleteVoid<T1, T2>(
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5, T6>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5, T6, T7>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5, T6, T7, T8>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>
        )
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
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
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
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
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid()])
    }
    
    public static func whenAllCompleteVoid<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
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
        -> Future<Void>
    {
        return self.whenAllCompleteVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid(), future11.asVoid()])
    }
    
    public static func whenAllSucceedVoid<T1, T2>(
        _ future1: Future<T1>,
		_ future2: Future<T2>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5, T6>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5, T6, T7>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5, T6, T7, T8>(
        _ future1: Future<T1>,
		_ future2: Future<T2>,
		_ future3: Future<T3>,
		_ future4: Future<T4>,
		_ future5: Future<T5>,
		_ future6: Future<T6>,
		_ future7: Future<T7>,
		_ future8: Future<T8>
        )
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
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
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
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
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid()])
    }

    public static func whenAllSucceedVoid<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
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
        -> Future<Void>
    {
        return self.whenAllSucceedVoid([future1.asVoid(), future2.asVoid(), future3.asVoid(), future4.asVoid(), future5.asVoid(), future6.asVoid(), future7.asVoid(), future8.asVoid(), future9.asVoid(), future10.asVoid(), future11.asVoid()])
    }

}
