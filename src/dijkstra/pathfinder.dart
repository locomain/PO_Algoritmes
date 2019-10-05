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

    queue.add(start);
    evaluated[start.identifier] = start;

    while(!queue.isEmpty){
      Vert current = queue.removeFirst();

      if(current.identifier == target.identifier) return getPath(current,target,[current]);
      visited[current.identifier] = current; // Add current node to visited map

      for(Edge edge in current.relations){
        Vert neighbour = edge.vertex;

        if(visited.containsKey(neighbour.identifier)) continue; //already visited

        double totalcost = current.cost + edge.cost;

        if(!evaluated.containsKey(neighbour.identifier)){
          evaluated[neighbour.identifier] = neighbour;
          queue.add(neighbour);
          continue;
        }

        if(evaluated[neighbour.identifier].cost > totalcost){
          evaluated[neighbour.identifier].cost = totalcost;
          evaluated[neighbour.identifier].parent = current;
          queue.remove(evaluated[neighbour.identifier]);
          queue.add(evaluated[neighbour.identifier]);
        }
      }
    }

    return []; //TODO
  }


  List<Vert> getPath(Vert start, Vert current, List<Vert> path){
    if(start.identifier == current.identifier) return path;
    path.insert(0, current.parent);
    return getPath(start, current.parent, path);
  }

}