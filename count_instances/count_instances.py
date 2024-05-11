from functools import wraps
from weakref import WeakSet

# _instances is a dict, tracking for each class, the number of instances created and alive.
#   - The key is the class being tracked.
#   - The value is a tuple, holding the count of instantiations of the class, and
#     a WeakSet holding the live instances (weak references to the instances).
_instances = {}

def count_instances(target):
    """Decorate a class to count and track its instances.
    target is the class to track.
    """
    # save the target class __init__ method because it's being replaced below
    target_init = target.__init__
    _instances[target] = (0, WeakSet())

    @wraps(target.__init__)
    def track_instance(self, *args, **kwargs):
        # Call the target class saved __init__ method and then track the new instance.
        target_init(self, *args, **kwargs)
        count, live = _instances[target]
        count += 1
        live.add(self)
        _instances[target] = (count, live)
        print(f"+new instance {target}: #{count} {self}")

    # Replace the target class __init__ method with the tracking function above
    # such that new instances of the class are tracked when instantiated.
    target.__init__ = track_instance
    return target

def show_counts():
    """Display counts of instances created, alive, and any live instances."""
    for cls, (count, live) in _instances.items():
        print(f"class {cls.__name__}: {count} created. {len(live)} alive: {live}")

@count_instances
class Foo:
    pass

@count_instances
class Bar:
    pass

class NotCounted:
    pass

f1 = Foo()
f2 = Foo()
f3 = Foo()
b1 = Bar()
nc1 = NotCounted()
show_counts()

assert _instances[Foo][0] == 3, "Foo count should be 3"
assert len(_instances[Foo][1]) == 3, "Foo should have 3 alive"
assert _instances[Bar][0] == 1, "Bar count should be 1"
assert len(_instances[Bar][1]) == 1, "Bar should have 1 alive"

f1 = None
print("Foo #1 is no longer reachable")
show_counts()
assert len(_instances[Foo][1]) == 2, "Foo should have 2 alive"

f2 = None
print("Foo #2 is no longer reachable")
show_counts()
assert len(_instances[Foo][1]) == 1, "Foo should have 1 alive"

b1 = None
print("Bar #1 is no longer reachable")
show_counts()
assert len(_instances[Bar][1]) == 0, "Bar should have 0 alive"
assert not _instances[Bar][1], "Bar should have 0 alive"  # don't like this 🤷
