--REQUIRED FEATURES--
int  x = 1                 --32bit Integer
long y = 2147483647        --64bit Integer
str test = "testing123"    --String (this would be a char* in C)
bool enable = false        --Boolean value with, initialized to false

int[3] array               --Defined array with len of 3
int[3] array = {0, 1, 2}   --Initialized array with len of 3

--Explicit void return function
void update()
    return
end

--Function with string return
str makeName(int id, str name)
    return name + id
end

--Basic Class
class Result
    --Create data string that is initialized to empty string
    str data = ""
    
    --Instance function returing this instance's data
    str getData()
        return data
    end
end

--Class inheritance
class Response extends Result
    --Instance function getting the result of the parent class method
    str getDataOther()
        return getData()
    end
end

--Simple for loop printing the value of i
for int i in 20
    print(i)
end

--Simple while loop
while x < 10
    print(x)
end

--Enum Token, replace keywords with the raw integer value
enum State
    PASS
    FAIL
end

--STRETCH GOALS

int[..] list;              --Growing array (a list)
list.add(5)                --Add value to the list
list += 5                  --Shorthand value add

{int} map                  --Shorthand map definition with assumed key type of str
str{int} map               --Defined map with key of str and value of int
str{int} map = {abc:10}    --Initialized map with key and value pairs

map.abc = 5                --Assigning the abc to 50
map.xyz = 100              --Defining and assiging xyz to the value of 5

str msg => "hello"              --Shorthand function def with no arguments
int area = int w, int h > w * h --Shorthand function def with arguments

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
int getMessage(TArea area)
    return area.get()
end
--Trait used in the getMessage function definition
trait TArea
    int get(int w, int h)
end
