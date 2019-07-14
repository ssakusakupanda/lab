# Description:
#   Build rule for Python and Numpy.

cc_library(
    name = "python",
    hdrs = select(
        {
            "@bazel_tools//tools/python:PY2": glob([
                "python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/include/python2.7/*.h",
                "python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/numpy/core/include/*.h",
            ]),
            "@bazel_tools//tools/python:PY3": glob([
                "python/3.7.4/Frameworks/Python.framework/Versions/3.7/include/python3.7m/*.h",
            ]),
        },
        no_match_error = "Internal error, Python version should be one of PY2 or PY3",
    ),
    includes = select(
        {
            "@bazel_tools//tools/python:PY2": [
                "python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/include/python2.7",
                "python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/numpy/core/include",
            ],
            "@bazel_tools//tools/python:PY3": [
                "python/3.7.4/Frameworks/Python.framework/Versions/3.7/include/python3.7m",
            ],
        },
        no_match_error = "Internal error, Python version should be one of PY2 or PY3",
    ),
    visibility = ["//visibility:public"],
)
