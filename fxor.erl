-module(fxor).
-export([fxor_hex/2]).
-author("Cody Boppert").
-date("10/27/16").
-url("http://cryptopals.com/sets/1/challenges/2").
-set("One").
-challenge("Two").

-import(converter, [hex_to_bin/1, bin_to_hex/1]).

fxor_hex(A, B) ->
   converter:bin_to_hex(fxor_bin(converter:hex_to_bin(A), converter:hex_to_bin(B))).

fxor_bin(A, B) ->
   fxor_bin(A, B, <<>>).

fxor_bin(<<>>,<<>>, Acc) ->
   Acc;
fxor_bin(<<A:8, R/binary>>, <<B:8, S/binary>>, Acc) when A == B ->
   fxor_bin(R, S, <<Acc/binary, "0">>);
fxor_bin(<<A:8, R/binary>>, <<B:8, S/binary>>, Acc) when A /= B ->
   fxor_bin(R, S, <<Acc/binary, "1">>).
