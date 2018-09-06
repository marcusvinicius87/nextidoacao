module ColaboradorHelper

	def self.get_top3_colaboradores(colaboradores)
		return colaboradores.sort_by {|p| [p.cadastros.size].last(3)}
	end 

end
