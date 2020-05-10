-module(tree).
-export([start/0,empty/0]).

empty() ->
    {node,'nil'}.

insert(Key,Val,{node,'nil'}) ->
    {node,{Key,Val,{node,'nil'},{node,'nil'}}};

insert(NewKey,NewVal,{node,{Key,Val,Smaller,Larger}}) when NewKey < Key ->
    {node,{Key,Val,insert(NewKey,NewVal,Smaller),Larger}};

insert(NewKey,NewVal,{node,{Key,Val,Smaller,Larger}}) when NewVal> Key ->
    {node,{Key,Val,Smaller,insert(NewKey,NewVal,Larger)}};

insert(Key,Val,{node,{Key,_,Smaller,Larger}}) ->
    {node,{Key,Val,Smaller,Larger}}.

lookup(_,{node,'nil'}) ->
    undefine;

lookup(Key,{node,{Key,Val,_,_}}) ->
    io:fwrite("Key,{node,Key,Val,_,_} ~n"),
    {ok,Val};

lookup(Key, {node, {NodeKey,_, Smaller,_}}) when Key < NodeKey ->
    io:fwrite("Smaller: ~tp ~n",[Smaller]),
    lookup(Key, Smaller);
lookup(Key, {node, {_, _, _, Larger}}) ->
    io:fwrite("Larger: ~tp ~n",[Larger]),
    lookup(Key, Larger).

start()->
    NodeRoot = empty(),
    T1 = insert("Jim Woodland", "jim.woodland@gmail.com",NodeRoot),
    T2 = insert("Mark Anderson", "i.am.a@hotmail.com", T1),
    Addresses = insert("Anita Bath", "abath@someuni.edu", insert("Kevin Robert", "myfairy@yahoo.com", insert("Wilson Longbrow", "longwil@gmail.com", T2))),
    io:fwrite("Addresses: ~tp ~n",[Addresses]),
    lookup("Wilson Longbrow", Addresses).

