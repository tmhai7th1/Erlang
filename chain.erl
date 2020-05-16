-module(chain).
-export([start/0,chain/2]).

start()->
    io:fwrite("Pidstart: ~tp ~n",[self()]),
    Pid = spawn(?MODULE, chain, [3,self()]),
    link(Pid),
    io:fwrite("Pidstart: ~tp ~n",[self()]).

chain(0,Pid) ->
    io:fwrite("end: ~tp ~n",[self()]),
    io:fwrite("Pid_Root: ~tp ~n",[Pid]),
    receive
        _ -> ok
    after 2000 ->
    exit("chain dies here")
    end;

chain(N,Pid_Root) ->
    io:fwrite("N: ~tp ~n",[N]),
    io:fwrite("firt ~tp ~n",[self()]),
    Pid = spawn(fun() -> chain(N-1, Pid_Root) end),
    io:fwrite("seft ~tp ~n",[self()]),
    io:fwrite("Pid ~tp ~n",[Pid]),
   % link(Pid),
    io:fwrite("Pid ~tp ~n",[Pid]),
    receive
        {From, {message,_Message}} ->
            io:fwrite("seft ~tp ~n",[_Message]),
            Pid ! {self(), {message,"Message"}};
        {From, {terminate}} ->
            ok
    end.
