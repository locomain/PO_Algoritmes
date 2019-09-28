class Quicksorter{

  /**
   * Sorts a list of ints
   */
  static List sort<T extends Comparable>(List<T> list){
    if (list.length <= 1) return list;

    final int pivotIndex = Quicksorter.getMedian(list);
    final T pivot = list[pivotIndex];
    final List<T> left = List<T>();
    final List<T> right = List<T>();

    for(int i = 0; i< list.length; i++){
      if(i==pivotIndex)continue;

      final T member = list[i];
      if(member.compareTo(pivot)<=0)left.add(member);
      if(member.compareTo(pivot)>0)right.add(member);
    }

    return [...Quicksorter.sort(left), pivot, ...Quicksorter.sort(right)];
  }

  /**
   * Gets the median of the list
   */
  static int getMedian<T>(List<T> list){
    return list.length~/2;
  }

}