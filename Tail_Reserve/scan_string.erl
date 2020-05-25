-module(scan_string).
-import(lists,[sublist/2]). 
-import(lists,[nthtail/2]).
-export([start/0]).

division_number([],List,_) -> 
    List;

division_number([Head|Tail],List,Index) ->
   
    {Type,Value} = detectvalue(Head),
    io:format("Index: ~p ~n",[Index]),
    case Type of
        multiplication ->
            {Pre_Value,Left} =  itemandtailbyindex(List,Index),
            io:fwrite("sublist: ~p~n",[Pre_Value]),
            io:format("Left: ~p ~n",[Left]);
        _ ->
            io:format("Value: ~p ~n",[Value])
    end, 
    io:format("Index: ~p ~n",[Index]),
    [Head|division_number(Tail,List,Index + 1)].

itemandtailbyindex([Head|Tail], List, I ,Index) when I =:= Index -1  ->
    itemandtailbyindex(Tail,Tail,I+1,Index);

itemandtailbyindex([Head|_],List,Index,Index) ->
    {Head,List};

itemandtailbyindex([Head|Tail],List,I,Index) ->
    itemandtailbyindex(Tail,List,I+1,Index).

itemandtailbyindex(List,Index) ->
    itemandtailbyindex(List,[],0,Index).

 detectvalue(Value) ->
    case Value of 
        {integer,_,Number} ->
            {integer,Number};
        {Char,_} ->
            case Char of
                '*' ->
                    {multiplication,Char};
                '/' ->
                    {division,Char};
                '+' ->
                    {addition,Char};
                '-' ->
                    {subtracts,Char}
            end
          
    end.
start() ->
    String = "2 + 2 * 2 + 2 / 2",
    %String = remove_whitespace(StringChar),
    %String = "[1,2,3].",
    {ok, Ts, _} = erl_scan:string(String),
    io:fwrite("sublist: ~p~n",[sublist(Ts,2)]),
    division_number(Ts,Ts,0),
    io:format("Ts: ~p ~n",[Ts]).
   %{ok, ListAST} = erl_parse:parse_exprs(Ts),
    %io:format("ListAST: ~p ~n",[ListAST]).
