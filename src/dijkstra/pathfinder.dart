import 'package:collection/collection.dart';
import 'dart:collection';
import 'edge.dart';
import 'graph.dart';
import 'vert.dart';

class PathFinder {

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
    Vert from = graph.getVertext(start);
    Vert to = graph.getVertext(target);

    if(from == null) throw Exception("Start vertex not found");
    if(to == null) throw Exception("Target vertex not found");

    return getShortestPath(start, target);
  }

  /**
   * Gets the shortest path by vertices
   */
  List<Vert> getShortestPathFromVertices(Vert start, Vert target){
    clearAllCollections();

    start.cost = 0;
    evaluateAndEnqueue(start);

    while(!queue.isEmpty){
      Vert current = queue.removeFirst();

      if(current.identifier == target.identifier) return getPath(start,current,[current]);
      visited[current.identifier] = current; // Add current node to visited map

      for(Edge edge in current.relations){
        Vert neighbour = edge.vertex;

        if(visited.containsKey(neighbour.identifier)) continue; //already visited

        double cost = current.cost + edge.cost;

        if(!evaluated.containsKey(neighbour.identifier)){
          neighbour.parent = current;
          neighbour.cost = cost;
          evaluateAndEnqueue(neighbour);
          continue;
        }

        if(neighbour.cost > cost){
          neighbour.cost = cost;
          neighbour.parent = current;
          queue.remove(neighbour);
          queue.add(neighbour);
        }
      }
    }

    throw Exception('Could not find a path from start to target');
  }

  /**
   * Evaluates a vertex and adds it to the queue
   */
  void evaluateAndEnqueue(Vert vertex){
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
  List<Vert> getPath(Vert start, Vert current, List<Vert> path){
    if(start.identifier == current.identifier) return path;
    if(current.parent==null){
      print("parent unknown for "+current.identifier);
    }
    path.insert(0, current.parent);
    return getPath(start, current.parent, path);
  }

}