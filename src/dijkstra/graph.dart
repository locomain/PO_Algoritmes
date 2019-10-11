import 'dart:collection';
import 'edge.dart';
import 'vert.dart';

class Graph<T extends Comparable> {

  HashMap<T,Vert> vertices = new HashMap<T,Vert>();

  /**
   * Adds a vertex to the graph
   */
  addVertex(Vert vertex){
    if(getVertex(vertex.identifier)==null)
      vertices[vertex.identifier] = vertex;
    return this;
  }

  /**
   * Adds a edge to the graph and links it in the vertex
   */
  addEdge(Vert from, Vert to, [double cost = 0]){
    addVertex(from).addVertex(to); //to make sure the vertices are added to the graph
    from.relations.add(new Edge(to,cost));
    return this;
  }

  /**
   * Gets a vertex
   */
  getVertex(String identifier){
    return vertices[identifier];
  }

}