import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Class to weave multiple lists of items so that all items from all lists
 * are interleaved with each other in a single list.
 *
 * For example, given the following lists:
 *  l1 = [a, b, c, d]
 *  l2 = [1, 2, 3]
 *  l3 = [X, Y]
 *
 * The resulting weaved list would be: [a, 1, X, b, 2, Y, c, 3, d]
 */
class WeavedList<T> {

  /** The underling list after weaving */
  private final List<T> woven;

  /**
   * Construct weaved list from multiple lists of items.
   * @param items Multiple lists of items to weave.
   */
  public WeavedList(List<List<T>> items) {
    this.woven = weave(items);
  }

  /**
   * Weave multiple lists of items so that all items are interleaved with each other.
   * @param items List of items to weave
   * @return List of weaved items
   */
  private List<T> weave(List<List<T>> items) {
    List<T> result = new ArrayList<T>();

    // Create list of iterators of all lists in items
    List<Iterator<T>> iterators = new ArrayList<Iterator<T>>();
    for (List<T> list : items) {
      iterators.add(list.iterator());
    }

    // Iterate over all lists, adding each item to result
    int currentSize = result.size();
    do {
      currentSize = result.size();
      for (Iterator<T> it : iterators) {
        if (it.hasNext()) {
          result.add(it.next());
        }
      }
    } while (currentSize != result.size());
    return result;
  }

  /**
   * Get a copy of the underlying weaved list.
   * @return All items from all lists waved into a single List.
   */
  public List<T> getList() {
    return new ArrayList<T>(woven);
  }

  /**
   * @return the size of the underlying waved list.
   */
  public int size() {
    return woven.size();
  }

  /**
   * @return String representation of the underlying weaved list.
   */
  public String toString() {
    return woven.toString();
  }
}

public class Weave {

  public static void main(String[] args) {
    List<Character> l1 = new ArrayList<Character>();
    l1.add('a');
    l1.add('b');
    l1.add('c');
    l1.add('d');

    List<Character> l2 = new ArrayList<Character>();
    l2.add('1');
    l2.add('2');
    l2.add('3');

    List<Character> l3 = new ArrayList<Character>();
    l3.add('X');
    l3.add('Y');

    List<List<Character>> items = new ArrayList<List<Character>>();
    items.add(l1);
    items.add(l2);
    items.add(l3);

    System.out.println("items: " + items);
    WeavedList<Character> result = new WeavedList<Character>(items);
    System.out.println("weaved: " + result);
  }
}
