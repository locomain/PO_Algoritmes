import 'edge.dart';

class Vert implements Comparable<Vert>{

  String identifier;
  List<Edge> relations = new List<Edge>();

  double cost = double.infinity;
  Vert parent;
  //Vert relation;

  /**
   * Default constructor
   */
  Vert(this.identifier);
  //Vert(this.identifier,this.cost,this.relation);


  addRelation(Vert vertex, cost){
    relations.add(new Edge(vertex,cost));
  }

  /**
   * Default comparable method
   */
  @override
  int compareTo(Vert other) {
    return cost < other.cost? -1 : cost > other.cost? 1 : 0;
  }

}