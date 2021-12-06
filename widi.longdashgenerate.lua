--[[
README:

Indo: Menambahkan teks di clipboard ke awal kalimat di line yang di-select.
Eng: Append text from clipboard into selected lines.

Makes all lines in the selection italic.
]]

--Script properties
script_name="Long Dash --"
script_description="Menambahkan karakter dash panjang"
script_author="widibaka"
script_version="0"

--Function utama
function italicize(sub, sel)
	--Go through all the lines in the selection
	for si,li in ipairs(sel) do
		
		--Read in the line
		local line=sub[li]
		teks=line.text
		
		--Menggabungkan comment + uncommented text
		line.text=line.text.."—"
		
		--Put the line back into the subtitles
		sub[li]=line
		
	end
	
	--Set undo point and maintain selection
	aegisub.set_undo_point(script_name)
	return sel
end

--Register macro (no validation function required)
aegisub.register_macro(script_name,script_description,italicize)