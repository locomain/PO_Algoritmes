import 'package:collection/collection.dart';
import 'dart:collection';
import 'edge.dart';
import 'graph.dart';
import 'path.dart';
import 'vert.dart';

class PathFinder<T extends Comparable> {

  Graph graph;
  HeapPriorityQueue<Vert> queue = new HeapPriorityQueue<Vert>();
  HashMap<String,Vert> visited = new HashMap<String,Vert>();
  HashMap<String, Vert> evaluated = new HashMap<String,Vert>();

  /**
   * Default constructor
   */
  PathFinder(this.graph);


  /**
   * Gets the shortest path by identifiers
   */
  List<Vert> getShortestPath(String start, String target){
    Vert from = graph.getVertex(start);
    Vert to = graph.getVertex(target);

    if(from == null) throw Exception("Start vertex not found");
    if(to == null) throw Exception("Target vertex not found");

    return getShortestPath(start, target);
  }

  /**
   * Gets the shortest path by vertices
   */
  Path getShortestPathFromVertices(Vert start, Vert target){
    clearAllCollections();
    evaluateAndEnqueueWithCost(start);

    while(!queue.isEmpty){
      Vert current = queue.removeFirst();
      if(current.identifier == target.identifier) return getPath(start,current,[current]); // Found target!
      visited[current.identifier] = current; // Add current node to visited map
      visitRelations(current);
    }

    throw Exception('Could not find a path from start to target');
  }

  /**
   * Visits all the neighbours/relations of a vertex
   */
  void visitRelations(Vert current){
    for(Edge edge in current.relations){
      Vert neighbour = edge.vertex;

      if(visited.containsKey(neighbour.identifier)) continue; //already visited

      double cost = current.cost + edge.cost; //total cost to edge vertex

      if(!evaluated.containsKey(neighbour.identifier)){
        neighbour.parent = current;
        evaluateAndEnqueueWithCost(neighbour,cost);
        continue;
      }

      if(neighbour.cost > cost){
        neighbour.parent = current;
        evaluateAndEnqueueWithCost(neighbour,cost);
      }
    }
  }

  /**
   * Evaluates a vertex and adds it to the queue
   */
  void evaluateAndEnqueueWithCost(Vert vertex, [double cost = 0]){
    vertex.cost = cost;
    evaluated[vertex.identifier] = vertex;
    queue.add(vertex);
  }

  /**
   * Clears all collections
   */
  void clearAllCollections(){
    queue.clear();
    visited.clear();
    evaluated.clear();
  }


  /**
   * Get a path based on a vert link
   */
  Path getPath(Vert start, Vert current, List<Vert> path){ //TODO path
    if(start.identifier == current.identifier) return new Path(path);
    if(current.parent==null){
      print("parent unknown for "+current.identifier);
    }
    path.insert(0, current.parent);
    return getPath(start, current.parent, path);
  }

}