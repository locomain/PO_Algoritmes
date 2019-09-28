class Quicksorter {

  /**
   * Sorts a list of ints
   */
  static List sort(List<int> list){
    if (list.length <= 1) return list;

    final int pivot = Quicksorter.getMedian(list);
    final List<int> left = List<int>();
    final List<int> right = List<int>();

    for(int member in list){
      if(member<pivot)left.add(member);
      if(member>pivot)right.add(member);
    }

    return [...Quicksorter.sort(left),pivot,...Quicksorter.sort(right)];
  }

  /**
   * Gets the median of the list
   */
  static int getMedian(List<int>list ){
    return list[list.length~/2];
  }

}