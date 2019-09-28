import "../src/quicksort/quicksorter.dart";
import "package:test/test.dart";

void main(){
  var sorter = new Quicksorter();

  test('Should sort a numeric list asc', (){
    expect(sorter.sort([9,8,7,6,5,4,3,2,1,0,0]), [0,0,1,2,3,4,5,6,7,8,9]);
  });

  test('Should sort a char list asc',(){
    expect(sorter.sort(['c','b','a']), ['a','b','c']);
  });

  test('Should sort a string list asc',(){
    expect(sorter.sort(['bert','battes','angelo']), ['angelo','battes','bert']);
  });

  test('Should sort dynamic values',(){
    expect(sorter.sort(['a','2','c','true']),['2','a','c','true']);
  });

  test('Should sort with empty array',(){
    expect(sorter.sort([]),[]);
  });

  test('Should sort with only one value',(){
    expect(sorter.sort([1]),[1]);
  });

  test('Should sort with null value',(){
    expect(sorter.sort(null),[]);
  });

  test('Should get the median of a numeric list',(){
    var list = [1,2,3,4,5];
    expect(list[sorter.getMedianIndex(list)],3);
  });

  test('Should get the median of a char list',(){
    var list = ['a','b','c','d','e'];
    expect(list[sorter.getMedianIndex(list)],'c');
  });

  test('Should get the median of a char list',(){
    var list = ['aaaa','bbbb','ccccc','ddddd','eeeee'];
    expect(list[sorter.getMedianIndex(list)],'ccccc');
  });

  test('Should get the median of a dynamic list',(){
    var list = ['1111','bbbb','5555','8888','eeeee'];
    expect(list[sorter.getMedianIndex(list)],'5555');
  });

  test('Checks if a number is in the middle of others',(){
    expect(sorter.inTheMiddleOf(1, 2, 3),false);
  });

  test('Checks if a char is in the middle of others',(){
    expect(sorter.inTheMiddleOf('b', 'a', 'c'),true);
  });

  test('Checks if a string is in the middle of others',(){
    expect(sorter.inTheMiddleOf('aaaaa', 'bbbbbb', 'cccccc'),false);
  });
}