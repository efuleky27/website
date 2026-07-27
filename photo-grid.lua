-- Support filter for the photo grid in photos.qmd:
--  1. Reads each image's real pixel dimensions off disk and sets an
--     aspect-ratio inline style, so the CSS masonry grid can reserve
--     the right amount of space before the image loads (avoiding
--     layout shift) without hardcoding any aspect ratio.
--  2. Puts every image in the same lightbox gallery ("photos") so the
--     built-in lightbox's arrows can step between them — otherwise
--     each photo opens in its own gallery of one and the arrows do
--     nothing.

local function read_size(path)
  local f = io.open(path, "rb")
  if not f then
    return nil
  end
  local data = f:read("*all")
  f:close()
  local ok, size = pcall(pandoc.image.size, data)
  if ok and size and size.width and size.height then
    return size.width, size.height
  end
  return nil
end

function Image(img)
  local w, h = read_size(img.src)
  if w and h then
    local style = img.attributes["style"] or ""
    img.attributes["style"] = style .. "aspect-ratio:" .. w .. "/" .. h .. ";"
  end
  img.attributes["group"] = "photos"
  return img
end
