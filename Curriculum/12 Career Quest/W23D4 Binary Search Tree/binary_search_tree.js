// commented naive BST class
class BST {
  constructor() {
      // initialize the tree to be empty
      this.root = null;
  }

  insert(val, root=this.root) {
      // if the tree is currently empty, then create the node as the 'absolute' root
      if(!this.root) {
          this.root = new TreeNode(val);
          return;
      }

      // otherwise, the tree is not empty, so...
      // if our val to insert is less than the root...
      if (val < root.val) {
          if (!root.left) {                       // ...and the left child does not exist,
              root.left = new TreeNode(val);      //      then create the node as the left child
          } else {                                // ...and the left child already exists,
              this.insert(val, root.left);        //      then recursively insert on the left subtree
          }

      // if our val to insert is greater than or equal to the root...
      } else {
          if (!root.right) {                      //  ...and the right child does not exist,
              root.right = new TreeNode(val);     //      then create the node as the right child
          } else {                                //  ...and the right child already exists,
              this.insert(val, root.right);       //      then recursively insert on the right subtree
          }
      }
  }
}

let tree1 = new BST();
tree1.insert(10);
tree1.insert(5);
tree1.insert(16);
tree1.insert(1);
tree1.insert(7);
tree1.insert(16);

let tree2 = new BST();
tree2.insert(1);
tree2.insert(5);
tree2.insert(7);
tree2.insert(10);
tree2.insert(16);
tree2.insert(16);