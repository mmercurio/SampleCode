# MyHashTable

`MyHashTable` is a simple implementation of a
[hash table](https://en.wikipedia.org/wiki/Hash_table) in Java using arrays for the purposes of
demonstrating my ability (or inability!) to implement a hash table "from scratch using arrays."

Goals:

1. "from scratch" meaning not relying on `java.util` or other utilities for help.
Ideally, using only what's available in `java.lang`.

2. support parameterized types (i.e., generics)

3. Very basic implementation with the following public operations: get, put, remove, contains, size.

If I spent more time, I would add:

- unit tests.
- ability to dynamically resize the map (i.e., number of buckets) based on a configured load factor.
- support for more operations such as iterators.
- stats for debugging and analysis (e.g., hash collisions and bucket length)

## Known Issues

This implementation is only a simple example and has some serious issues.
Specifically, it is:

1. NOT efficient. In particular the bucket size is fixed.
2. NOT well tested. No robust unit tests.
3. NOT thread safe!

