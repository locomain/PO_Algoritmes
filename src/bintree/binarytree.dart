import 'node.dart';

class BinaryTree<T extends Comparable> {

  Node<T> root = null;

  BinaryTree(){

  }

  /**
   * Inserts a value
   */
  insert(T value){
    _insertNode(new Node(value));
  }


  remove(){

  }


  /**
   * Searches a node
   */
  Node<T> find(T value, [Node<T> parent = null]){
    if(parent == null){
      if(!_hasRoot()) throw Exception("Tree has no values");
      parent ??= root;
    }
    return _search(value, parent);
  }

  Node<T> findMin([Node<T> parent]){
    if(parent==null){
      if(!_hasRoot()) throw Exception("Tree has no values");
      parent = root;
    }
    if(parent.left!=null){
      return findMin(parent);
    } else return parent;
  }

  Node<T> findMax([Node<T> parent]){
      if(parent==null){
        if(!_hasRoot()) throw Exception("Tree has no values");
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

}