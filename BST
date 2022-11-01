function TreeNode(value, left=null, right=null) {
    this.value = value;
    this.left = left;
    this.right = right;
}

function Tree(array) {
    this.root = buildTree(array);
    this.insert = function(numberToAdd) {
        insert(this.root, numberToAdd);
    }
    this.remove = function(numberToDelete) {
        this.root = remove(this.root, numberToDelete);
    }
    this.find = function(numberToFind) {
        const found = find(this.root, numberToFind);
        return found;
    }
    this.setRoot = function(newRoot) {
        this.root = newRoot;
    }
}

function buildTree(array) {
    const start = 0;
    const end = array.length;
    const mid = Math.floor((start + end) / 2);
    if(start === end || start > end) {
        return null;
    }
    const root = new TreeNode(array[mid]);
    root.left = buildTree(array.slice(0, mid));
    root.right = buildTree(array.slice(mid + 1, end));
    return root;
}

const insert = function(root, numberToAdd) {
  if(root === null) {
      root = new TreeNode(numberToAdd);
  } else {
    if(root.value < numberToAdd) {
      root.right = insert(root.right, numberToAdd);
        } else if(root.value > numberToAdd) {
          root.left = insert(root.left, numberToAdd);
        }
      }
    return root;
  }
  
  const remove = function(root, numberToDelete) {
    if(root.value === numberToDelete) {
        if(root.right === null && root.left === null) {
            root = null;
            return root;
        } else if (root.right !== null && root.left !== null) {
            const leftToMove = root.left;
            let current = root.right;
            while(current.left !== null) {
                current = current.left;
            }
            current.left = leftToMove;
            root = root.right;
            return root;
        } else {
            if(root.right !== null) {
                root = root.right;
            } else {
                root = root.left;
            }
            return root;
        }
    } else if(root.value < numberToDelete) {
        root.right = remove(root.right, numberToDelete);
    } else if(root.value > numberToDelete) {
        root.left = remove(root.left, numberToDelete);
    }
    return root;
}

function find(root, numberToFind) {
    if(root === null) {
        return null;
    }
    if(root.value > numberToFind) {
        return find(root.left, numberToFind);
    } else if(root.value < numberToFind) {
        return find(root.right, numberToFind);
    } else if(root.value === numberToFind) {
        return root;
    }
}

function QueueNode(value, next=null) {
    this.value = value;
    this.next = next;
}

function Queue(head=null, tail=null) {
    this.head = head;
    this.tail = tail;
    this.enqueue = function(value) {
        const newNode = new QueueNode(value);
        if(this.head === null) {
            this.head = newNode;
            this.tail = newNode;
        } else {
            this.tail.next = newNode
            this.tail = newNode;
        }
    }
    this.dequeue = function() {
        this.head = this.head.next;
    }
}

function levelOrder(root, f=null) {
    let myQueue = new Queue();
    let myArray = [];
    myQueue.enqueue(root);
    while(myQueue.head !== null) {
        if(myQueue.head.value.left !== null) {
            myQueue.enqueue(myQueue.head.value.left);
        }
        if(myQueue.head.value.right !== null) {
            myQueue.enqueue(myQueue.head.value.right);
        }
        if(f !== null) {
            myArray.push(f(myQueue.head.value.value));
        } else {
            myArray.push(myQueue.head.value.value);
        }
        myQueue.dequeue();
    }
    return myArray;
}

function inorder(root, f=null) {
    if(root.left === null && root.right === null) {
        if(f !== null) {
            return [f(root.value)];
        } else {
            return [root.value];
        }
    }
    const rootVal = [root.value];
    let left = [];
    let right = [];
    if(root.left !== null) {
        left = inorder(root.left, f);
    }
    if(root.right !== null) {
        right = inorder(root.right, f);   
    }
    return left.concat(rootVal).concat(right);
}

function preorder(root, f=null) {
    if(root.left === null && root.right === null) {
        if(f !== null) {
            return [f(root.value)];
        } else {
            return [root.value];
        }
    }
    const rootVal = [root.value];
    let left = [];
    let right = [];
    if(root.left !== null) {
        left = preorder(root.left, f);
    }
    if(root.right !== null) {
        right = preorder(root.right, f);   
    }
    return rootVal.concat(left).concat(right);
}

