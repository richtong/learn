## Copyright (C) 2019 Rich Tong
##
## In Octave 5.0, pause is broken so write our own which just uses input
## instead and does not honor the values and so forth
##
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} pause (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Rich <rich@MacBook-Pro.local>
## Created: 2019-04-18

function retval = pause (input1, input2)
  input('');
endfunction
