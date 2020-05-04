-module(reverse_kep_structure).
-export([start/0]).

reverse_list([Head|Rest],Index,Lenght,Result) when is_list(Head) ->
    io:fwrite("-------------------------------~n"),
    io:fwrite("is_list Index: ~tp ~n",[Index]),
    io:fwrite("is_list Lenght: ~tp ~n",[Lenght]),
    io:fwrite("is_list Result: ~tp ~n",[Result]),
    
    if
        Index == Lenght ->
            io:fwrite("when is_list(Head) Head == Lenght Head: ~tp ~n",[Head]),
            Value = reverse_list(Head,Index,Lenght,Result),
            io:fwrite("when is_list(Head) Head == Lenght Head Value: ~tp ~n",[Value]),
            io:fwrite("when is_list(Head) Head == Lenght Head Index: ~tp ~n",[Index]),
            io:fwrite("when is_list(Head) Head == Lenght Head Lenght: ~tp ~n",[Lenght]),
            reverse_list([],Index,Lenght,Value);
        true->
            io:fwrite("Value Index != Lenght: ~tp ~n",[Result]),
            Value = reverse_list(Head,Index,Lenght,Result),
            reverse_list(Rest,Value,Lenght,Result)
    end;
   
reverse_list([],Index,Lenght,Result) when Index == Lenght->
        io:fwrite("Result Index == Lenght Result: ~tp ~n",[Result]),
        Result;

reverse_list([Head|Rest],Index,Lenght,Result) ->
    io:fwrite("-------------------------------~n"),
    io:fwrite("Index: ~tp ~n",[Index]),
    io:fwrite("Lenght: ~tp ~n",[Lenght]),
    io:fwrite("Head: ~tp ~n",[Head]),
    if
        Index == Lenght ->
            io:fwrite("Value Index == Lenght: ~tp ~n",[Head]),
            reverse_list([],Index,Lenght,Head);
        true->
            io:fwrite("Value Index != Lenght: ~tp ~n",[Result]),
            reverse_list(Rest,Index+1,Lenght,Result)
    end;


reverse_list([],Index,Lenght,Result)->
    io:fwrite("-------------------------------~n"),
    io:fwrite("Lenght: ~tp ~n",[Lenght]),
    io:fwrite("Index: ~tp ~n",[Index]),
    io:fwrite("Result: ~tp ~n",[Result]),
    Index.

start()->
    List = [1,2,[3,4,[5,6,7]],8,9],
    List1 = [1,2,3],
    Lenght =4,
    Index = 0,
    Result = 0,
    %lenght_List(Index,List1).
    %find_item_byindex(0,Lenght,List).
  reverse_list(List,Index,Lenght,Result).
%convert_list_to_c(List1,[]).