/**
/*Creates a new Node object containing a value and a reference to the next node.
/@param { value } : the data the node will contain.
/@param { next } : the next node in the linked list.
*/
function Node(value=null, next=null) {
    this.value = value;
    this.next = next;
}

/**
/*Creates a new LinkedList object containing a head and tail node.
/@param { head } : the initial value for the head node
*/

function LinkedList(head) {
    this.head = new Node(head)
    this.tail = this.head
    this.append = function(value) {
        const newNode = new Node(value);
        this.tail.next = newNode;
        this.tail = newNode;
    }
    this.prepend = function(value) {
        const newHead = new Node(value, this.head);
        this.head = newHead;
    }
    this.getSize = function() {
        let current = this.head;
        let counter = 1;
        while(current.next != null) {
            counter += 1;
            current = current.next;
        }
        return counter;
    }
    this.getHead = function() {
        return this.head;
    }
    this.getTail = function() {
        return this.tail;
    }
    this.at = function(index) {
        if(index > this.getSize()) {
            return 'Index too high for linked list of length ' + this.getSize();
        }
        let counter = 0;
        let current = this.head;
        if(index === 0) {
            return this.head
        }
        while(counter < index) {
            current = current.next;
            counter += 1;
        }
        return current;
    }
    this.pop = function() {
        let current = this.head;
        if(this.head === null || this.head.next === null) {
            return null;
        }
        while(current.next.next != null) {
            current = current.next;
        }
        current.next = null;
        this.tail = current;
    }
    this.contains = function(value) {
        let current = this.head;
        while(current != null) {
            if(current.value === value) {
                return true;
            }
            current = current.next;
        }
        return false;
    }
    this.find = function(value) {
        let current = this.head;
        let counter = 0;
        while(current != null) {
            if(current.value === value) {
                return counter;
            } else {
                counter += 1;
                current = current.next;
            }
        }
        return null;
    }
    this.toString = function() {
        let myString = '';
        let current = this.head;
        while(current != null) {
            myString += '( ' + current.value + ' ) -> '
            current = current.next;
        }
        myString += null;
        console.log(myString);
    }
    this.insertAt = function(value, index) {
        if(index === 0) {
            this.append(value);
        } else if(index === (this.getSize() - 1)) {
            this.prepend(value);
        } else {
            const prevNode = this.at(index - 1);
            const nextNode = prevNode.next;
            const newNode = new Node(value);
            prevNode.next = newNode;
            newNode.next = nextNode;
        }
    }
    this.removeAt = function(index) {
        if(index > (this.getSize() - 1)) {
            return 'Error! Requested index outside bounds of linked list. Highest index that can be removed is ' + (this.getSize() - 1);
        } else if(index === 0) {
            const newHead = this.head.next;
            this.head = newHead;
        } else if(index > 0) {
            const toDelete = this.at(index);
            const rSide = toDelete.next;
            const lSide = this.at(index - 1);
            lSide.next = rSide;
        }
            
    }
}
