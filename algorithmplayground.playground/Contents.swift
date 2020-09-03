import UIKit

var str = "Hello, playground"
//print(towSum([-3,4,3,90], 0))
//func towSum(_ nums:[Int], _ target: Int) -> [Int] {
//    var results:[Int] = Array();
//    var i = 0;
//    for value in nums {
//        let j = i + 1;
//        for index in j..<nums.count {
//            let result = value + nums[index];
//            print("\(result)" + "\n")
//            if result == target {
//                results.append(i);
//                results.append(index);
//            }
//        }
//
//        i += 1;
//    }
//
//    return results;
//}
// 

class BinarySearchTree <E : Comparable> : BinarySearchTreeInterface {
    
    private var _size:Int = 0;
    private var root:Node?
    
    func size() -> Int {
        return _size;
    }
    
    func isEmpty() -> Bool {
        return _size == 0
    }
    
    func add(element:E) {
        if root == nil {
            root = Node(element: element, parent: nil)
            _size += 1;
            return
        }
        
        var node:Node? = root;
        while node != nil {
            guard let parentElement = node?.element else { return }
            if parentElement > element {
                if node?.right != nil {
                    node = node?.right;
                    continue
                } else {
                    node?.right = Node(element: element, parent: node)
                    node = nil;
                }
            }
            
            if parentElement < element {
                if node?.left != nil {
                    node = node?.left;
                    continue
                } else {
                    node?.left = Node(element: element, parent: node)
                    node = nil;
                }
            }
        }
        
        _size += 1;
    }
    
    func remove(element: E) {
        
    }
    
    func contains(element: E) {
        
    }
    
    private class Node {
        var element:E?
        var left:Node?
        var right:Node?
        var parentNode:Node?
        init(element:E, parent:Node?) {
            self.element = element
            self.parentNode = parent;
        }
    }
}

protocol  BinarySearchTreeInterface {
    associatedtype E : Comparable
    func size() -> Int
    func isEmpty() -> Bool;
    func add(element: E)
    func remove(element: E)
    func contains(element: E)
    
}


var tree = BinarySearchTree<Int>.init()
tree.add(element: 10)
tree.add(element: 20)
tree.add(element: 5)
tree.size()
