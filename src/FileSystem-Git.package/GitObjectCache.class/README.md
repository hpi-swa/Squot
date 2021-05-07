I keep Git objects of a GitRepository in memory so they need not be loaded twice.

Next to the mapping from hash to object, I keep a list of objects sorted by size (Associations with size -> object) and a total of the cached size. When this exceeds a threshold after another object was added, the largest object is evicted.