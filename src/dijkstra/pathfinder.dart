import 'package:collection/collection.dart';
import 'dart:collection';
import 'edge.dart';
import 'graph.dart';
import 'vert.dart';

class PathFinder {

  Graph graph;

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
    HeapPriorityQueue<Vert> queue = new HeapPriorityQueue<Vert>();
    HashMap<String,Vert> visited = new HashMap<String,Vert>();
    HashMap<String, Vert> evaluated = new HashMap<String,Vert>();

    start.cost = 0;
    queue.add(start);
    evaluated[start.identifier] = start;

    while(!queue.isEmpty){
      print("iteration");
      Vert current = queue.removeFirst();

      if(current.identifier == target.identifier) return getPath(start,current,[current]);
      visited[current.identifier] = current; // Add current node to visited map

      for(Edge edge in current.relations){
        Vert neighbour = edge.vertex;

        if(visited.containsKey(neighbour.identifier)) continue; //already visited

        double cost = current.cost + edge.cost;
        print("From "+current.identifier+" to "+neighbour.identifier+" costs "+cost.toString());

        if(!evaluated.containsKey(neighbour.identifier)){
          neighbour.parent = current;
          neighbour.cost = cost;
          evaluated[neighbour.identifier] = neighbour;
          queue.add(neighbour);
          continue;
        }
        print("here");
        print(evaluated[neighbour.identifier].cost.toString()+" > "+cost.toString());
        if(evaluated[neighbour.identifier].cost > cost){
          evaluated[neighbour.identifier].cost = cost;
          print("Setting parent "+current.identifier+" for "+evaluated[neighbour.identifier].identifier);
          evaluated[neighbour.identifier].parent = current;
          queue.remove(evaluated[neighbour.identifier]);
          queue.add(evaluated[neighbour.identifier]);
        }
      }
    }

    throw Exception('Could not find a path from start to target');
  }


  List<Vert> getPath(Vert start, Vert current, List<Vert> path){
    if(start.identifier == current.identifier) return path;
    if(current.parent==null){
      print("parent unknown for "+current.identifier);
    }
    path.insert(0, current.parent);
    return getPath(start, current.parent, path);
  }

}