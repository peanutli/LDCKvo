import Cocoa

/**
 *泛型函数
 */

func findIndex<T:Equatable>(of valueToFind:T, in array:[T]) -> Int? {
    for (index,value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
     return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let stringIndex = findIndex(of: "cat", in: strings) {
     print("The index of llama is \(stringIndex)")
}

let doubleIndex = findIndex(of: 0, in: [3.14159, 0.1, 0.25])


//关联类型 实践

