import 'node.dart';

class BinaryTree<T extends Comparable> {

  Node<T> root = null;

  /**
   * Inserts a value
   */
  insert(T value){
    _insertNode(new Node(value));
  }


  /**
   * Removes a value from the tree
   */
  remove(T value){
    _checkRoot();
    Node parent = searchForParent(value, root);
    if(parent==null) return;
    Node target = _search(value, parent);
    if(target==null) return;
    _deleteNode(target,parent);
  }


  /**
   * Deletes a node from the tree
   */
  Node<T> _deleteNode(Node node, Node parent){
    if(node.hasAllChilds()){ // has all childs
      Node lOLeft = node.left;
      Node lORight = node.right;
      Node lowestRight = findMin(lORight);
      Node lowestRightParent = searchForParent(lowestRight.value,lORight);

      _overrideChild(node, lowestRight, parent);
      lowestRightParent.right = null;//we just rotated the node up the tree so we remove the duplicate value
      _insertNode(lOLeft,lowestRight); //reinsert left side of deleted node
      _insertNode(lORight,lowestRight); //reinsert right side of deleted node
      return node;
    }

    if(node.left!=null){//has left child only
      _overrideChild(node,node.left,parent);
    } else if(node.right!=null){ //has right child only
      _overrideChild(node,node.right,parent);
    } else { //no childs
      _overrideChild(node,null,parent);
    }
    return node;
  }

  /**
   * Overrides a child of a parent with a given target
   */
  _overrideChild(Node target, Node replacer, Node parent){
    if(parent.right == target){
      parent.right = replacer;
    } else if(parent.left == target){
      parent.left = replacer;
    }
  }

  /**
   * Searches a node
   */
  Node<T> find(T value, [Node<T> parent = null]){
    if(parent == null){
      _checkRoot();
      parent ??= root;
    }
    return _search(value, parent);
  }

  /**
   * Find node with the lowest value
   */
  Node<T> findMin([Node<T> parent]){
    if(parent==null){
      _checkRoot();
      parent = root;
    }
    if(parent.left!=null){
      return findMin(parent.left);
    } else return parent;
  }

  /**
   * Find node with the highest value
   */
  Node<T> findMax([Node<T> parent]){
      if(parent==null){
        _checkRoot();
        parent = root;
      }
      if(parent.right!=null){
        return findMax(parent.right);
      } else return parent;
  }

  /**
   * Inserts a node
   */
  _insertNode(Node<T> node, [Node<T> parent = null]){
    if(!_hasRoot()){
      this.root = node;
      return;
    }
    parent??= root; //if there is no parent we start searching from the root

    if(node.value.compareTo(parent.value)<0) {
      if(parent.left==null){
        parent.left = node;
        return;
      } else _insertNode(node,parent.left);
    } else {
      if(parent.right==null){
        parent.right = node;
        return;
      } else _insertNode(node,parent.right);
    }
  }

  /**
   * Searches a node
   */
  Node<T> _search(T value, Node parent){
    if(parent == null)return null;
    final int comparableValue = value.compareTo(parent.value);

    if(comparableValue==0)return parent;
    if(comparableValue<0){
      return _search(value,parent.left);
    } else {
      return _search(value,parent.right);
    }
  }

  /**
   * Searches for a parent of a node by value
   */
  Node<T> searchForParent(T value, Node parent){
    if(parent==null)return null;
    if(parent.left!=null){
      if(parent.left.value.compareTo(value) == 0)
        return parent;
    }
    if (parent.right!=null){
      if(parent.right.value.compareTo(value) == 0)
        return parent;
    }
    //not found search on
    final int comparableValue = value.compareTo(parent.value);
    if(comparableValue==0)return parent;
    if(comparableValue<0){
      return searchForParent(value,parent.left);
    } else {
      return searchForParent(value,parent.right);
    }
  }

  /**
   * Determines if the tree has a root
   */
  _hasRoot(){ return root!=null; }

  /**
   * Checks if a root node exists otherwiste throws error
   */
  _checkRoot(){
    if(!_hasRoot()) throw Exception("Tree has no values");
  }

}