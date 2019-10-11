import 'node.dart';

class BinaryTree<T extends Comparable> {

  Node<T> root = null;

  /**
   * Inserts a value
   */
  insert(T value){
    _insertNode(new Node(value));
  }


  remove(T value){
    _checkRoot();
    Node target = _search(value,root);
    _deleteNode(target);
  }


  /**
   * Deletes a node from the tree
   */
  Node<T> _deleteNode(Node<T> node){
    if(!node.hasChilds()){
      node = null;
      return node;
    } else { //all childs
      Node lowestRight = findMin(node.right);
      node.value = lowestRight.value;
      node.right = _deleteNode(_search(lowestRight.value, root.right));//_deleteNode(lowestRight.value,root.right);
    }

    //left only
    if(node.left!=null){
      node = node.left;
    }

    //right only
    if(node.right!=null){
      node = node.right;
    }

    return node;
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
      return findMin(parent);
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
        return findMax(parent);
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

/*  Node<T> _removeNode(T value,[Node<T> parent = null]){
    if(parent==null)return null;

    final int comparableValue = value.compareTo(parent.value);

    if(comparableValue==0) { //found the node

        //no childs
      if(!parent.hasChilds()){
        Node<T> copy = new Node(parent.value);
        parent = null;
        return copy;
      } else { //all childs
        Node lowestRight = findMin(parent.right);
        parent.value = lowestRight.value;
        parent.right = _removeNode(lowestRight.value,root.right);
      }

      //left only
      if(parent.left!=null){
        parent = parent.left;
      }

      //right only
      if(parent.right!=null){
        parent = parent.right;
      }

    } else if(comparableValue<0){
      return _removeNode(value,parent.left);
    } else {
      return _removeNode(value,parent.right);
    }


    return parent;
  }*/

  /**
   * Searches a node
   */
  Node<T> _search(T value, Node parent){
    if(parent == null)return null;
    final int comparableValue = value.compareTo(parent.value);

    if(comparableValue==0)return parent;
    if(comparableValue<0){
      return this.find(value,parent.left);
    } else {
      return this.find(value,parent.right);
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