I am the base class for objects that can find artifacts in file trees.

Subclasses should implement the subclassResponsibilities and add a class initialize method
that invokes the class side #register method, to become available when artifacts are sought for.