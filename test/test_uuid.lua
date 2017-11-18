---------------------------------------------------------------------
-- toybox
-- Copyright (C) 2017 tacigar
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
---------------------------------------------------------------------

local uuid = require "uuid"
local luaunit = require "luaunit"

function test_clone()
	local u1 = uuid.generate()
	local u2 = u1:clone()

	luaunit.assert_true(u1 == u2)
	luaunit.assert_true(u1:compare(u2))
	luaunit.assert_true(u1:unparse() == u2:unparse())
end

function test_compare_and_eq()
	local u1 = uuid.generate()
	local u2 = u1:clone()
	local u3 = uuid.generate()

	luaunit.assert_true(u1:compare(u2))
	luaunit.assert_true(u1:compare(u1))
	luaunit.assert_false(u1:compare(u3))
	luaunit.assert_true(u1 == u2)
	luaunit.assert_true(u1 == u2)
	luaunit.assert_false(u1 == u3)
end

function test_parse()
	local s = "AFF95DA3-B2C9-4596-9D2E-3ABEEFD3259A"
	local u = uuid.parse(s)
	luaunit.assert_true(u:unparse() == s)
end

function test_clear()
	local u = uuid.generate()
	u:clear()
	luaunit.assert_true(u:is_null())
	luaunit.assert_true(u:unparse() == "00000000-0000-0000-0000-000000000000")
end

function test_is_null()
	local u = uuid.generate()
	luaunit.assert_false(u:is_null())
	u:clear()
	luaunit.assert_true(u:is_null())
end

os.exit(luaunit.LuaUnit.run())
