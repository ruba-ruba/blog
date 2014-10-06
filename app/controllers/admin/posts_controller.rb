class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource class: Admin::PostsController
  inherit_resources
  actions :all, :except => [:show, :index]

  def index
    @table = render_meta_table(Post, attributes: [{key: :id, label: 'Number'}, :title, {key: :published, label: 'Shown?'}, :content, :views_count, :content_type, :tag_list, {key: :user, method: :email, label: "Created By Email"}], 
                            relations: [{:hubs => [:title, :published]}, {:user => [:email]} ], 
                            actions: [:show, [:edit, :admin], [:destroy, :admin]],
                            table_options: {:scope => nil})
  end

  private

  def post_params
    params.require(:post).permit!
    #params.require(:post).permit(:user_id, :title, :published, :content, :content_type, :tag_list, :type, {:hub_ids => []}, attachments: Attachment.attribute_names.collect { |att| att.to_sym })
  end
end
