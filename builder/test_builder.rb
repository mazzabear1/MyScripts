#!//usr/bin/env ruby

FILES = [ "101.txt", "102.txt", "103.txt", "104.txt", "105.txt", "106.txt", "107.txt", "108.txt", "109.txt", "110.txt", "111.txt", "112.txt", "113.txt", "114.txt", "115.txt", "201.txt", "202.txt", "203.txt", "204.txt", "205.txt", "206.txt" ]


def random_line(filename)
	blocksize, line = 1024, ""
	File.open(filename) do |file|
		initial_position = rand(File.size(filename)-1)+1 # random pointer position. Not a line number!
		pos = Array.new(2).fill( initial_position ) # array [prev_position, current_position]
		# Find beginning of current line
		begin
			pos.push([pos[1]-blocksize, 0].max).shift # calc new position
			file.pos = pos[1] # move pointer backward within file
			offset = (n = file.read(pos[0] - pos[1]).rindex(/\n/) ) ? n+1 : nil
		end until pos[1] == 0 || offset
		file.pos = pos[1] + offset.to_i
		# Collect line text till the end
		begin
			data = file.read(blocksize)
			line.concat((p = data.index(/\n/)) ? data[0,p.to_i] : data)
		end until file.eof? or p
	end
	line
end


FILES.each { |file| 10.times { puts random_line(file).force_encoding("UTF-8") }

}
