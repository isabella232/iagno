/*
 * Copyright (C) 2013 Michael Catanzaro
 *
 * This file is part of Iagno.
 *
 * Iagno is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * Iagno is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Iagno.  If not, see <http://www.gnu.org/licenses/>.
 */

public enum Player
{
    NONE,
    LIGHT,
    DARK;

    public string to_string ()
    {
        switch (this)
        {
        case LIGHT:
            return "L";
        case DARK:
            return "D";
        default:
            warn_if_fail (this == NONE);
            return " ";
        }
    }

    public static Player from_char (char c)
        requires (c == 'L' || c == 'D' || c == ' ')
    {
        switch (c)
        {
        case 'L':
            return LIGHT;
        case 'D':
            return DARK;
        case ' ':
            return NONE;
        default:
            warn_if_reached ();
            return NONE;
        }
    }

    public static Player flip_color (Player p)
        requires (p == Player.LIGHT || p == Player.DARK)
    {
        if (p == Player.LIGHT)
            return Player.DARK;
        else
            return Player.LIGHT;
    }
}
