# erlang-study
erlang-study for worktile


## 环境搭建
https://worktile.com/project/6ab72269893943d98f11e30080f75dc9/page/065b281d10804baea8c65c654101e633

## 第一章 并发

Pid = spawn(ModuleName,FunName,[Arg1,Arg2]).

Pid ! Msg

receive
 {From,Message} ->
 ...
end


## 第二章 Erlang 速览
abc = 123.
hello.erl

c(hello).
erlc hello.erl

erl -noshell -s hello start -s init stop

afile_serevr.erl、afile_client.erl.

## 第三章 顺序编程

X = 20.
X + 20. % and this is comment

2 + 3 * 4.

X = 123456789.
X*X*X*X*X.
X = 1234.


X = (2+4).
Y = 10.

5/3.
4/2.

原子 atom
abc 'abc'

元组 tuple

Person = {person,{name,joe},{height,1.82},{footsize,42}}.

F = {firstname,joe}.
L = {lastname,armstrong}.
P = {person,F,L}

Point = {point,10,45}.
{point,X,Y} = Point.
X.
Y.
{point,C,C} = Point.

Point1 = {point,25,25}.
{point,C,C} = Point1.

列表
Drawing = [{square,{10,10},10},12].
ThingsToBuy = [{apples,10},{pears,6},{milk,3}].
ThingsToBuy1 = [{oranges,4},{newspaper,1}|ThingsToBuy].
[Buy1|ThingsToBuy2] = ThingsToBuy1.
[Buy2,Buy3|ThingsToBuy3] = ThingsToBuy2.

Name = "Hello".
[1,2,3].

[83,117,114,112,114,105,115,101].
[1,83,117,114,112,114,105,115,101].

I = $s.

X = "a\x{221e}b".

X = [97,98,99].

{X,abc} = {123,abc}.

{X,Y,Z} = {22,def,"cat"}.

## 第四章 模块与函数

geometry.erl

c(geometry).

geometry:area({rectangle,10,5}).

geometry:area({square,3}).

pwd().
ls().
cd(Dir).


Buy = [{oranges,4},{newspaper,1},{apples,10},{pears,6},{milk:3}].

c(shop).
c(shop1).
shop1:total([]).
shop1:total([{milk,3}]).
shop1:total(Buy).

fun 函数
Double = fun(X) -> 2*X end.
Double(2).

Hypot = func(X,Y) -> math:sqrt(X*X + Y*Y) end.
Hypot(3,4).
Hypot(3).

TempConvert = fun({c,C}) -> {f,  32 + C*9/5};
                  ({f,F}) -> {c, (F-32)*5/9}
              end.
TempConvert({c,100}).
TempConvert({f,212}).


L = [1,2,3,4].
lists:map(fun(X) ->2*X end,L).

Fruit = [apple,pear,orange].
MakeTest = fun(L) -> (func(X) -> lists:member(X,L) end) end.
IsFruit = MakeTest(Fruit).
IsFruit(pear).
IsFruit(dog).

定义自己的控制抽象
lib_misc.erl
lib_misc:for(1,10,fun(I)->I*I end).

列表处理
mylists.erl
mylist:sum([1,3,10]).

mylist:map(fun(X) ->2*X end,[1,2,3,4,5]).

shop2.erl

列表推倒

L = [1,2,3,4,5].
lists:map(fun(X) -> 2*X end,L).

[2 * X || X <- L].

[F(X) || X <- L]

快速排序 Quicksort lib_misc:qsort
毕达哥拉斯三元数组 lib_misc:pythag

内置函数
list_to_tuple([12,cat,"hello"]).
time().

关卡

max(X,Y) when X > Y ->X;
max(X,Y) -> Y.

f(X,Y) when is_integer(X),X > Y, Y < 6 -> ...

case 和 if 表达式

case Expression of
  Pattern1 [when Guard1] -> Expr_seq1;
  Pattern2 [when Guard2] -> Expr_seq2;
end
可以通过模式匹配

if
 Guard1 ->
  Expr_seq1;
 Guard2 ->
   Expr_seq2;
 ...
end

构建自然顺序的列表

some_func([H|T],...,Result,...) ->
 H1 = ... H ...,
 some_func(T,[H1|Result]);
some_func([],...,Result,...) ->
 {...Result...}

List ++ [H].


## 第五章 记录与映射组

-record(Name,{
    Key1 = Default1,
    Key2 = Default2,
    ...
    Key3,% 相当于 Key3 = undefined
    ...
})

records.hrl

rr("records.hrl").

#todo{}.

X1 = #todo{status=urgent,text="fix errata in bool"}.
X2 = X1#todo{status=done}.

提取字段
#todo{who=W,text=Txt} = X2.
W.
Txt.

X2#todo.text.


映射组  map

#{Key1 Op Val1，Key2 Op Val2 ... KeyN Op ValN}. Op 是 => 或者 :=

F1 = #{a => 1,b=>2}.
Facts = #{{wife,fred}=>"Sue",{age,fred} =>45,...}.

F2 = #{b=>2,a=>1}.

F1 = F2.

F3 = F1#{c => xx}.
F4 = F1#{c := 3}.

模式匹配和内置函数 maps:



## 第六章 顺序程序的错误处理

exit(Why).

throw(Why).

error(Why).

try FuncOrExpressionSeq of % of 可以省略
  Pattern1 [when Guard1] -> Expressions1;
  Pattern2 [when Guard2] -> Expressions2;
  ...
catch
  ExceptionType1:ExPattern1 [when ExGuard1] -> ExExpressions1;
  ExceptionType2:ExPattern2 [when ExGuard2] -> ExExpressions2;
  ...
after　% after 可以省略
  AfterExpressions
end

## 第七章 二进制型与位语法

