Version 7.0.0 (15-Aug-2016)

Warning: This version fixes a number of problems that require source incompatible changes.

However by defining PYCXX_6_2_COMPATIBILITY the V6.2.x API is restored.
This is not recommended for new code.

The first version of python3 that is supported is 3.3.

A special thanks goes to Benjamin Webb, working at the US Army
Engineer Research and Development Center, who has contributed to
the design and testing of this release. 7.0.0 is better for his work.

New source file needs to built: Src/cxx_exceptions.cxx.
This file implements the new exception handling features.

Fix the type used for lengths and sequence indexes to use Py_ssize_t.
This will require sources changes for users of PyCXX.

Implement smart handling of Exceptions between C++ and Python. 
You can now catch exceptions in C++ by type that are raised in C++ or Python.

All builtin exceptions are support and are user defined exceptions.

The base exception type is now BaseException not Exception.
To upgrade source code replace all use of Exception with BaseException.

The documentation has been updated to describe the new exception features.

The supportSequence, supportMapping, supportNumber etc functions
now take a bit mask that defines which specific callbacks are handled.
