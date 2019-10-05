import 'dart:collection';
import 'edge.dart';
import 'vert.dart';

class Graph {

  HashMap<String,Vert> vertices = new HashMap<String,Vert>();

  addVertex(Vert vertex){
    if(getVertext(vertex.identifier)==null)
      vertices[vertex.identifier] = vertex;
    return this;
  }

  addEdge(Vert from, Vert to, double cost){
    addVertex(from).addVertex(to); //to make sure the vertices are added to the graph
    from.relations.add(new Edge(to,cost));
    return this;
  }

  addTwoWayEdge(Vert from, Vert to, double cost){
    addEdge(from, to, cost).addEgde(to,from,cost);
  } // TODO do we need this?

  getVertext(String identifier){
    return vertices[identifier];
  }

}