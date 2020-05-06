-module(tail_reserve).
-export([start/0]).

count_lenght([H|T], Len,Result,Len_Chid) when Len == 10->
    io:fwrite("Result~tp ~n: ",[H]),
    count_lenght(T, Len,H,Len_Chid);

count_lenght([H|T], Len,Result,Len_Chid) when is_list(H)->
    count_lenght(H,1+ Len,Result,1 + Len_Chid),
    Value = Len_Chid + Len,
    io:fwrite("Value Len_Chid~tp ~n: ",[H]),
    io:fwrite("Value Len~tp ~n: ",[Len]),
    io:fwrite("Value~tp ~n: ",[Value]),
    count_lenght(T, 1+ Value,Result,Len_Chid);

count_lenght([H|T], Len,Result,Len_Chid) ->
    io:fwrite("Level ~tp ~n: ",[Len]),
    io:fwrite("H ~tp ~n: ",[H]),
    io:fwrite("T~tp ~n: ",[T]),
    count_lenght(T,1 + Len,Result,Len_Chid);

count_lenght([], Len,Result,Len_Chid) ->
    io:fwrite("final ~tp ~n: ",[Len]),
    io:fwrite("final Result ~tp ~n: ",[Result]),
    Result.

start() ->
    List = [1,2,[3,8],9],
    count_lenght(List,0,0,0).