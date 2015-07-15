%%%-------------------------------------------------------------------
%%% @author haifeng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 七月 2015 上午9:33
%%%-------------------------------------------------------------------
-module(book).
-author("haifeng").
-include_lib("apns/include/apns.hrl").
%% API
-export([start/0,start_prod/0]).

start() ->
  ok = apns:start(),
  ErrorFun = fun log_error/2,
  FbFun = fun log_feedback/1,
  Connection = #apns_connection{
    apple_host="gateway.sandbox.push.apple.com",
    cert_file="/home/xmpp/opt/lesschat/cert.pem",
    cert=undefined,
    key=undefined,
    feedback_host="feedback.sandbox.push.apple.com",
    error_fun=ErrorFun,
    feedback_fun=FbFun
  },
  F = is_record(Connection, apns_connection),
  io:format("is :~p~n",[F]),
  {ok, Pid} = apns:connect('lc-dddd', Connection),
  Pid.


start_prod() ->
  ok = apns:start(),
  ErrorFun = fun log_error/2,
  FbFun = fun log_feedback/1,
  Connection = #apns_connection{
    apple_host="gateway.push.apple.com",
    cert_file="/data/home/ubuntu/cert.pem",
    cert=undefined,
    key=undefined,
    feedback_host="feedback.push.apple.com",
    error_fun=ErrorFun,
    feedback_fun=FbFun
  },
  F = is_record(Connection, apns_connection),
  io:format("is :~p~n",[F]),
  {ok, Pid} = apns:connect('lc-dddd', Connection),
  Pid.


log_error(MsgId, Status) ->
  io:format("Error on msg ~p: ~p~n", [MsgId, Status]).

log_feedback(Token) ->
  io:format("Device with token ~p removed the app~n", [Token]).
