module ApplicationHelper
	def comment
	end
	def separate_part_num(partnum)
		partnum = partnum.strip.split(/,+/)
		partnum
	end
end
