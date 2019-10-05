import 'vert.dart';

class Path{

  List<Vert> vertices;
  Path(this.vertices);

  getHumanReadable(){
    return vertices.map((vert)=>vert.identifier.toString());
  }
}