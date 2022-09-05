class PostsController < ApplicationController
     #localhost:3000/posts
    def index
         @posts = Post.all
    end
    def show
         @post = Post.find(params[:id])
    end
    #localhost:3000/posts/new
    def new
         @post = Post.new
    end
    def create
        #render plain:params[:post].inspect
        #After clicking the submit button on the 'localhost:3000/posts/new' page
        # New page URL: 'http://localhost:3000/posts'
        #<ActionController::Parameters {"title"=>"adfasdf", "body"=>"asdffasdf"} permitted: false>
        @post = Post.new(post_params)
         
       if(@post.save)
          redirect_to @post
       else
            render 'new'
       end
    end
    def edit
        @post = Post.find(params[:id])
    end
     
    def update
       @post = Post.find(params[:id])
         
       if(@post.update(post_params))
          redirect_to @post
       else
            render 'edit'
       end
         
    end
     
    def destroy
         @post = Post.find(params[:id])
         @post.destroy
         
         redirect_to posts_path
    end
     
    private def post_params
         params.require(:post).permit( :title, :body)
    end
end
