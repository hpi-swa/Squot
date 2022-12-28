I simultaneously walk through instances of the same object graph (snapshots) and send messages to my client about the things that I encounter. My client is usually a subinstance of SquotAbstractMergeGuide, the concrete subclass depends on what kind of object graph is being merged.

In other words, I am the extraction of the graph walking algorithm that is common to all merging of collections of objects. As such I deal with the reflection of objects and their references, and the fact that an object might be encountered multiple times within the same graph (if that graph is not in fact a tree).

It is not my responsibility to build merge objects that keep the information about differences and choices. That is the responsibility of my client.