-module(echo).
-export([start/0,go/0,look/0]).

create_process(N) ->

go() ->
    Pid = spawn(?MODULE,look,[]),
    Pid ! {self(),trasfer,self()}
    receive
        {Pid,_Message} ->
            _Message,
    after 2000
        timout
    end,
Pid ! stop.

look() ->
    receive
    {From,_Message}
        From! {self(),_Message},
        look();
    stop ->
        true
    end