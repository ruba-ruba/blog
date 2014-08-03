class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource class: Admin::PostsController
  inherit_resources
  actions :all, :except => :show

  private

  def post_params
    params.require(:post).permit!
    #params.require(:post).permit(:user_id, :title, :published, :content, :content_type, :tag_list, :type, {:hub_ids => []}, attachments: Attachment.attribute_names.collect { |att| att.to_sym })
  end
end
