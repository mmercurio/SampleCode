/**
 * MyHashTable is a simple implementation of a hashtable using arrays for the purposes of
 * demonstrating my ability (or inability!) to implement a hashtable from scratch.
 *
 *  Goals:
 *  1. "from scratch" meaning not relying on java.util or other utilities for help. Ideally
 *     only using what's available in java.lang.
 *
 *  2. support parameterized types (i.e., generics)
 *
 *  3. Very basic implementation with the following public operations:
 *     get, put, remove, contains, size.
 *
 *  If I spent more time, I would add:
 *  - unit tests.
 *  - ability to dynamically resize the map (i.e., number of buckets)
 *    based on a configured load factor.
 *  - support for more operations such as iterators.
 *  - stats for debugging and analysis (e.g., hash collisions and bucket length)
 *
 * Known issues:
 *  - NOT efficient. In particular the bucket size is fixed.
 *  - NOT well tested. No robust unit tests.
 *  - NOT thread safe!
 */

public class MyHashTable<K,V> {
    /** The default number of buckets at initialization. */
    static final int DEFAULT_BUCKET_SIZE = 1024;

    final private int bucket_size; // cannot resize buckets
    // using Object here so I can use simple array instead of an ArrayList or similar
    final private Object[] buckets;

    /** Number of entries in the hash table. */
    private int size = 0;

    /** Compute bucket index from hashCode */
    private int bucketIndex(int hashCode) { return hashCode % bucket_size; }

    /**
     * Obtain the BucketList for the corresponding hashcode.
     */
    @SuppressWarnings("unchecked")
    private BucketList<K,V> getBucketList(int hashCode) {
        // Cast okay because always instantiated as BucketList<K,V>
        return (BucketList<K,V>)buckets[bucketIndex(hashCode)];
    }

    public MyHashTable() {
        this(DEFAULT_BUCKET_SIZE);
    }

    public MyHashTable(int bucket_size) {
        this.bucket_size = bucket_size;
        this.buckets = new Object[bucket_size];
        for (int i = 0; i < bucket_size; i++) {
            buckets[i] = new BucketList<K,V>();
        }
    }

    public int getBucketSize() { return bucket_size; }

    public int getSize() { return size; }

    /**
     * Get the value using the specified key, if it exists in the table.
     * @param key
     * @return The value associated with the key or null if it doesn't exist
     */
    public V get(K key) {
        BucketList<K,V> bucketList = getBucketList(key.hashCode());
        return bucketList.get(key);
    }

    /**
     * Puts the value with the specified key into the hashtable, replacing any previous value with
     * the same key.
     * @param key
     * @param value
     * @return The previous value associated with key if it exists, else null.
     */
    public V put(K key, V value) {
        BucketList<K,V> bucketList = getBucketList(key.hashCode());
        V previousValue = bucketList.put(key, value);
        if (previousValue == null) {
            size++;
        }
        return previousValue;
    }

    /**
     * Remove the value with the specified key and return the value if present.
     * @param key
     * @return value removed or null if value not present.
     */
    public V remove(K key) {
        BucketList<K,V> bucketList = getBucketList(key.hashCode());
        V previousValue = bucketList.remove(key);
        if (previousValue != null) {
            size--;
        }
        return previousValue;
    }

    /**
     * Returns true if the specified key maps to a value in the hashtable.
     * @param key
     * @return True if key found, else false.
     */
    public boolean contains(K key) {
        BucketList<K,V> bucketList = getBucketList(key.hashCode());
        return bucketList.get(key) != null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        if (size > 0) {
            int nonEmptyBuckets = 0;
            for (int i = 0; i < bucket_size; i++) {
                BucketList<K,V> bucketList = getBucketList(i);
                if (bucketList.getSize() == 0) {
                    continue;
                }

                if (nonEmptyBuckets > 0) {
                    sb.append(", "); // to separate elements from multiple buckets if present.
                }
                sb.append(bucketList.toString());
                nonEmptyBuckets++;
            }
        }
        sb.append("]");
        return sb.toString();
    }

