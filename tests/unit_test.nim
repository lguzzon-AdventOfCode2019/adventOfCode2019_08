
import unittest

import adventOfCode2019_08
import adventOfCode2019_08/consts


suite "unit-test suite":
    test "getMessage":
        assert(cHelloWorld == getMessage())
