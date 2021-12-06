--[[
README:

Indo: Menambahkan teks di clipboard ke awal kalimat di line yang di-select.
Eng: Append text from clipboard into selected lines.

Makes all lines in the selection italic.
]]

--Script properties
script_name="Paste Clipboard"
script_description="Paste/append text from clipboard into selected lines."
script_author="widibaka"
script_version="0.5"

-- Memanggil library
clipboard=require("aegisub.clipboard")


--Function utama
function paste(sub, sel)
	--Go through all the lines in the selection
	for si,li in ipairs(sel) do
		
		--Read in the line
		local line=sub[li]
		--Paste clipboard
		line.text=line.text..clipboard.get()
		
		--Put the line back into the subtitles
		sub[li]=line
		
	end
	
	--Set undo point and maintain selection
	aegisub.set_undo_point(script_name)
	return sel
end

--Register macro (no validation function required)
aegisub.register_macro(script_name,script_description,paste)