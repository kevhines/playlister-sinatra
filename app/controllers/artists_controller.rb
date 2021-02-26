class ArtistsController < ApplicationController
    get '/artists' do
        @artists = Artist.all
        erb :'/artists/index'
    end
    
    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'/artists/show'
    end

    get '/artists/:slug/edit' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'/artists/edit'
    end
    
    patch '/artists/:slug' do
         @artist = Artist.find_by_slug(params[:slug])
         @artist.update(params[:artist])
        # #@artist.artist = Artist.find_or_create_by(name: params[:artist][:name])
        # @artist.genre_ids = params[:genres]
        # @artist.save
    
     #   flash[:message] = "Successfully updated song."
        redirect("/artists/#{@artist.slug}")
    end
    
end
