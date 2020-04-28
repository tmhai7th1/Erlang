-module(reverse_kep_structure).
-export([start/0]).



reverse_list([Head|Rest]) ->
    io:fwrite("-------------------------------~n"),
    %io:fwrite("Index: ~tp ~n",[Index]),
    io:fwrite("Head: ~tp ~n",[Head]),
    io:fwrite("Rest: ~tp ~n",[Rest]),
    Ischeck = is_list(Head) andalso lenght_List(0,Head) > 0,
    A = 0,
    if
        Ischeck ->
            io:fwrite("ResIscheckt: ~tp ~n",[Head]),
            List_T = convert_list_to_c(reverse_list(Head),[]),
            [List_T|reverse_list(Rest)];
        true ->
            List_T = convert_list_to_c(Rest,[]),
            [List_T|reverse_list(Rest)]
    end;
    %io:fwrite("reverse_list Head: ~tp ~n",[Head]),
    %Value = find_item_byindex(0,Lenght - Index,Result_List),
   % io:fwrite("reverse_list Value: ~tp ~n",[Value]),
   

reverse_list([]) ->
    %io:fwrite("final Index: ~tp ~n",[Index]),
    %io:fwrite("------------------------------- final Head ~tp ~n",[Result_List]),
    [].

find_item_byindex(Index,Lenght,[Head|Rest]) when is_list(Head) ->
    io:fwrite("------------------------------- when is_list(Head) ~n"),
    io:fwrite("is_list(Head) Index find_item_byindex: ~tp ~n",[Index]),
    find_item_byindex(Index,Lenght,Head);
   % io:fwrite("is_list(Head) Head find_item_byindex: ~tp ~n",[List]),
    %find_item_byindex (Index,Lenght,Rest);

 find_item_byindex(Int,Index,[Head|_]) when Index == Int ->
    io:fwrite("------------------------------- final Head ~tp ~n",[Head]),
        Head;

find_item_byindex(Int,Index,[_|Rest]) ->
    io:fwrite("------------------------------- ~n"),
    io:fwrite("find_item_byindex Int: ~tp ~n",[Int]),
    io:fwrite("find_item_byindex Value: ~tp ~n",[Index]),
    find_item_byindex(Int + 1,Index,Rest).

lenght_List(Index,[Head|Rest])->
    lenght_List(Index+1,Rest);

lenght_List(Index,[])->
    Index.


convert_list_to_c([City | Rest],Result_List) ->
    io:fwrite("-------------------------------~tp ~n",[City]),
 convert_list_to_c(Rest,[City|Result_List]);
convert_list_to_c([],Result_List) ->
    Result_List.



start()->
    List = [1,2,[3,4],6,7],
    List1 = [1,2,3],
    Lenght = 4,
    Index = 0,
    %lenght_List(Index,List1).
    %find_item_byindex(0,Lenght,List).
  reverse_list(List).
%convert_list_to_c(List1,[]).