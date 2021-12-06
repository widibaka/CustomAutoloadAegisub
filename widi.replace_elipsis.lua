--[[
README:

Indo: Menambahkan teks di clipboard ke awal kalimat di line yang di-select.
Eng: Append text from clipboard into selected lines.

Makes all lines in the selection italic.
]]

--Script properties
script_name="Rapihkan Elipsis"
script_description="Replace elipsis: \"...\" --> \" ...\" "
script_author="widibaka"
script_version="0.1"

-- Ganti kata
function replacetext(source, find, replace, wholeword)
  if wholeword then
    find = "%f[^%z%s]"..find.."%f[%z%s]"
  end
  return (source:gsub(find,replace))
end

--Function utama
function ganti_banyak(sub, sel)
	--Go through all the lines in the selection
	for si,li in ipairs(sel) do
		
		--Read in the line
		local line=sub[li]
		teks=line.text

		-- entah kenapa khusus ini
		:gsub("[...]", " #n")
		:gsub(" #n #n #n", " ...")
		:gsub(" ... #n", " ....")
		:gsub(" #n", ".")
		
		--Menyimpan
		line.text=teks
		
		--Put the line back into the subtitles
		sub[li]=line
		
	end
	
	--Set undo point and maintain selection
	aegisub.set_undo_point(script_name)
	return sel
end

--Register macro (no validation function required)
aegisub.register_macro(script_name,script_description,ganti_banyak)