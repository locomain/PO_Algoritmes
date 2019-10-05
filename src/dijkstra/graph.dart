import 'dart:collection';
import 'edge.dart';
import 'vert.dart';

class Graph {

  HashMap<String,Vert> vertices = new HashMap<String,Vert>();

  /**
   * Adds a vertex to the graph
   */
  addVertex(Vert vertex){
    if(getVertext(vertex.identifier)==null)
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
  getVertext(String identifier){
    return vertices[identifier];
  }

}