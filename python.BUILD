# Description:
#   Build rule for Python and Numpy.

cc_library(
    name = "python",
    hdrs = select(
        {
            "@bazel_tools//tools/python:PY2": glob([
                "python@2/2.7.15/Frameworks/Python.framework/Versions/2.7/include/python2.7/*.h",
                "numpy/1.15.2/lib/python2.7/site-packages/numpy/core/include/numpy/*.h",
            ]),
            "@bazel_tools//tools/python:PY3": glob([
                "python/3.7.0/Frameworks/Python.framework/Versions/3.7/include/python3.7m/*.h",
                "numpy/1.15.2/lib/python3.7/site-packages/numpy/core/include/numpy/*.h",
            ]),
        },
        no_match_error = "Internal error, Python version should be one of PY2 or PY3",
    ),
    includes = select(
        {
            "@bazel_tools//tools/python:PY2": [
                "python@2/2.7.15/Frameworks/Python.framework/Versions/2.7/include/python2.7",
                "numpy/1.15.2/lib/python2.7/site-packages/numpy/core/include",
            ],
            "@bazel_tools//tools/python:PY3": [
                "python/3.7.0/Frameworks/Python.framework/Versions/3.7/include/python3.7m",
                "numpy/1.15.2/lib/python3.7/site-packages/numpy/core/include",
            ],
        },
        no_match_error = "Internal error, Python version should be one of PY2 or PY3",
    ),
    visibility = ["//visibility:public"],
)
