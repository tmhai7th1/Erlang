-module(it_list_byindex).
-export([get_it_list_byindex/2,start/0]).

get_it_list_byindex(N,List) when N > 0 ->
    it_list_byindex(N-1, 0, List).

it_list_byindex(N, Index, [First|_])when N == Index ->
    First;

it_list_byindex(N, Index, [_|Rest])->
    it_list_byindex(N, Index+1, Rest).


start() ->
    List = [1,2,[3,4,[5,6,7],8],9],
    get_it_list_byindex(1,List).