    String debugOutput() {
        StringBuilder sb = new StringBuilder();
        sb.append("HashTable bucketSize=").append(bucket_size);
        sb.append(" size=").append(size);
        sb.append("\nNon-empty buckets:");
        for (int i = 0; i < bucket_size; i++) {
            BucketList<K,V> bucketList = getBucketList(i);
            if (bucketList.getSize() == 0) {
                continue;
            }

            sb.append("\n").append(i);
            sb.append(" : size=").append(bucketList.getSize());
            sb.append(" : ");
            sb.append(bucketList.toString());
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        //testBucketList();
        testHashTable();
    }

    static void testHashTable() {
        System.out.println("Hello, testing MyHashTable.");

        System.out.println("Creating empty table with defaults.");
        MyHashTable<Integer,String> hashTable = new MyHashTable<Integer,String>();

        System.out.println("size = " + hashTable.getSize());
        System.out.println("bucket_size = " + hashTable.getBucketSize());

        System.out.println("empty hash table contains: " + hashTable);

        System.out.println("contains nonexistent key 1? " + hashTable.contains(1));
        System.out.println("getting nonexistent key 1? " + hashTable.get(1));

        System.out.println("putting key=1, value=this is one...");
        String value = hashTable.put(1, "this is one");
        System.out.println("Previous value? " + value);
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);
        System.out.println("contains key 1? " + hashTable.contains(1));
        System.out.println("getting key 1? " + hashTable.get(1));
        System.out.println(hashTable.debugOutput());

        System.out.println("Updating key1 with new value...");
        value = hashTable.put(1, "this is NEW one value");
        System.out.println("Previous value? " + value);
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);
        System.out.println(hashTable.debugOutput());


