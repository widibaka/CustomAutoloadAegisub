--[[
README:

Indo: Menambahkan teks di clipboard ke awal kalimat di line yang di-select.
Eng: Append text from clipboard into selected lines.

Makes all lines in the selection italic.
]]

--Script properties
script_name="Replace Saya -> Aku (Kau)"
script_description="Replace saya => aku, Anda => kau, Kamu => Kau, Apakah => Apa, dll"
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
		:gsub("tidak pernah membayangkan","tidak menduga")
		:gsub("tidak pernah menyangka","tidak menyangka")
		:gsub("Bahkan jika","Meskipun")
		:gsub("bahkan jika","walaupun")

		:gsub("Dengan serius","Sungguh")
		:gsub("Apa yang harus aku lakukan","Bagaimana ini")

		:gsub(" saya,"," aku,")

		:gsub(" kau berdua"," kalian berdua")

		:gsub(" dari kau"," darimu")

		:gsub("Lakukan sesukamu","Terserah saja")

		:gsub("Wow","Wah")

		:gsub("Yeah","Ya")

		:gsub("SAYA","Aku")

		:gsub("Mari kita","Ayo kita")

		:gsub("Maafkan saya","Maafkan aku")

		:gsub("Dalam hal ini,","Kalau begitu,")

		:gsub("dah lama sejak aku","dah lama aku tidak")		
		:gsub("Apa kamu baik-baik saja?","Kamu tidak apa-apa")
		:gsub("mengatakan","bilang")
		:gsub("Sesuatu yang salah?","Ada apa")
		:gsub("Hai","Hei")
		:gsub("Apa yang salah?","Ada apa")
		:gsub("kau semua ","kalian semua ")
		:gsub("Kau semua ","Kalian semua ")
		:gsub("Di Sini","Ini")

		:gsub(" saya[.]","ku.")
		:gsub("Sehat[?]","Bagaimana?")
		:gsub("Aku berharap aku ","Seharusnya tadi aku ")
		:gsub("umm","emm")
		-- :gsub("um","em")
		:gsub("Itu terlalu buruk","Sayang sekali")
		:gsub("Terima kasih kembali","Sama-sama")
		:gsub("Meninggalkan sudah[?]","Sudah mau pulang?")
		:gsub("Dimana","Di mana")
		:gsub("dimana","di mana")
		:gsub("Apa yang sedang terjadi","Apa yang terjadi")
		:gsub("tampaknya","Sepertinya")
		:gsub("kepada kau","padamu")
		:gsub("telah","sudah")
		:gsub("Dalam hal itu","Kalau begitu")

		:gsub("yang perlu kau lakukan hanyalah","kau hanya perlu")

		:gsub("Gerakan mengungkap kekerasan seksual demi menghapuskannya","Aku juga")
		:gsub("Nama aku","Namaku")
		:gsub("nama aku","namaku")
		:gsub("dada aku","dadaku")
		:gsub("Dada aku","Dadaku")
		:gsub("oke[?]","ya?")
		:gsub("bersama aku","bersamaku")
		:gsub("Apa yang harus aku lakukan","Aku harus bagaimana")
		:gsub("Apa ada yang salah","Ada apa")
		:gsub("Jika","Kalau")
		:gsub("jika","kalau")
		:gsub("ini adalah sesuatu yang","ini")
		:gsub("Sudah lama sejak terakhir kali aku","Sudah lama aku tidak")
		:gsub("U-Uh","A-Ah")
		:gsub("sesuatu untuk diminum","minuman")
		:gsub("dengan aku","denganku")
		:gsub("Itu bukanlah","Itu bukanlah")
		:gsub("itu bukanlah","bukan itu")
		:gsub("Apa masalahnya","Ada apa")

		
		-- Jiriki de!
		:gsub("saya ","aku ")
		:gsub(" saya"," aku")
		:gsub("Saya ","Aku ")
		-- :gsub(" saya."," aku.")
		:gsub("^Anda ","Kau ")
		:gsub("Anda","kau")
		:gsub(" anda"," kau")
		:gsub("kamu","kau")
		:gsub("Kamu","Kau")
		:gsub("Apakah ","Apa ")
		:gsub("mengapa","kenapa")
		:gsub("Mengapa ","Kenapa ")
		:gsub("Mengapa[?]","Kenapa?")
		-- :gsub(" Anda.","mu.")
		:gsub("Tetapi","Tapi")
		:gsub("tetapi","tapi")

		:gsub(" dapat "," bisa ")
		:gsub("Betulkah","Benarkah")
		:gsub("Oke","Baik")

		-- :gsub("--","—")
		
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