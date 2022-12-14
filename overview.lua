--@@ LAVA LANG @@--
--@@ THE FOLLOWING IS THE REQUIRED MINIMUM FEATURE SET @@--

--Variable types. Anything declared outside of functions or classes
--are in the global scope of the file and quivilent to Java's static keyword
int  x = 1                 --32bit Integer
long y = 2147483648        --64bit Integer
str test = "testing123"    --String (this would be a char* in C)
bool enable = false        --Boolean value initialized to false

int[3] array               --Defined array with len of 3
int[3] array = {0, 1, 2}   --Initialized array with len of 3

--Variable operators
x += 1           --Integer increment
test += "456"    --String concat
test[0]          --Strings can be treated as arrays
enable = !enable --Invert boolean

--Explicit void return function 
--The last statement is returned by default
void update()
    return
end

--Function with string return
str makeName(int id, str name)
    return name + id
end

--Simple if statement
if x > 10
    print(1)
end

--Conditional if-else chain
if x > 10
    print(0)
elif x > 5
    print(1)
else
    print(2)
end

--Simple for loop printing the value of i
for int i in 20
    print(i)
end

--Simple while loop
int x = 1
while x < 10
    print(x)
    x++
end

--Enum Token, replace keywords with the raw integer value
enum State
    PASS
    FAIL
end

--@@ THE FOLLOWING IS THE INHERITANCE FEATURE SET STRETCH GOAL @@--

Result res = Result()       --Instantiate class with omitted or empty constructor
Result res()                --Shorthand for instantiating a class

Response res("Not Found", 404) --Instantiate class with constructor arguments
print(res.s + res.x)           --Members can be accessed like lua

--Type checking. This should print since res is an instance of Result
if res is Result
    print("Match!")
end

--Basic Class
class Result() --These parens can be omitted if no arguments are needed
    --Create data string that is initialized to empty string
    str data = "testing"
    
    --Instance function returing this instance's data
    str getData()
        return data
    end
end

--Class inheritance and constructor with arguments
--By default args will be added as members (much like data classes)
class Response(str s, int x) : Result
    x = x * 2 --Argument members can be redefined
    int y = 5 --New members can also be defined in the top level class

    --Instance function getting the result of the parent class method
    --Function names matching the parent will automatically override
    str getData()
        --Returns the parent class result of getData() with the contact of the member s
        return super.getData() + s
    end
end

--@@ THE FOLLOWING ARE EXTRA WISHLIST STRETCH GOALS @@--

define MAX_INT 2147483647 --Define constant globals. These are replaced with their raw value at compile time

import gui --Import enitre source files
import Widget from gui --Import specific classes or functions

int[..] list;              --Growing array (a list)
list.add(5)                --Add value to the list
list += 5                  --Shorthand value add

{int} map                  --Shorthand map definition with assumed key type of str
str{int} map               --Defined map with key of str and value of int
str{int} map = {abc:10}    --Initialized map with key and value pairs

map.abc = 5                --Assigning the abc key to 5
map.xyz = 100              --Defining and assiging xyz to the value of 100

--For loop ranges (prints from 4 to 20, 16 iterations)
for int i in 4..20
    print(i)
end

--For loop range and step (prints from 4 to 20 in 2 increments, 8 iterations)
for int i in 5..20:2
    print(i)
end

--For each loop (works with lists and arrays)
for int i in list
    print(i)
end

--Shorthand conditional statement
if x > 10 : print(0) : x > 5 : print(1) ; print(2)

--Shorthand for each loop
list.in(i > print(i)) --Requires non statically defining the type
list.in(i > print(i) : print(i + 1)) --Multiple statements in shorthand statement

--Tenary operator
bool state = true
int val = state ? 1 : 0

str msg => "hello"              --Shorthand function def with no arguments
int area(int w, int h) => w * h --Shorthand function def with arguments

--Defining an interface
trait Message
    str data --Defining members that must exist in the implementing class
    int len
    str getData()
end

--Passing anonymous trait/func to function.
--Arguments can be omitted and can accept a built in func type
getMessage(=> "hello");
int getMessage(func fn)
    return fn.call()
end

--Passing defined function structure with traits.
--The passed lambda function must conform to the defined trait method structure
--This only works for traits with one method with the given argument length (2 in this case)
getMessage(int w, int h > w * h);
int getMessage(Area area)
    return area.get()
end
--Trait used in the getMessage function definition
trait Area
    int get(int w, int h)
end

--@@ THE FOLLOWING ARE UNDECIDED STRETCH GOALS @@--

--Class member visibility (members are public by default (this may potentially change))
class Secret(pri:str password, pri:int salt)
    --Public member function returning private values
    --If members are private, they must be accessed via member functions
    str get() => password + salt
    str decode(int hash, int salt) => hash*salt
end

--Calling super classes with data from child
class Parent(str s)
    str getName() => s

    void update() --Void methods can omit the end if nothing is needed in the body
end

--Shorthand way of calling super method of the same name
class Test() : Parent()
    str getName() => @ + " name" --Calls super method with the same name
end

--Values a and b are passed via the super method to the parent
--This value can then be accessed by the parents getName function
class Child(str a, str b) : Parent()
    super(a + b)

    str getName() => super.getName()
end

--Shorthand super value class passing
class Child(str a, str b) : Parent(a + b)
    str getName() => super.getName()
end

--Appending the required parent arguments for the child class
--This allows ChildWithVars to omit (int x, int y, int w, int h)
class ChildWithVars(str id) := ParentWithVars()

end

class ParentWithVars(int x, int y, int w, int h)

end

--This is transpiled to:
class ChildWithVars(str id, int x, int y, int w, int h) : ParentWithVars()
    super(x, y, w, h)
    str id = ""
end
