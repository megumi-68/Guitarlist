class GuitarsController < ApplicationController
    
    
    def new
        @guitar = Guitar.new
    end
 
    def create
        Guitar.create(guitar_params)
    end

    private
    
    def guitar_params
        params.require(:guitar).permit(:name, :category, :content)
    end
end
