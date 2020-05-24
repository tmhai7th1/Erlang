-module(mathe).
-export([start/0]).

start() ->
{ok, Tokens, _Line} = erl_scan:string("hello, world."),
Result = erl_parse:parse_term(Tokens),
io:fwrite("_Line ~tp ~n",[_Line]),
io:fwrite("Tokens ~tp ~n",[Tokens]),
io:fwrite("Test ~tp ~n",[Result]).