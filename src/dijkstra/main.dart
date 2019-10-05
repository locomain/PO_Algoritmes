import 'graph.dart';
import 'pathfinder.dart';
import 'vert.dart';

void main(){
	print("Weighted Paths");
	runWeighted();

	print("\nUnweighted Paths");
	runUnweighted();
}

void runWeighted(){
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

	PathFinder pathFinder = new PathFinder(graph);
	print(pathFinder.getShortestPathFromVertices(arnhem, doetinchem).map((vert)=>vert.identifier));
}


void runUnweighted(){
	Vert arnhem = new Vert("Arnhem");
	Vert doetinchem = new Vert("Doetinchem");
	Vert zutphen = new Vert("Zutphen");
	Graph graph = new Graph();

	graph
			.addVertex(arnhem)
			.addVertex(doetinchem)
			.addVertex(zutphen)
			.addEdge(arnhem,doetinchem)
			.addEdge(arnhem,zutphen)
			.addEdge(zutphen,doetinchem);

	PathFinder pathFinder = new PathFinder(graph);

	print(pathFinder.getShortestPathFromVertices(arnhem, doetinchem).map((vert)=>vert.identifier));
}