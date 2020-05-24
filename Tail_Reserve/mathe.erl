-module(mathe).
-export([start/0]).

mathe([]) -> 
    0;
mathe([Head|Tail]) -> 
    mathe(Tail).

div_number([],Result) -> 
    Result;

div_number([47|Tail],Result)-> 
    io:format("Result : ~p ~n",[Result]),
    io:format("Tail : ~p ~n",[Tail]),
    div_test(Result,Tail);
   % div_number(Tail,Result);

div_number([Head|Tail],Result) -> 
   % io:format("Head : ~p ~n",[Head]),
   div_number(Tail,[Head|Result]).
    
div_test([Head|Tail],[TT|TTail]) ->
    
    io:format("Head : ~p ~n",[Head]),
    io:format("TT : ~p ~n",[TT]).

division_of_numerator(A,B) ->
    [A/B].

division(_,[]) -> 
    [];

division(Pre_Node,[47|Tail]) ->
    A = division_of_numerator(Pre_Node,Tail),

    io:format("Pre_Node : ~p ~n",[A]);

division(Pre_Node,[Node|Tail]) ->
    division(Node,Tail).    

division([Head|Tail]) ->
    division(Head,Tail).


remove_whitespace([]) -> [];

remove_whitespace([32|Tail]) ->
    remove_whitespace(Tail);

remove_whitespace([Head|Tail]) ->
    [Head|remove_whitespace(Tail)].  

quicksort(_,[],_) -> [];

quicksort(Pre_Node,[47|Tail],Pre_List) ->
    A = division_of_numerator(Pre_Node,Tail),
    io:format("Re : ~p ~n",[Pre_List]),
    io:format("Tail : ~p ~n",[Tail]),
    io:format("Pre_Node : ~p ~n",[A]);


quicksort(Pre_Node,[Head|Tail],Pre_List) ->
    Re = Pre_List ++  [Pre_Node],
    io:format("Re : ~p ~n",[Re]),
    quicksort(Head,Tail,Re).

quicksort([Pivot|Rest]) ->
    quicksort(Pivot,Rest,[]).

mathel([],_,_) ->
        [];

mathel([],_,_) ->
    [];
mathel([A,47,C|Tail],Left,Right) ->
    io:format("Pre_Node : ~p~n",[Left]),
    io:format("Next_Node : ~p~n",[Right]),

    List_Right= Tail,
    R = division_of_numerator(A,C),

    Result = Left ++ R ++ List_Right,
    io:format("Result : ~p~n",[Result]),
    mathel(Result,Left,List_Right);


mathel([A,B,C|Tail],Left,Right) ->
    io:format("A : ~p~n",[A]),
    io:format("B : ~p~n",[B]),
    io:format("C : ~p~n",[C]),
    List_Left = Left ++ [A] ++ [B] ++ [C],
    List_Right= Right -- [A] -- [B] -- [C],
    mathel(Tail,List_Left,List_Right).

mathel(List) ->
    mathel(List,[],[]).


division_number([Head|Tail]) ->
    division_number(Tail,Head,Tail).

division_number([],_,_) ->
[];

division_number([47|Tail],[Head_L|Left],[Head_R|Right]) ->
    io:format("Head_L : ~p~n",[Left]),
    io:format("Right : ~p~n",[Right]),
    R = division_of_numerator(Head_L,Head_R),
    

division_number([Head|Tail],Left,[Head|Right]) ->
    io:format("Left : ~p~n",[Left]),
    io:format("Right : ~p~n",[Right]),
    io:format("C : ~p~n",[Head]),
    division_number(Tail,Left,Tail).



start() ->
    List = "2 / 2 * 2 + 3 / 2",
    T = remove_whitespace(List),
    %A = div_number(T,[]),
    %B = division(T),
    io:format("T : ~p ~n",[T]),
    C = division_number(T),
    io:format("Div : ~p ",[C]).