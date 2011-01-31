class LinkController < ApplicationController
  def new
    # Check for form post
    if !params[:url].nil?
      # Make some stuff
      hash  = Digest::MD5.hexdigest( params[:url] )
      tag   = hash[0..6]
      
      # Check if this link already exists in the database
      @lin  = Link.where( :md => hash )
      if @lin.first.nil?
        # Check if the tag exists already
        tagl  = Link.where( :tag => tag )
        
        if !tagl.first.nil?
          # We need a new tag...
          thash = Digest::MD5.hexdigest( Time.to_s )
          tag   = thash[0..6]
        end
        
        # Create a new Link in the database
        @lin  = Link.create( :href => params[:url], :md => hash, :tag => tag, :count => 0 )
      else
        @lin  = @lin.first
      end
      
      # Redirect...
      redirect_to view_link_path( @lin.tag )
    end
  end

  def view
    # Find the link
    @lin  = Link.where( :tag => params[:tag] )
    @lin  = @lin.first
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
