Version: 7.1.5 (6-feb-2021)

Replace use of deprecated PyUnicode APIs with the supported version.

The class Py::String functions that used deprecated PyUnicode APIs
that have no replacements are not available for python 3.9 and later:

    const Py_UNICODE *unicode_data() const;
    unicodestring as_unicodestring() const;

Replace build-all.sh and build-all.cmd with build-all.py that can handle the build matrix.
Add limited API builds for all possible combinations.

Note: Python 3.9 has a bug that prevents use of the limited API until this bug is fix and shipped:
https://bugs.python.org/issue43155 for details.
The worksround is to set Py_LIMITED_API to use python 3.8.
