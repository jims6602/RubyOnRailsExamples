class PagesController < ApplicationController
    #http://localhost:3000/about
    def about
        @title='About Us'
        @content='This is Rails on Rails application people can uses to build their our Blog Webpage.'
    end
end
