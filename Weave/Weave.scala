import scala.annotation.tailrec
import scala.collection.mutable.ListBuffer

object Weave {
  /**
   * Weave multiple lists of items so that all items from all lists are
   * interleaved with each other in a single list.
   *
   * For example:
   *  weave(List(List(a, b, c, d),
   *             List(1, 2, 3),
   *             List(X, Y)))
   *
   *  yields List(a, 1, X, b, 2, Y, c, 3, d)
   *
   * The new list is composed of the heads of each list until
   * all items from all lists are used.
   *
   * @param items List of items to weave
   * @return List of weaved items
   */
   def weave[T](items:List[List[T]]):List[T] = {
     @tailrec
     def doWeave[T](items:List[List[T]], result:ListBuffer[T]):List[T] = {
       val filtered = items.filterNot(_.isEmpty)
       filtered match {
         case Nil => result.toList
         case _  => doWeave(filtered.map(_.tail), result ++= filtered.map(_.head))
       }
     }
     doWeave(items, new ListBuffer[T])
   }

  def main(args:Array[String]) {
    val l1 = List('a', 'b', 'c', 'd')
    val l2 = List(1, 2, 3)
    val l3 = List('X', 'Y')
    val items = List(l1, l2, l3)
    val result = weave(items)

    println("items: " + items)
    println("weaved: " + result)
  }
}
