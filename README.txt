Version: 7.0.2 (16-April-2017)

Add Py::Char ord() method to return the long value of a character.

Fix String::size() that could return twice the actual length.
This affected as_ucs4string() which would return a string with
its second half as uninitialised memory.

Fix setup.py for the Demo code to build all the required C++
code.
