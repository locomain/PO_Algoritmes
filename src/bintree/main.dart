import 'binarytree.dart';

void main(){
	BinaryTree tree = new BinaryTree();
	tree.insert(3);
	tree.insert(9);
	tree.insert(7);
	tree.insert(2);
	tree.insert(10);
	tree.insert(4);
	tree.insert(1);

	tree.remove(10);
	print("root = "+tree.root.value.toString());

}