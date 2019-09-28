class Quicksorter{

  /**
   * Sorts a list of ints
   */
  static List sort<T extends Comparable>(List<T> list){
    if (list.length <= 1) return list;

    final T pivot = Quicksorter.getMedian(list);
    final List<T> left = List<T>();
    final List<T> right = List<T>();

    for(T member in list){

      if(member.compareTo(pivot)<=0)left.add(member);
      if(member.compareTo(pivot)>0)right.add(member);
    }

    return [...Quicksorter.sort(left),pivot,...Quicksorter.sort(right)];
  }

  /**
   * Gets the median of the list
   */
  static T getMedian<T extends Comparable>(List<T>list ){
    T center = list[list.length~/2];
    T middle = list[list.length~/2];
    T last = list[list.length~/2];
    return last;
  }

}