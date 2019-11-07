import "../../src/dijkstra/pathfinder.dart";
import "../../src/dijkstra/graph.dart";
import "../../src/dijkstra/vert.dart";
import "package:test/test.dart";

void main(){

  test('Should provide the shortes path in a named weighted graph', (){
    Vert arnhem = new Vert("Arnhem");
    Vert doetinchem = new Vert("Doetinchem");
    Vert zutphen = new Vert("Zutphen");
    Graph graph = new Graph()
        .addVertex(arnhem)
        .addVertex(doetinchem)
        .addVertex(zutphen)
        .addEdge(arnhem,doetinchem,30.0)
        .addEdge(arnhem,zutphen,8.0)
        .addEdge(zutphen,doetinchem,2.0);

    PathFinder finder = new PathFinder(graph);
    expect(finder.getShortestPathFromVertices(arnhem, doetinchem).getHumanReadable(),[
        'Arnhem',
        'Zutphen',
        'Doetinchem'
    ]);
  });

  test('Should provide the shortes path in a named unweighted graph', (){
    Vert arnhem = new Vert("Arnhem");
    Vert doetinchem = new Vert("Doetinchem");
    Vert zutphen = new Vert("Zutphen");
    Graph graph = new Graph()
        .addVertex(arnhem)
        .addVertex(doetinchem)
        .addVertex(zutphen)
        .addEdge(arnhem,doetinchem)
        .addEdge(arnhem,zutphen)
        .addEdge(zutphen,doetinchem);

    PathFinder finder = new PathFinder(graph);
    expect(finder.getShortestPathFromVertices(arnhem, doetinchem).getHumanReadable(),[
      'Arnhem',
      'Doetinchem'
    ]);
  });


  test('Should throw error if start or target vertex is null',(){
    Vert arnhem = new Vert("Arnhem");
    Vert doetinchem = new Vert("Doetinchem");
    Vert zutphen = new Vert("Zutphen");
    Graph graph = new Graph()
        .addVertex(arnhem)
        .addVertex(doetinchem)
        .addVertex(zutphen)
        .addEdge(arnhem,doetinchem)
        .addEdge(arnhem,zutphen)
        .addEdge(zutphen,doetinchem);

    PathFinder finder = new PathFinder(graph);
    expect(()=>finder.getShortestPathFromVertices(arnhem, null).getHumanReadable(),throwsException);
  });

  test('Should throw error that path could not be found when there is no path to be found ',(){
    Vert arnhem = new Vert("Arnhem");
    Vert doetinchem = new Vert("Doetinchem");
    Vert zutphen = new Vert("Zutphen");
    Graph graph = new Graph()
        .addVertex(arnhem)
        .addVertex(doetinchem)
        .addVertex(zutphen);

    PathFinder finder = new PathFinder(graph);
    expect(()=>finder.getShortestPathFromVertices(arnhem, zutphen).getHumanReadable(),throwsException);
  });

  test('Should throw error if graph is null',(){
    expect(()=>new PathFinder(null),throwsException);
  });

}