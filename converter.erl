-module(converter).
-export([hex_to_bin/1, bin_to_hex/1, hex_to_64/1]).
-author("Cody Boppert").
-date("10/25/16").
-url("http://cryptopals.com/sets/1/challenges/1").
-set("One").
-challenge("One").

% Exports
hex_to_bin(Hex) ->
   pad_if_needed(integer_to_binary(list_to_integer(Hex, 16), 2)).

bin_to_hex(Bin) ->
   integer_to_list(binary_to_integer(Bin, 2), 16).

hex_to_64(Hex) ->
   bin_to_64(hex_to_bin(Hex)).


% Private for now
bin_to_64(Bits) when byte_size(Bits) >= 6 ->
      [bits_to_64(binary_part(Bits, 0, 6))|bin_to_64(binary_part(Bits, 6, byte_size(Bits) - 6))];
bin_to_64(_) -> [].

pad_if_needed(Bits) when byte_size(Bits) rem 4 == 0 -> Bits;
pad_if_needed(Bits) when byte_size(Bits) rem 4 == 1 -> list_to_binary(["000"|[binary_to_list(Bits)]]);
pad_if_needed(Bits) when byte_size(Bits) rem 4 == 2 -> list_to_binary(["00"|[binary_to_list(Bits)]]);
pad_if_needed(Bits) when byte_size(Bits) rem 4 == 3 -> list_to_binary(["0"|[binary_to_list(Bits)]]).

bits_to_64(X) ->
   [H|_T] = case X of
      <<"000000">> -> "A";
      <<"000001">> -> "B";
      <<"000010">> -> "C";
      <<"000011">> -> "D";
      <<"000100">> -> "E";
      <<"000101">> -> "F";
      <<"000110">> -> "G";
      <<"000111">> -> "H";
      <<"001000">> -> "I";
      <<"001001">> -> "J";
      <<"001010">> -> "K";
      <<"001011">> -> "L";
      <<"001100">> -> "M";
      <<"001101">> -> "N";
      <<"001110">> -> "O";
      <<"001111">> -> "P";
      <<"010000">> -> "Q";
      <<"010001">> -> "R";
      <<"010010">> -> "S";
      <<"010011">> -> "T";
      <<"010100">> -> "U";
      <<"010101">> -> "V";
      <<"010110">> -> "W";
      <<"010111">> -> "X";
      <<"011000">> -> "Y";
      <<"011001">> -> "Z";
      <<"011010">> -> "a";
      <<"011011">> -> "b";
      <<"011100">> -> "c";
      <<"011101">> -> "d";
      <<"011110">> -> "e";
      <<"011111">> -> "f";
      <<"100000">> -> "g";
      <<"100001">> -> "h";
      <<"100010">> -> "i";
      <<"100011">> -> "j";
      <<"100100">> -> "k";
      <<"100101">> -> "l";
      <<"100110">> -> "m";
      <<"100111">> -> "n";
      <<"101000">> -> "o";
      <<"101001">> -> "p";
      <<"101010">> -> "q";
      <<"101011">> -> "r";
      <<"101100">> -> "s";
      <<"101101">> -> "t";
      <<"101110">> -> "u";
      <<"101111">> -> "v";
      <<"110000">> -> "w";
      <<"110001">> -> "x";
      <<"110010">> -> "y";
      <<"110011">> -> "z";
      <<"110100">> -> "0";
      <<"110101">> -> "1";
      <<"110110">> -> "2";
      <<"110111">> -> "3";
      <<"111000">> -> "4";
      <<"111001">> -> "5";
      <<"111010">> -> "6";
      <<"111011">> -> "7";
      <<"111100">> -> "8";
      <<"111101">> -> "9";
      <<"111110">> -> "+";
      <<"111111">> -> "/"
   end,
   H.
