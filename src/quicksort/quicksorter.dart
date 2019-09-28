class Quicksorter<T extends Comparable>{

  /**
   * Sorts a list of ints
   */
  List<T> sort(List<T> list){
    if(list==null) return [];
    if (list.length <= 1) return list;

    final int pivotIndex = getMedianIndex(list);
    final T pivot = list[pivotIndex];
    final List<T> left = List<T>();
    final List<T> right = List<T>();

    for(int i = 0; i< list.length; i++){
      if(i==pivotIndex)continue;

      final T member = list[i];
      if(member.compareTo(pivot)<=0)left.add(member);
      if(member.compareTo(pivot)>0)right.add(member);
    }

    return [...sort(left), pivot, ...sort(right)];
  }

  /**
   * Gets the median of the list
   */
  int getMedianIndex(List<T> list){
    final T first = list[0];
    final T center = list[list.length~/2];
    final T last = list[list.length-1];

    if(inTheMiddleOf(center, first, last))return list.length~/2;
    if(inTheMiddleOf(last, first, center)) {
      return list.length - 1;
    } else return 0;
  }

  /**
   * Checks if a target is in the middle of the other values
   */
  bool inTheMiddleOf(T target, T comparisonLeft, T comparisonRight){
    return target.compareTo(comparisonLeft)>0 && target.compareTo(comparisonRight) <0
           || target.compareTo(comparisonRight)>0 && target.compareTo(comparisonLeft) <0;
  }

}