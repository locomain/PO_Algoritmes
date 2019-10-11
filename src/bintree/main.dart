import 'binarytree.dart';

void main(){
	BinaryTree tree = new BinaryTree();
	tree.insert(3);
	tree.insert(9);
	tree.insert(7);
	tree.insert(2);
	tree.insert(11);
	tree.insert(10);
	tree.insert(12);
	tree.insert(1);


	print("test");
	print(tree.root.right.right.left.value);
	//print(tree.root.left.right.value);
	//print(tree.findMax().value);
	print("before");
	print(tree.root.value);
	print(tree.root.right.value);
	print(tree.root.right.left.value);
	tree.remove(9);

	print("after");
	print(tree.root.value);
	print(tree.root.right.value);
	print(tree.root.right.left.value);

	print("test 2");
	print(tree.root.right.right.value);

}