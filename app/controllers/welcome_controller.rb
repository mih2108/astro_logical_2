class WelcomeController < ApplicationController
	def index
		@signs=Sign.all
	end

end
