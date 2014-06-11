# Weave

The following code samples each implement a “weave" operation on multiple lists
of items such that all items from all lists are interleaved with each other
into a single list.

For example, given the following lists:
```
list1 = [a, b, c, d]
list2 = [1, 2, 3]
list3 = [X, Y]
 ```

The resulting weaved list would be:
```
[a, 1, X, b, 2, Y, c, 3, d]
```

## Scala version

The original code was written in Scala, which encourages a Functional
rather than Object Oriented programming paradigm, uses functional style and
recursion to solve the problem.

A couple of interesting notes about the Scala version:

1. Although the solution uses recursion to solve the problem the function,
`doWeave`, is [tail call recursive](https://en.wikipedia.org/wiki/Tail_call)
and uses the Scala
[`@tailrec`](https://www.scala-lang.org/api/2.10.7/#scala.annotation.tailrec)
annotation. The Scala compiler will optimize tail call recursive functions
during compilation so that the resulting byte-code is efficient and iterative.
By using the `@tailrec` annotation the code will fail to compile if it cannot
be tail call optimized.

2. The use of
[`ListBuffer`](https://www.scala-lang.org/api/2.10.7/#scala.collection.mutable.ListBuffer)
(as opposed to
[`List`](https://www.scala-lang.org/api/2.10.7/#scala.collection.immutable.List))
is important for efficiency. In Scala, the default `List` implementation is
immutable and each call would result in creating a new `List` object if `List`
were used. The same `ListBuffer` object may be reused and passed in each call so
that no intermediate `List` objects need to be created or destroyed. It’s
similar to using a
[`StringBuilder`](https://docs.oracle.com/javase/tutorial/java/data/buffers.html)
vs. a `String` in Java to build up a `String` in multiple steps.

### Results

```bash
$ scalac Weave.scala

$ scala Weave
items: List(List(a, b, c, d), List(1, 2, 3), List(X, Y))
weaved: List(a, 1, X, b, 2, Y, c, 3, d)
```

## Java version

The Java version uses a more conventional (and traditional in programming
languages such as Java) iterative approach, but performs the same operation
and yields the same results.

### Results

```bash
$ javac Weave.java

$ java Weave
items: [[a, b, c, d], [1, 2, 3], [X, Y]]
weaved: [a, 1, X, b, 2, Y, c, 3, d]
```
