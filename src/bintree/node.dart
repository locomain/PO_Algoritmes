class Node<T extends Comparable> {

  Node left, right;
  T value;

  Node(T this.value);

  bool hasAllChilds(){
    return left!=null && right!=null;
  }
}