import 'graph.dart';
import 'pathfinder.dart';
import 'vert.dart';

void main(){
	Vert arnhem = new Vert("Arnhem");
	Vert doetinchem = new Vert("Doetinchem");
	Vert zutphen = new Vert("Zutphen");
	Graph graph = new Graph();

	graph
			.addVertex(arnhem)
			.addVertex(doetinchem)
			.addVertex(zutphen)
			.addEdge(arnhem,doetinchem,10.0)
			.addEdge(arnhem,zutphen,8.0);

	PathFinder finder = new PathFinder(graph);
	print(finder.getShortestPathFromVertices(arnhem, zutphen).map((vert)=>vert.identifier));
	print("oke");
}