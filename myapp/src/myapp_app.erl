-module(myapp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, start/0, stop/1]).


start() ->
  io:format("myapp start ~n"),
  application:start(myapp).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
  io:format("myapp start 2 ~n"),
  myapp_sup:start_link(),
  myapp_sup:start_connection("name","hello").

stop(_State) ->
  ok.