function postorder(root, f=null) {
    if(root.left === null && root.right === null) {
        if(f !== null) {
            return [f(root.value)];
        } else {
            return [root.value];
        }
    }
    const rootVal = [root.value];
    let left = [];
    let right = [];
    if(root.left !== null) {
        left = postorder(root.left, f);
    }
    if(root.right !== null) {
        right = postorder(root.right, f);   
    }
    return left.concat(right).concat(rootVal);
}

function height(root) {
    let myQueue = new Queue();
    let height = 0;
    myQueue.enqueue(root);
    while(myQueue.head !== null) {
    	if(myQueue.head.value.left === null && myQueue.head.value.right !== null) {
            const heightToTest = depth(root, myQueue.head.value.value);
            if(height < heightToTest) {
                height = heightToTest;
            }
    	}
        if(myQueue.head.value.left !== null) {
            myQueue.enqueue(myQueue.head.value.left);
        }
        if(myQueue.head.value.right !== null) {
            myQueue.enqueue(myQueue.head.value.right);
        }
        myQueue.dequeue();
    }
    return height;
}

function depth(root, value) {
    let newNode = root;
    let counter = 0;
    if(root === null) {
        return null;
    }
    while(newNode !== null) {
        if(newNode.value > value) {
            newNode = newNode.left;
        } else if(newNode.value < value) {
            newNode = newNode.right;
        } else if(newNode.value === value) {
            counter += 1;
            return counter;
        }
        counter += 1;
    }
    return null;
}

function isBalanced(root) {
    let myQueue = new Queue();
    myQueue.enqueue(root);
    while(myQueue.head !== null) {
        console.log(myQueue.head.value);
        let leftHeight = 0
        let rightHeight = 0;
        if(myQueue.head.value.left !== null) {
            myQueue.enqueue(myQueue.head.value.left);
            leftHeight = height(myQueue.head.value.left);
        }
        if(myQueue.head.value.right !== null) {
            myQueue.enqueue(myQueue.head.value.right);
            rightHeight = height(myQueue.head.value.right);
        }
        if((leftHeight - rightHeight) > 1) {
            return false;
        }
        myQueue.dequeue();
    }
    return true;
}

function mergeSort(array) {
    if(array.length < 2) {
        return array;
    } else {
        const lSide = mergeSort(array.slice(0, Math.floor(array.length / 2)));
        const rSide = mergeSort(array.slice(Math.floor(array.length / 2)));
        let rPointer = 0;
        let lPointer = 0;
        let counter = 0;
        let newArray = [];
        while(counter != (lSide.length + rSide.length)) {
            if(rSide[rPointer] > lSide[lPointer] || rSide[rPointer] === undefined) {
                newArray.push(lSide[lPointer]);
                lPointer += 1;
            } else if (rSide[rPointer] < lSide[lPointer] || lSide[lPointer] === undefined) {
                newArray.push(rSide[rPointer]);
                rPointer += 1;
            } 
            counter += 1;
        }
        return newArray;
    }
}

function rebalance(root) {
    const newArray = mergeSort(levelOrder(root));
    return buildTree(newArray);
}

function test() {
    let newArray = [];
    for(let i = 0; i < 21; i++) {
        newArray.push(Math.floor(Math.random() * 10));
    }
    const newTree = new Tree(newArray);
    console.log(isBalanced(newTree.root));
    console.log(levelOrder(newTree.root));
    console.log(preorder(newTree.root));
    console.log(postorder(newTree.root));
    console.log(inorder(newTree.root));
    for(let i = 0; i < 5; i++) {
        newTree.insert(Math.floor(Math.random() * 1000));
    }
    console.log(isBalanced(newTree.root))
    if(!isBalanced(newTree.root)) {
        myTree.setRoot(rebalance(newTree.root));
    }
    console.log(isBalanced(newTree.root));
    console.log(levelOrder(newTree.root));
    console.log(preorder(newTree.root));
    console.log(postorder(newTree.root));
    console.log(inorder(newTree.root));
}
