---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by apple.
--- DateTime: 2019-03-26 16:19
---
require("lib.func") -- 导入外部函数
ModuleT.Fun1()

function foo()
    print("this is function")
end
--系统函数
print(os.date())
print(math.sin(100))

--带参数函数
function test(a,b)
    print(a,b)
end
test(100,1000)

--返回值函数
function test1(a,b)
    return a,b
end
c,d = test1(100,9000)
print(c,d)

--多值返回
local s,e = string.find("hello world","hello")
print(s,e)

function foo()
    return "a","b"
end
--在表达式中调用时，只保留一个结果
b = "it is: " .. foo()
print(b)
--多重赋值
local x1,x2 = foo()
print(x1,x2)

print("4",foo()) --"4" a b
print(foo(),"50") --a 50

--表构造
t = {foo()}
print(t[1],t[2])

-- t1 = {foo(),"c"} --t = {a,c}
 t2 = {"c",foo()} --t = {c,a,b}
for i, v in ipairs(t2) do
    print(i,v)
end

local f = string.find
local a = {"hello", "e"}
c,d = f(table.unpack(a)) --等价于string.find("hello","e")
print(c,d)

--多加一个括号，可以强制只返回一个结果
print((foo()))

--[[参数列表中的三个点(...)表明函数foo是可变参数，在函数内部，可以通过
表达式...来获取实际传递的参数,表达式...被称为可变表达式，它的行为与"返回多个结果的函数类似"
--]]
function show(x,y,z)
    print(x,y,z)
end
function show1(...)
    local x,y,z = ...
    print(x,y,z)
end
show(1,2,3)
show1(1,2,3)

--可变参数也可以有任意个数的固定参数，但固定参数必须出现可变参数之前
function fwrite(fmt, ... )
    return io.write(string.format(fmt, ... ))
end
print(fwrite("%d%d",4,5))

--在函数内部也可以通过{ ... }来收集和遍历所有的参数
--可变参数
function sum( ... )
    local s = 0
    for i, v in ipairs({ ... }) do
      s = s + v
    end
    return s
end
su = sum(1,2,3,4,5,6,7,78)
print(su)
--可变参数中是否存在nil
function has_nil( ... )
    local arg = table.pack(...)
    for i = 1, arg.n do
        if arg[i] == nil then
            print("has nil")
            return true
        end
        print("has not nil")
        return false
    end
end
has_nil(1,2,3,4,nil)
--注意：如果可变参数中不可能有nil值，则建议使用 { ... }而不是table.pack(...),因为前者更简洁，速度更快






