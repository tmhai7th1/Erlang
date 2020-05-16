-module(process_ring).
-export([start/0,loop/0,create_process/2]).

start() ->
    Pid = spawn(fun() -> loop() end),
    List_Pid =  create_process(2,[]),
    io:fwrite("NList_Pid ~tp ~n",[List_Pid]),
    send_message_around_ring(List_Pid),
    terminated_ring(List_Pid).


terminated_ring([]) ->
        ok;

terminated_ring([Item|List]) ->
    terminated_item(Item),
    terminated_ring(List).

terminated_item(To) ->
    To ! {self(),{shutdown}},
    receive
        {To, Reply} ->
            io:fwrite("Reply ~tp ~n",[Reply]),
            Reply
    after 2000 ->
        timeout
    end.

send_message(From,To,Message) ->
    To ! {From,{message,"ffff",self()}},
    receive
        {To, Reply} ->
            io:fwrite("Reply ~tp ~n",[Reply]),
            Reply
    after 2000 ->
        timeout
    end.

send_message_around_ring(First_Node,Node,[]) ->
    send_message(Node,First_Node,"Test");

send_message_around_ring(First_Node, Node, [Next_Node|Tail]) ->
    send_message(Node,Next_Node,"Test"),
    send_message_around_ring(First_Node,Next_Node,Tail).

send_message_around_ring([Head|Tail]) ->
    send_message_around_ring(Head,Head,Tail).

create_process(0,List_Pid) ->
    List_Pid;

create_process(N,List_Pid) ->
    Pid = spawn(?MODULE,loop,[]),
    create_process(N-1, [Pid|List_Pid]).

loop() ->
    receive
        {From, {message,_Message,Return}} ->
            io:fwrite("self() ~tp ~n",[self()]),
            io:fwrite("Return From ~tp ~n",[From]),
            io:fwrite("seft ~tp ~n",[_Message]),
            io:fwrite("Area_Result ~tp ~n",[Return]),
            Return ! {self(),"Msss"},
           loop();
        {From, {shutdown}} ->
            From ! {self(),ok}
    end.