        System.out.println("\nputting key=99, value=ninety-nine");
        value = hashTable.put(99, "ninety-nine");
        System.out.println("Previous value? " + (value != null));
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);
        System.out.println(hashTable.debugOutput());


        System.out.println("\nputting key=1001, value=one thousand and one");
        value = hashTable.put(1001, "one thousand and one");
        System.out.println("Previous value? " + value);
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);
        System.out.println(hashTable.debugOutput());

        // Test hash collision
        Integer collision_key_1 = 1;
        Integer collision_key_1025 = 1025;
        System.out.println("\n\nTesting hash collision");
        System.out.println("hashCode for Integer 1 is " + collision_key_1.hashCode());
        System.out.println("hash bucket index for 1 is " + hashTable.bucketIndex(collision_key_1.hashCode()));
        System.out.println("hashCode for Integer 1025 is " + collision_key_1025.hashCode());
        System.out.println("hash bucket index for 1025 is " + hashTable.bucketIndex(collision_key_1025.hashCode()));

        hashTable.put(collision_key_1025, "collision value with 1025");
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);

        System.out.println("\n\nDebug output of hash table:");
        System.out.println(hashTable.debugOutput());

        // Test removing key 99
        System.out.println("\nRemoving key 99...");
        value = hashTable.remove(99);
        System.out.println("Previous value? " + value);
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);
        System.out.println(hashTable.debugOutput());

        // test removing nonexistent value
        System.out.println("\nRemove non-existent value 99");
        value = hashTable.remove(99);
        System.out.println("Previous value? " + value);
        System.out.println("size = " + hashTable.getSize());
        System.out.println("Contents: " + hashTable);
        System.out.println(hashTable.debugOutput());
    }

    static void testBucketList() {
        System.out.println("Hello, testing BucketList.");

        BucketList<String,String> myList = new BucketList<String,String>();
        System.out.println("Constructed empty BucketList, myList: " + myList);
        System.out.println("bucketList size: " + myList.getSize());

        myList.put("key1", "value for key 1");
        System.out.println("Added one value.");
        System.out.println("bucketList size: " + myList.getSize());
        System.out.println("myList: " + myList);

        myList.put("key2", "another value.");
        System.out.println("Added another value.");
        System.out.println("bucketList size: " + myList.getSize());
        System.out.println("myList: " + myList);

        System.out.println("\nLooking for key1...");
        String result = myList.get("key1");
        System.out.println("Found: " + result);

        System.out.println("Looking for key2...");
        result = myList.get("key2");
        System.out.println("Found: " + result);

        System.out.println("Looking for key that doesn't exist...");
        result = myList.get("does not exist");
        System.out.println("Found? " + (result != null));

        System.out.println("\nbucketList size: " + myList.getSize());
        System.out.println("Updating key1 with new value..");
        myList.put("key1", "NEW value for key 1");
        System.out.println("bucketList size: " + myList.getSize());
        System.out.println("myList: " + myList);

        System.out.println("\n\nRemoving key1...");
        myList.remove("key1");
        System.out.println("bucketList size: " + myList.getSize());
        System.out.println("myList: " + myList);

        System.out.println("Looking for key1 which was removed...");
        result = myList.get("key1");
        System.out.println("Found removed key1? " + (result != null));

        System.out.println("\n\nRemoving key2...");
        String removed = myList.remove("key2");
        System.out.println("bucketList size: " + myList.getSize());
        System.out.println("Removed: " + removed);
        System.out.println("myList: " + myList);

        System.out.println("Attempt to remove key not present...");
        removed = myList.remove("no such key");
        System.out.println("No such key removed? " + (removed != null));
    }

    static class BucketEntry<K,V> {
        final K key;
        V value;
        BucketEntry<K,V> next = null;

        public BucketEntry(K key, V value) {
            this.key = key;
            this.value = value;
        }

        public String toString() {
            return "<key=" + key + ", value=" + value + ">";
        }
    }

    static class BucketList<K,V> {
        private BucketEntry<K,V> head = null;
        private int size = 0;

        public int getSize() { return size; }

        /** Get the value by key.
         *
         * @param key the unique key to find in the list.
         * @return Returns value found, or null if not found.
         */
        public V get(K key) {
            BucketEntry<K,V> bucketEntry = getEntry(key);
            return bucketEntry != null ? bucketEntry.value : null;
        }

        /**
         * Get the BucketEntry for the specified key if it exists.
         *
         * @param key
         * @return The BucketEntry for the specified key or else null.
        */
        private BucketEntry<K,V> getEntry(K key) {
            BucketEntry<K,V> entry = null;
            if (head != null) {
                BucketEntry<K,V> current = head;
                do {
                    if (current.key.equals((key))) {
                        entry = current;
                    } else {
                        current = current.next;
                    }
                } while (entry == null && current != null);
            }
            return entry;
        }

        /**
         * Insert the entry with the specified key and value, replacing any previous entry with
         * the same key.
         *
         * @param key
         * @param value
         * @return Returns the previous value if any or null.
         */
        public V put(K key, V value ) {
            BucketEntry<K,V> previousEntry = this.getEntry(key);
            if (previousEntry != null) {
                V previousValue = previousEntry.value;
                previousEntry.value = value;
                return previousValue;
            }

            // else, adding a new value
            if (head == null) {
                head = new BucketEntry<K,V>(key, value);
            } else {
                BucketEntry<K,V> current = head;
                while (current.next != null) {
                    current = current.next;
                }
                current.next = new BucketEntry<K,V>(key, value);
            }
            this.size++;
            return null;
        }

        /**
         * Remove entry with specified key.
         * @param key
         * @return value of entry removed or null if entry not found.
         */
        public V remove(K key) {
            V value = null;
            if (head != null) {
                BucketEntry<K,V> current = head;
                BucketEntry<K,V> previous = null;
                do {
                    if (current.key.equals((key))) {
                        value = current.value;
                    } else {
                        previous = current;
                        current = current.next;
                    }
                } while (value == null && current != null);

                if (value != null) {
                    if (current == head) {
                        head = head.next;
                    } else {
                        previous.next = current.next;
                    }
                    size--;
                }
            }
            return value;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            BucketEntry<K,V> current = head;
            while (current != null) {
                sb.append(current.toString());
                if (current.next != null) {
                    sb.append(", ");
                }
                current = current.next;
            }
            return sb.toString();
        }
    }
}
