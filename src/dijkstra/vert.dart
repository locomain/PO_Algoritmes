import 'edge.dart';

class Vert<E extends Comparable> implements Comparable<Vert>{

  E identifier;
  List<Edge> relations = new List<Edge>();

  double cost = double.infinity;
  Vert parent;

  /**
   * Default constructor
   */
  Vert(this.identifier);

  /**
   * Adds a (Edge) relation
   */
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