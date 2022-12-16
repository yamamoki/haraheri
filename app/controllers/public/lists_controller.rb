class Public::ListsController < ApplicationController
  def index
    @lists = List.where(draft: 'release')
    @lists = @lists.page(params[:page])
    if params[:tag_ids]
      @lists = []
      params[:tag_ids].each do |key, value|
        @lists += Tag.find_by(name: key).lists if value == "1"
      end
      @lists.uniq!
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.user_id = current_user.id
    if @list.save
    redirect_to list_path(@list.id)
    else
    render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end


  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to list_path(list)
  end

  def search
    @lists = List.search(params[:keyword])
    @keyword = params[:keyword]
    render 'index'
  end

  private

  def list_params
    params.require(:list).permit(:title, :material, :body, :image, :draft, tag_ids: [])
  end

end
