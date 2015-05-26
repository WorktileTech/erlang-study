%%%-------------------------------------------------------------------
%%% @author haifeng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 五月 2015 下午4:13
%%%-------------------------------------------------------------------
-module(start).
-author("haifeng").

%% API
-export([hello/0]).

hello() ->
  io:format("hello:~s~n",["world"]).
