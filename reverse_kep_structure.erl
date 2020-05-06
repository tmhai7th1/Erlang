-module(reverse_kep_structure).
-export([start/0]).

reverse_list([Head|Rest],Index,Lenght,Result) when is_list(Head) ->

    Value = reverse_list(Head,Index,Lenght,Result),
   
    reverse_list(Rest,Value,Lenght,Result);

reverse_list([Head|Rest],Index,Lenght,Result) when Index == Lenght->
        io:fwrite("-------------------------------~n"),
        
        io:fwrite("is_list Value: ~tp ~n",[Head]),
        Head;

reverse_list([Head|Rest],Index,Lenght,Result) ->
    io:fwrite("-------------------------------~n"),
    
    io:fwrite("Index: ~tp ~n",[Index]),
    io:fwrite("Lenght: ~tp ~n",[Lenght]),
    io:fwrite("Head: ~tp ~n",[Head]),
   reverse_list(Rest, 1 + Index, Lenght,Result);



reverse_list([],Index,Lenght,Result) ->
    Index.


reverse_item_list([Head|Rest],Result_list) ->
    reverse_item_list(Rest,[Head|Result_list]);

reverse_item_list([],Result_list) ->
    %io:fwrite("final Index: ~tp ~n",[Index]),
    Result_list.



start()->
    List = [1,2,[3,4,[5,6,7]],8,9],
    List1 = [1,2,3],
    Lenght =2,
    Index = 0,
    Result = 0,
    %lenght_List(Index,List1).
    %find_item_byindex(0,Lenght,List).
    %reverse_item_list(List1,[]).
  reverse_list(List,Index,Lenght,Result).
%convert_list_to_c(List1,[]).