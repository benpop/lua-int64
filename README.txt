Lua library for working with 64-bit integers.

Very likely requires C99  (for long long)  (enabled by default in the Makefile).

The library may compile to a dynamic shared library/bundle (.so) that you may require as a Lua module, or it may compile to a static library (.a) that you may link against another Lua library/bundle in order to use the C API functions.  For the latter case, a header file is included.

Some operations can store and retrieve a 64-bit integer in and from a void pointer or lua_Number, if the machine and Lua VM support it.

WARNING:  A number of the operations use low-level C hacks.  These may not work, and may not even throw an error if they don't work.  Lua is not supposed to crash, but when dealing with C or Lua's internals a crash is possible.  THE AUTHORS ARE NOT RESPONSIBLE FOR ANY DAMAGE OR INCONVENIENCE CAUSED BY THE USE OF THIS PROGRAM.

Supports Lua 5.1 and 5.2.

**benpop**
