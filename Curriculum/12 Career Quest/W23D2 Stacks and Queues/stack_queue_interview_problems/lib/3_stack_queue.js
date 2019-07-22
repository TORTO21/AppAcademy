// ============================================================================
// Interview Problem: StackQueue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement your preferred Stack implementation, including the methods:
//
//   - Push 
//   - Pop 
//   - Size
//
// Then, implement a Queue by instantiating two Stack instances for storage.
//
// The StackQueue implementation should include the following methods:
//
//   - Enqueue
//   - Dequeue
//   - Size
//
// -----------
// Let's code!
// -----------

class Node {
    // TODO: Implement the Node class!
    constructor(val) {
        this.value = val
        this.next = null
    }
}

class Stack {
    // TODO: Implement the Stack class!
    constructor() {
        this.top = null
        this.bottom = null
        this.length = null
    }

    push(val) {
        let pushed = new Node(val)
        if (this.length) {
            let oldTop = this.top
            this.top = pushed
            pushed.next = oldTop
        } else {
            this.top = pushed
            this.bottom = pushed
        }
        return ++this.length
    }

    pop() {
        let popped = this.top
        if(!popped) return null
        if (this.length === 1) this.bottom = null
        this.top = this.top.next
        this.length--
        return popped.value
    }

    size() {
        return this.length
    }
}

class StackQueue {
    // TODO: Implement the StackQueue class!

};

exports.Node = Node;
exports.Stack = Stack;
exports.StackQueue = StackQueue;
