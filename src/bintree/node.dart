class Node<T extends Comparable> {

  Node left, right;
  T value;

  Node(T value);

  bool hasChilds(){
    return left!=null && right!=null;
  }
}