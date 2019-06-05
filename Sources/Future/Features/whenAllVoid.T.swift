/*
 ⚠️️️️⚠️️️️⚠️️️️
 This file was generated from `./whenAllVoid.T.gyb`, you shouldn't modify it directly.
 ./utils/gyb.py ./Sources/FutureQ/Features/whenAllVoid.T.gyb -o ./Sources/FutureQ/Features/whenAllVoid.T.swift --line-directive ''
 */

import Foundation

extension Thenable {

    @inlinable
    public static func whenAllCompleteVoid<T1: Thenable, T2: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure 
    {
        return self.whenAllCompleteVoid([thenable1.asVoid(), thenable2.asVoid()])
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T1: Thenable, T2: Thenable, T3: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure 
    {
        return self.whenAllCompleteVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid()])
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure 
    {
        return self.whenAllCompleteVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid()])
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure, T4.Failure == T5.Failure 
    {
        return self.whenAllCompleteVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid(), thenable5.asVoid()])
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure, T4.Failure == T5.Failure, T5.Failure == T6.Failure 
    {
        return self.whenAllCompleteVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid(), thenable5.asVoid(), thenable6.asVoid()])
    }
    
    @inlinable
    public static func whenAllCompleteVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable, T7: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6,
		_ thenable7: T7
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure, T4.Failure == T5.Failure, T5.Failure == T6.Failure, T6.Failure == T7.Failure 
    {
        return self.whenAllCompleteVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid(), thenable5.asVoid(), thenable6.asVoid(), thenable7.asVoid()])
    }
    
    @inlinable
    public static func whenAllSucceedVoid<T1: Thenable, T2: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure 
    {
        return self.whenAllSucceedVoid([thenable1.asVoid(), thenable2.asVoid()])
    }

    @inlinable
    public static func whenAllSucceedVoid<T1: Thenable, T2: Thenable, T3: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure 
    {
        return self.whenAllSucceedVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid()])
    }

    @inlinable
    public static func whenAllSucceedVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure 
    {
        return self.whenAllSucceedVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid()])
    }

    @inlinable
    public static func whenAllSucceedVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure, T4.Failure == T5.Failure 
    {
        return self.whenAllSucceedVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid(), thenable5.asVoid()])
    }

    @inlinable
    public static func whenAllSucceedVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure, T4.Failure == T5.Failure, T5.Failure == T6.Failure 
    {
        return self.whenAllSucceedVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid(), thenable5.asVoid(), thenable6.asVoid()])
    }

    @inlinable
    public static func whenAllSucceedVoid<T1: Thenable, T2: Thenable, T3: Thenable, T4: Thenable, T5: Thenable, T6: Thenable, T7: Thenable>(
        _ thenable1: T1,
		_ thenable2: T2,
		_ thenable3: T3,
		_ thenable4: T4,
		_ thenable5: T5,
		_ thenable6: T6,
		_ thenable7: T7
    )
        -> Future<Void, T1.Failure>
        where T1.Failure == T2.Failure, T2.Failure == T3.Failure, T3.Failure == T4.Failure, T4.Failure == T5.Failure, T5.Failure == T6.Failure, T6.Failure == T7.Failure 
    {
        return self.whenAllSucceedVoid([thenable1.asVoid(), thenable2.asVoid(), thenable3.asVoid(), thenable4.asVoid(), thenable5.asVoid(), thenable6.asVoid(), thenable7.asVoid()])
    }

}
