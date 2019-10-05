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
			.addEdge(arnhem,doetinchem,30.0)
			.addEdge(arnhem,zutphen,8.0)
			.addEdge(zutphen,doetinchem,2.0);

	PathFinder finder = new PathFinder(graph);
	print(finder.getShortestPathFromVertices(arnhem, doetinchem).map((vert)=>vert.identifier));
	print("oke");
}