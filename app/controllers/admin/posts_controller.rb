class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource class: Admin::PostsController
  inherit_resources
  actions :all, :except => [:show, :index]

  def index
    @table = Post.meta_table(attributes: [:title, {key: :published, label: 'Shown?'}, :content,                                    :views_count, :content_type, :tag_list, :type, {key: :user,                                    method: :email}], 
                            relations: [{:hubs => [:title, :published]}, {:user => [:email]} ], 
                            actions: [:show, [:edit, :admin]])
  end

  private

  def post_params
    params.require(:post).permit!
    #params.require(:post).permit(:user_id, :title, :published, :content, :content_type, :tag_list, :type, {:hub_ids => []}, attachments: Attachment.attribute_names.collect { |att| att.to_sym })
  end
end
