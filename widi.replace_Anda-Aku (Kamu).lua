--[[
README:

Indo: Menambahkan teks di clipboard ke awal kalimat di line yang di-select.
Eng: Append text from clipboard into selected lines.

Makes all lines in the selection italic.
]]

--Script properties
script_name="Replace Saya -> Aku (Kamu)"
script_description="Replace saya => aku, Anda => kamu, Kau => Kamu, Apakah => Apa, dll"
script_author="widibaka"
script_version="0. "

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

		teks = teks :gsub("^Anda ","Kau ")
		teks = teks :gsub("saya[?]","aku")

		-- entah kenapa khusus ini
		teks = replacetext(teks, "tidak pernah membayangkan","tidak menduga", false)
		teks = replacetext(teks, "tidak pernah menyangka","tidak menyangka", false)
		teks = replacetext(teks, "Bahkan jika","Meskipun", false)
		teks = replacetext(teks, "bahkan jika","walaupun", false)

		teks = replacetext(teks, "Dengan serius","Sungguh", false)
		teks = replacetext(teks, "Apa yang harus aku lakukan","Bagaimana ini", false)

		teks = replacetext(teks, " saya,"," aku,", false)

		teks = replacetext(teks, " kau berdua"," kalian berdua", false)

		teks = replacetext(teks, " dari kau"," darimu", false)

		teks = replacetext(teks, "Lakukan sesukamu","Terserah saja", false)

		teks = replacetext(teks, "Wow","Wah", false)

		teks = replacetext(teks, "Yeah","Ya", false)

		teks = replacetext(teks, "SAYA","Aku", false)

		teks = replacetext(teks, "Mari kita","Ayo kita", true)

		teks = replacetext(teks, "Maafkan saya","Maafkan aku", false)

		
		-- Jiriki de!
		teks = replacetext(teks, "saya","aku", true)
		teks = replacetext(teks, "Saya","Aku", true)
		-- teks = replacetext(teks, " saya."," aku.", true)
		teks = replacetext(teks, "Anda","kau", true)
		teks = replacetext(teks, "anda","kau", true)
		teks = replacetext(teks, "kamu","kau", true)
		teks = replacetext(teks, "Kamu","Kau", true)
		teks = replacetext(teks, "mengapa","kenapa", false)
		teks = replacetext(teks, "Mengapa","Kenapa", false)
		-- teks = replacetext(teks, " Anda.","mu.", true)
		teks = replacetext(teks, "Tetapi","Tapi", false)
		teks = replacetext(teks, "tetapi","tapi", false)

		teks = replacetext(teks, "dapat","bisa", true)
		teks = replacetext(teks, "Betulkah","Benarkah", false)
		teks = replacetext(teks, "Oke","Baik", false)

		-- teks = replacetext(teks, "--","—", true)

		teks = replacetext(teks, "Dalam hal ini,","Kalau begitu,", true)

		teks = replacetext(teks, "dah lama sejak aku","dah lama aku tidak", false)		
		teks = replacetext(teks, "Apa kamu baik-baik saja?","Kamu tidak apa-apa", false)
		teks = replacetext(teks, "mengatakan","bilang", false)
		teks = replacetext(teks, "Sesuatu yang salah?","Ada apa", false)
		teks = replacetext(teks, "Hai","Hei", false)
		teks = replacetext(teks, "Apa yang salah?","Ada apa", false)
		teks = replacetext(teks, "kau semua ","kalian semua ", false)
		teks = replacetext(teks, "Kau semua ","Kalian semua ", false)
		teks = replacetext(teks, "Di Sini","Ini", false)

		teks = replacetext(teks, " saya[.]","ku.", false)
		teks = replacetext(teks, "Sehat[?]","Bagaimana?", false)
		teks = replacetext(teks, "Aku berharap aku ","Seharusnya tadi aku ", false)
		teks = replacetext(teks, "umm","emm", true)
		-- teks = replacetext(teks, "um","em", true)
		teks = replacetext(teks, "Itu terlalu buruk","Sayang sekali", false)
		teks = replacetext(teks, "Terima kasih kembali","Sama-sama", false)
		teks = replacetext(teks, "Meninggalkan sudah[?]","Sudah mau pulang?", false)
		teks = replacetext(teks, "Dimana","Di mana", false)
		teks = replacetext(teks, "dimana","di mana", false)
		teks = replacetext(teks, "Apa yang sedang terjadi","Apa yang terjadi", false)
		teks = replacetext(teks, "Tampaknya","Sepertinya", false)
		teks = replacetext(teks, "tampaknya","sepertinya", false)
		teks = replacetext(teks, "kepada kau","padamu", false)
		teks = replacetext(teks, "telah","sudah", false)
		teks = replacetext(teks, "Dalam hal itu","Kalau begitu", false)

		teks = replacetext(teks, "yang perlu kau lakukan hanyalah","kau hanya perlu", true)

		teks = replacetext(teks, "Gerakan mengungkap kekerasan seksual demi menghapuskannya","Aku juga", true)
		teks = replacetext(teks, "Nama aku","Namaku", false)
		teks = replacetext(teks, "nama aku","namaku", false)
		teks = replacetext(teks, "dada aku","dadaku", false)
		teks = replacetext(teks, "Dada aku","Dadaku", false)
		teks = replacetext(teks, "oke[?]","ya?", true)
		teks = replacetext(teks, "bersama aku","bersamaku", false)
		teks = replacetext(teks, "Apa yang harus aku lakukan","Aku harus bagaimana", false)
		teks = replacetext(teks, "Apa ada yang salah","Ada apa", false)
		teks = replacetext(teks, "Jika","Kalau", true)
		teks = replacetext(teks, "jika","kalau", true)
		teks = replacetext(teks, "Ini adalah sesuatu yang","Ini", true)
		teks = replacetext(teks, "ini adalah sesuatu yang","ini", true)
		teks = replacetext(teks, "Sudah lama sejak terakhir kali aku","Sudah lama aku tidak", true)
		teks = replacetext(teks, "U-Uh","A-Ah", false)
		teks = replacetext(teks, "sesuatu untuk diminum","minuman", false)
		teks = replacetext(teks, "dengan aku","denganku", false)
		teks = replacetext(teks, "Itu bukanlah","Bukan itu", true)
		teks = replacetext(teks, "itu bukanlah","bukan itu", true)
		teks = replacetext(teks, "Apa masalahnya","Ada apa", false)
		teks = replacetext(teks, "Apa yang kau pikir kau lakukan","Apa-apaan kau ini", false)
		teks = replacetext(teks, "Apa yang kau inginkan","Apa maumu", false)
		teks = replacetext(teks, "Kau bisa bilang bahwa","Bisa dibilang", true)
		teks = replacetext(teks, "Aku ingin tahu apakah aku","Kira-kira apakah aku", true)
		teks = replacetext(teks, "Oh begitu","Oh, begitu", false)
		teks = replacetext(teks, "itu ide yang baik untuk","tidak apa-apa", true)
		teks = replacetext(teks, "Sehingga kemudian","Jadi", false)
		teks = replacetext(teks, "Apakah","Apa", false)
		teks = replacetext(teks, "apakah","apa", false)
		teks = replacetext(teks, "benar-benar yakin tentang ini","benar-benar yakin", false)
		teks = replacetext(teks, "adik perempuan","adik", false)
		teks = replacetext(teks, "adik laki-laki","adik", false)
		teks = replacetext(teks, "Aku baik-baik saja sekarang","Aku tidak apa-apa", false)
		teks = replacetext(teks, "Sudah lama sejak kami","Sudah lama kita tidak", true)
		teks = replacetext(teks, "Sudah lama sejak kita","Sudah lama kita tidak", true)
		teks = replacetext(teks, "mari","ayo", true)
		teks = replacetext(teks, "Berkat kau,","Berkat dirimu,", true)
		teks = replacetext(teks, "kakak laki-laki","kakak", false)
		teks = replacetext(teks, "kakak perempuan","kakak", false)
		teks = replacetext(teks, "disana","di sana", false)
		teks = replacetext(teks, "Apa yang kalian lakukan","Sedang apa kalian", false)
		teks = replacetext(teks, "Pernahkah kau","Apa kau pernah", false)
		teks = replacetext(teks, "kepada aku","kepadaku", false)
		teks = replacetext(teks, "kepada","pada", false)
		teks = replacetext(teks, "diri aku","diriku", false)
		teks = replacetext(teks, "Disini","Di sini", false)
		teks = replacetext(teks, "disini","di sini", false)
		teks = replacetext(teks, "Dibelakang","Di belakang", false)
		teks = replacetext(teks, "dibelakang","di belakang", false)
		teks = replacetext(teks, "Yang harus kita lakukan adalah","Kita tinggal", true)
		teks = replacetext(teks, "yang harus kita lakukan adalah","kita tinggal", true)
		teks = replacetext(teks, "Yang harus aku lakukan adalah","Aku tinggal", true)
		teks = replacetext(teks, "yang harus aku lakukan adalah","aku tinggal", true)
		teks = replacetext(teks, "Yang harus kau lakukan adalah","Kau tinggal", true)
		teks = replacetext(teks, "yang harus kau lakukan adalah","kau tinggal", true)
		teks = replacetext(teks, "idiot","bodoh", false)
		teks = replacetext(teks, "Apa yang harus kita lakukan","Bagaimana ini", false)
		teks = replacetext(teks, "kemari", "ke mari", true)
		teks = replacetext(teks, "kemari.", "ke mari.", true)
		teks = replacetext(teks, "kesana", "ke sana", false)
		teks = replacetext(teks, "Tapi pada tingkat ini", "Tapi kalau begini terus", false)
		teks = replacetext(teks, "berada di kapal yang sama", "pun sama", false)
		teks = replacetext(teks, "memberi kau", "memberimu", false)
		teks = replacetext(teks, "Sehat", "Yah", true)
		teks = replacetext(teks, "Yang harus mereka lakukan hanyalah", "Mereka hanya perlu", true)
		teks = replacetext(teks, "yang harus mereka lakukan hanyalah", "mereka hanya perlu", true)

		teks = replacetext(teks, "Cara kau", "Caramu", false)
		teks = replacetext(teks, "cara kau", "caramu", false)
		teks = replacetext(teks, "Aku akan pulang", "Aku mau pulang", false)
		teks = replacetext(teks, "bertaruh", "taruhan", true)
		teks = replacetext(teks, "Ah maaf", "Ah, maaf", true)
		teks = replacetext(teks, "Ya Bu", "Baik, Bu", true)
		teks = replacetext(teks, "Ya Pak", "Baik, Pak", true)
		teks = replacetext(teks, "Maaf Bu", "Maaf, Bu", true)
		teks = replacetext(teks, "Maaf Pak", "Maaf, Pak", true)
		teks = replacetext(teks, "aku ingin tahu apa", "kira-kira apa", true)
		teks = replacetext(teks, "Aku ingin tahu apa", "Kira-kira apa", true)
		teks = replacetext(teks, "Tidak tidak Tidak", "Tidak, tidak, tidak", false)
		teks = replacetext(teks, "Ini dia datang", "Ini dia", false)

		teks = replacetext(teks, "tahukah kau", "Apa kau tahu", false)
		teks = replacetext(teks, "kau yakin tentang ini", "kau yakin", false)
		teks = replacetext(teks, ", kau tahu", ", tahu", false)
		teks = replacetext(teks, "Bisakah aku", "Apa aku bisa", false)
		teks = replacetext(teks, "Apa ada masalah[?]", "Ada apa?", true)
		teks = replacetext(teks, "Anda[.]", "mu.", true)
		teks = replacetext(teks, "Anda[,]", "mu,", true)
		teks = replacetext(teks, "Haruskah kita menyebutnya sehari", "Kita sudahi saja kali ini", false)
		teks = replacetext(teks, "Nah, kamu lihat", "Soalnya", false)

		teks = replacetext(teks, "Sudah lama sejak kau", "Sudah lama kau tidak", false)


		-- khusus untuk "kau" menjadi "kamu"
		teks = replacetext(teks, "kau", "kamu", true)
		teks = replacetext(teks, "Kau", "Kamu", true)
		
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