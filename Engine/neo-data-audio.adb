
--                                                                                                                                      --
--                                                         N E O  E N G I N E                                                           --
--                                                                                                                                      --
--                                                 Copyright (C) 2016 Justin Squirek                                                    --
--                                                                                                                                      --
-- Neo is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the --
-- Free Software Foundation, either version 3 of the License, or (at your option) any later version.                                    --
--                                                                                                                                      --
-- Neo is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of                --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.                            --
--                                                                                                                                      --
-- You should have received a copy of the GNU General Public License along with Neo. If not, see gnu.org/licenses                       --
--                                                                                                                                      --

-- Unified texture type definitions
package Neo.Data.Texture is

  -------------
  -- Formats --
  -------------

  type Format_Kind is (Khronos_Format); -- http://web.archive.org/web/20160811201320/https://www.khronos.org/opengles/sdk/tools/KTX/file_format_spec/

  -----------
  -- Image --
  -----------

  type Compressed_Image (Kind : Format_Kind; Mipmaps, Length, Faces, Face_Size : Int)
    is array (1..Mipmaps, 1..Length, 1..Faces, 1..Face_Size) of Byte with Convention => C;

  --------
  -- IO --
  --------

  function Load (Path : Str) return Compressed_Image;
end;