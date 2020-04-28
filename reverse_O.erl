-module(reverse_O).
-export([convert_list_to_c/1,start/0]).

convert_to_c({Name, {f, Temp}}) ->
    io:fwrite("hello ~n"),
 {Name, {c, trunc((Temp - 32) * 5 / 9)}};

convert_to_c({Name, {c, Temp}}) ->
io:fwrite("view ~n"),
 {Name, {c, Temp}}.

convert_list_to_c(List) ->
Add_3 = fun(X) -> X + 3 end,
 lists:map(fun convert_to_c/1, List).


start()->
   List = [{1, {c, -10}}, {2, {f, 70}},
    {3, {c, -4}}, {4, {f, 28}}, {5, {f, 36}}],
    convert_list_to_c(List).