<<5,10,20>>.
<<hello>>.
<<65,66,67>>.

list_to_binary(L).

Bin1 = <<1,2,3>>.
Bin2 = <<4,5>>.
Bin3 = <<6>>.

list_to_binary([Bin1,1,[2,3,Bin2],4|Bin3]).

term_to_binary(Term).
binary_to_term(Bin).

位语法

M = <<X:3,Y:7,Z:6>>.

位语法表达式构建二进制型或者位串


## 第八章 Erlang 顺序编程补遗
apply(Mod,Func,[arg1,Arg2,...,ArgN]). 等价于 Mod:Func(arg1,Arg2,...,ArgN).

算数表达式

元数 函数所拥有的参数数量

sum(L) -> sum(L,0).

sum([],N) -> N;
sum([H|T],N) -> sum(T,H+N).


属性
-AtomTag()   -recode 和-include 不属于属性

-module(moduleName).
-import(Mod,[Name1/Arity1,Name2/Arity2,...]).
-export([Name1/Arity1,Name2/Arity2,...]).  abc.erl
-compile(Options).   % -compile(export_all).
-vsn(Version).
-author('xxxx@xxxx.com').
-behavior(module).
-define(HELLO, 5).

-SomeTag(Value).

attrs:module_info().

块表达式
begin
  Expr1,
  ...
end


动态代码载入
someModule:someFunction(...)

b.erl a.erl

函数引用

square(X) ->

宏定义
-define(Constant,Replacement).
-define(Func(Var1,Var2,...Var),Replacement).


?MacroName
预定义宏 ?FILE ?MODULE ?LINE

宏控制流
-ifdef(Macro).

-undef(Macro).

-else

-endif

m1.erl


模式的匹配操作符

func1([{tag1,A,B}|T]) ->
  f(....,{tag1,A,B},....)

func1([{(tag1,A) = Z1,B}|T] = Z2) ->
  f(....,Z2,....)
  g(....,Z1,....)





进程字典

put(x,20)

引用 make_ref().

比较数据类型
X > Y
X < Y
X =< Y
X >= Y

X == Y

X /= Y

X =:= Y 完全相等
X =/= Y 完全不等


_变量

## 第九章 类型


walks.erl

-spec

-type

预定义类型

-type term().

-type boolean().

-type byte().

-type char().

....

dialyzer test1.erl


## 第10章　编译和运行程序

设置载入代码的路径

code:get_path().

code:add_patha(Dir).
code:add_pathz(Dir).

.erlang 文件

erl -pa Dir1 -pa Dir2 .... -pz DirK1 -pz DirK2


# 并发和分布式程序 第三部分

## 第11章 现实世界中的并发

## 第12章 并发编程

Pid = spawn(Mod,Func,Args).
Pid = spawn(Func).
Pid ! Message

receive ... end

receive
    Pattern1 [when Guard1] ->
        Expression1;
    Pattern2 [when Guard2] ->
        Expression2;
    ...
after T ->
    Expression
end

area_server0.erl

Pid = spawn(area_server0,loop,[]).
Pid ! {rectangle,6,10}.
Pid ! {square,12}.

Pid = spawn(area_server1,loop,[]).
area_server1.rpc(Pid,{rectangle,6,10}).
area_server1.rpc(Pid,socks).

stimer.erl 定时器

注册进程

register(area,Pid).

area ! {rectangle,4,5}.

clock.erl 模拟时钟


查看 area_server_final.erl 尾递归的
loop 函数必须在最后

spawn(Func)  spawn(MFA)


## 第13章 并发程序中的错误

任其崩溃
让其他进程修复错误

进程
普通进程和系统进程  process_flag(trap_exit,true)
连接
A B 相互连接，其中任何一个终止会发错误信号
监视
监视是单向的
消息和错误信号
错误信号的接受
显示错误信号
不可捕捉的错误信号

P1  call link(P3)

-spec spawn_link(Fnc) -> Pid
-spec spawn_link(Mod,Fuc,Args) -> Pid


-spec spawn_monitor(Fnc) -> Pid
-spec spawn_monitor(Mod,Fuc,Args) -> Pid

{'DOWN',Ref,process,Pid,Why}

-spec link(Pid) -> true
-spec unlink(Pid) -> true

-spec erlang:monitor(process,Item) -> Ref  Item 可以是进程 Pid 或者注册名称

-spec exit(Why) -> none()  向连接的所有进程发送 Why 的退出信号  监视他的进程发送 DOWN消息
-spec exit(Pid,Why) ->true


容错式编程
lib_misc.erl

F = fun() ->
        receive
            X -> list_to_atom(X)
        end
    end.
Pid = spawn(F).

lib_misc:on_exit(Pid,fun(Why) ->
                        io:format("~p died with:~p~n",[Pid,Why])
                     end).


## 第14章 分布式编程

socket_dist/kvs.erl

kvs:start().
kvs:store({location,joe},"Stockholm").
kvs:store(weather,raining).
kvs:lookup({location,joe}).
kvs:lookup(weather).

erl -sname hf
kvs:start().
kvs:lookup(weather).

erl -sname hj
rpc:call('haifeng@haifeng-mac',kvs,store,[weather,fine]).
rpc:call('haifeng@haifeng-mac',kvs,lookup,[weather]).


erl -name hf -setcookie abc
erl -name hj -setcookie abc

rpc:call(Node,Mod,Function,Args).

-spec spawn(Node,Func)->Pid

-spec spawn(Node,Mod,Func,Args)->Pid

-spec spawn_link(Node,Func)->Pid

-spec spawn_link(Node,Mod,Func,Args)->Pid

远程分裂示例

dist_demo.erl

cookie 保护系统

$HOME/.erlang.cookie




