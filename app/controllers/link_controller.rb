class LinkController < ApplicationController
  def new
    # Check for form post
    if !params[:url].nil?
      # Make some stuff
      hash  = Digest::MD5.hexdigest( params[:url] )
      tag   = hash[0..6]
      
      # Create a new Link in the database
      @lin  = Link.create( :href => params[:url], :md => hash, :tag => tag, :count => 0 )
      
      # Redirect...
      redirect_to view_link_path( @lin.tag )
    end
  end

  def view
  end

  def visit
    # Find the Link in the DB
    @lin  = Link.where( :tag => params[:tag] )
    
    # Increment counter!
    count = @lin.first.count + 1
    @lin.first.count  = count
    @lin.first.save
    
    # Redirect
    redirect_to @lin.first.href
  end

end
