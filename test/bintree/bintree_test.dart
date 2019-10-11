import "../../src/bintree/binarytree.dart";
import 'package:test/test.dart';

void main(){
  BinaryTree tree = new BinaryTree();
  tree.insert(3);
  tree.insert(9);
  tree.insert(7);
  tree.insert(2);
  tree.insert(10);
  tree.insert(4);
  tree.insert(1);

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
    expect(tree.findMax().value,10);
  });

  test("Should find lowest value",(){
    expect(tree.findMin().value,1);
  });

  test("Should find a node based on value",(){
    expect(tree.find(7).value,7);
  });

  test("Should remove a node based on value",(){
    tree.remove(10);
    expect(tree.find(10),null);
  });

}