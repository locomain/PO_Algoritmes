import "../../src/bintree/binarytree.dart";
import 'package:test/test.dart';

BinaryTree getTree(){
  BinaryTree tree = new BinaryTree();
  tree.insert(3);
  tree.insert(9);
  tree.insert(7);
  tree.insert(2);
  tree.insert(11);
  tree.insert(10);
  tree.insert(12);
  tree.insert(1);
  return tree;
}

void main(){
  BinaryTree tree = getTree();

  test("Should have a the first inserted value as root node",(){
      expect(tree.root.value, 3);
  });

  test("Value of left child should be lower then the the root node",(){
    expect(tree.root.left.value, 2);
  });

  test("Value of right child should be higher then the the root node",(){
    expect(tree.root.right.value, 9);
  });

  test("Should find highest value",(){
    expect(tree.findMax().value,12);
  });

  test("Should find lowest value",(){
    expect(tree.findMin().value,1);
  });

  test("Should find a node based on value",(){
    expect(tree.find(7).value,7);
  });

  test("Should remove a node based on value",(){
    BinaryTree temp = getTree();
    temp.remove(12);
    expect(temp.find(12),null);
  });

  test("After removing a value the lowest side right side child should replace it",(){
    BinaryTree temp = getTree();
    temp.remove(9);
    expect(temp.root.right.value,10);
  });

  test("Should return null if nothing is found",(){
    expect(tree.find(1000),null);
  });

  test("Nothing should happen if we delete a value that is not in the tree",(){
    expect(tree.remove(1000),null);
  });

}