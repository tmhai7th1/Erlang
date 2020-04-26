-module(it_list_byindex).
-export([get_it_list_byindex/2]).

get_it_list_byindex(N,List) when N > 0 ->
    it_list_byindex(N-1, 0, List).

it_list_byindex(N, Index, [First|Rest])when N == Index ->
    First;


it_list_byindex(N, Index, [First|Rest])->
    it_list_byindex(N, Index+1, Rest).


