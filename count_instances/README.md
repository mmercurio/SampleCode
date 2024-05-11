# Count Instances

While becoming reacquainted with Python after not touching it for many years, I decided to implement the following coding exercise (typically implemented in languages such as Java or C#) to keep count of the number of times a selection of classes have been instantiated. Specifically the criteria are:

1. A mechanism to count the number of times a set of classes have been instantiated.
2. The solution must be generic enough such that it can count instances of an arbitrary number of different classes.
3. The solution must be extensible such that defining new classes to be counted is trivially easy using standard OO principles. [I took liberties with "using standard OO principles."]
4. Demonstrate the solution by instantiating a number of different classes, and then output the name of the class followed by the number of instances created.

Additional "bonus" criteria:

1. Consider a mechanism that does not require inheritance of a common base class.
2. In addition to the number of instances created, also display the count of the number of instances that are still alive (i.e. reachable) when the program terminates.

## Goals

I was interested in exploring the following features of the Python language and standard libraries:

* implementing a class [decorator](https://docs.python.org/3/glossary.html#term-decorator) such that instances of classes to be counted could easily be decorated (i.e. annotated). This has the added benefit of making it easy to also count instances of third-party classes (e.g., from libraries). For example, assuming the decorator `count_instances` can be applied to classes whose instances are to be counted and tracked:

    ```python
    @count_instances
    class MyClass:
        # ...

    # Here, we apply count_instances to CoolClass, which is already defined and imported form another package.
    from some_cool_library import CoolClass
    count_instances(CoolClass)
    ```

    both `MyClass` and `CoolClass` will have their instances counted and tracked.

* Basic metaprogramming in Python by wrapping a class's `__init__` method to add the additional functionality needed to count and track instances. I make use of the [`functools`](https://docs.python.org/3/library/functools.html) module to help with this.
* [Weak References](https://docs.python.org/3/tutorial/stdlib2.html#weak-references) in Python and specifically, [WeakSet](https://docs.python.org/3/library/weakref.html#weakref.WeakSet).

## My solution

As mentioned above, the idea is to create a decorator which can be applied to class definitions, and also called on classes already defined, to start counting instances and tracking them.

The decorator wraps the `__init__` method on the target class to have its instances tracked, which causes new functionality to be added to new instances of the class. Specifically, new instances will be counted and a weak reference to the instance will be stored in a `WeakSet`. The count of instances created and the weak references for the class will be stored in a global [`dict`](https://docs.python.org/3/library/stdtypes.html#dict), where the key is the class and the value is a [tuple](https://docs.python.org/3/library/stdtypes.html#tuples) holding the count and the `WeakSet` of instances.

Executing the sample code (I tested under Python 3.8 and 3.12) yields the following results:

```shell
$ python count_instances.py
+new instance <class '__main__.Foo'>: #1 <__main__.Foo object at 0x1032570e0>
+new instance <class '__main__.Foo'>: #2 <__main__.Foo object at 0x103257110>
+new instance <class '__main__.Foo'>: #3 <__main__.Foo object at 0x103257140>
+new instance <class '__main__.Bar'>: #1 <__main__.Bar object at 0x103257170>
class Foo: 3 created. 3 alive: {<weakref at 0x10327e0c0; to 'Foo' at 0x103257110>, <weakref at 0x10327e110; to 'Foo' at 0x103257140>, <weakref at 0x10327e020; to 'Foo' at 0x1032570e0>}
class Bar: 1 created. 1 alive: {<weakref at 0x10327e160; to 'Bar' at 0x103257170>}
Foo #1 is no longer reachable
class Foo: 3 created. 2 alive: {<weakref at 0x10327e0c0; to 'Foo' at 0x103257110>, <weakref at 0x10327e110; to 'Foo' at 0x103257140>}
class Bar: 1 created. 1 alive: {<weakref at 0x10327e160; to 'Bar' at 0x103257170>}
Foo #2 is no longer reachable
class Foo: 3 created. 1 alive: {<weakref at 0x10327e110; to 'Foo' at 0x103257140>}
class Bar: 1 created. 1 alive: {<weakref at 0x10327e160; to 'Bar' at 0x103257170>}
Bar #1 is no longer reachable
class Foo: 3 created. 1 alive: {<weakref at 0x10327e110; to 'Foo' at 0x103257140>}
class Bar: 1 created. 0 alive: set()
```

## Final Thoughts

My goal was to make the solution as simple to understand and read as possible while exploring the ideas mentioned above. I specifically stayed away from concepts such as [Type Hints](https://peps.python.org/pep-0484/), proper [Unit Testing](https://docs.python.org/3/library/unittest.html), and further design abstractions (e.g., to avoid using the global variable) to keep the solution short and simple.
