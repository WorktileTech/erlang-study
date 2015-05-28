%%%-------------------------------------------------------------------
%%% @author haifeng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 五月 2015 下午12:41
%%%-------------------------------------------------------------------
-module(hello).
-author("haifeng").

%% API
-export([start/1]).

start(_Browser) ->
  {xx, #{clicked => <<"start">>}}.
